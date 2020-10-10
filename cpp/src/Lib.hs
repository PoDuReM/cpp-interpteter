{-# LANGUAGE DatatypeContexts #-}

module Lib
  ( toDslFunctions
  , FuncMap (..)
  , executeProgram
  ) where

import CppDsl
import Data.Map 
import Parser

type VarMap p = Map String (p (Var p))

data CppDsl p => FuncMap p = FuncMap 
  { arg0 :: Map String (p HValue)
  , arg1 :: Map String (p HValue -> p HValue)
  , arg2 :: Map String (p HValue -> p HValue -> p HValue)
  } 

executeProgram :: CppDsl p => [Function] -> p HValue
executeProgram f = 
  let arg0Mp = arg0 $ toDslFunctions (FuncMap empty empty empty) f in 
    if   member "main" arg0Mp
    then arg0Mp ! "main"
    else error "can't find function main with 0 arguments" 

toDslFunctions :: CppDsl p => FuncMap p -> [Function] -> FuncMap p
toDslFunctions mp (x:xs) = 
  case x of 
    (Function0 _ name _) -> 
      if   member name (arg0 mp)
      then error $ "function with name " <> name <> " already exists"
      else toDslFunctions mp{arg0=(insert name (toDslFunction0 mp x) (arg0 mp))} xs
    (Function1 _ name _ _ _) ->
      if   member name (arg1 mp)
      then error $ "function with name " <> name <> " already exists"
      else toDslFunctions mp{arg1=(insert name (toDslFunction1 mp x) (arg1 mp))} xs
    (Function2 _ name _ _ _ _ _) -> 
      if   member name (arg2 mp)
      then error $ "function with name " <> name <> " already exists"
      else toDslFunctions mp{arg2=(insert name (toDslFunction2 mp x) (arg2 mp))} xs
toDslFunctions mp [] = mp

toDslFunction0 :: CppDsl p => FuncMap p -> Function -> p HValue
toDslFunction0 mp (Function0 typ _ body) = sFun0  typ (\retFunc' -> 
  toDslBody mp (insert ("funcRetVal'") retFunc' empty) body)
toDslFunction0 _ _ = undefined

toDslFunction1 :: CppDsl p => FuncMap p -> Function -> p HValue -> p HValue
toDslFunction1 mp (Function1 typ1 _ typ2 name2 body) = 
  sFun1 typ1 (\arg1' retFunc' -> 
    let newFuncMap = fromList [("funcRetVal'", retFunc'), (name2, arg1')] in
      toDslBody mp newFuncMap body) typ2 
toDslFunction1 _ _ = undefined

toDslFunction2 :: CppDsl p => FuncMap p -> Function -> p HValue -> p HValue -> p HValue 
toDslFunction2 mp (Function2 typ1 _ typ2 name2 typ3 name3 body) = 
  sFun2 typ1 (\arg1' arg2' retFunc' -> 
    let newFuncMap =
          fromList [("funcRetVal'", retFunc'), (name2, arg1'), (name3, arg2')] in
      toDslBody mp newFuncMap body) typ2 typ3
toDslFunction2 _ _ = undefined

toDslBody :: CppDsl p => FuncMap p -> VarMap p -> [Statement] -> p ()
toDslBody mpF mp (x:xs) = 
  let toDslBody' = toDslBody mpF in
  let toDslExpr' = toDslExpr mpF mp in 
  case x of 
    (VarDecl typ name expr) -> 
      if   member name mp
      then error $ "variable " <> name <> " already exists"
      else sWithVar typ name (toDslExpr' expr) (\var ->
        toDslBody' (insert name var mp) xs)
    (VarAssi name expr) ->
      if   member name mp
      then (mp ! name) @= toDslExpr' expr # toDslBody' mp xs
      else error $ "variable " <> name <> " does not exist"
    (IfExpr a b c) -> sIf (toDslExpr' a)
                          (toDslBody' mp b)
                          (toDslBody' mp c) # toDslBody' mp xs
    (WhileExpr a b) -> sWhile (toDslExpr' a)
                              (toDslBody' mp b) # toDslBody' mp xs
    (Cout a) -> (sCout $ toDslExpr' a) # toDslBody' mp xs
    (Cin a)  -> if   member a mp
                then (sCin $ mp ! a) # toDslBody' mp xs
                else error $ "variable " <> a <> " does not exist"
    (FuncSCall0 name) -> if   member name (arg0 mpF)
                         then sCallFunc ((arg0 mpF) ! name) # toDslBody' mp xs
                         else error $  "function "
                                    <> name
                                    <> " with 0 arguments does not exists"
    (FuncSCall1 name expr) -> 
      if   member name (arg1 mpF)
      then sCallFunc (((arg1 mpF) ! name) $ toDslExpr' expr) # toDslBody' mp xs
      else error $ "function " <> name <> " with 1 arguments does not exists"
    (FuncSCall2 name expr1 expr2) -> 
      if member name (arg2 mpF)
      then sCallFunc (((arg2 mpF) ! name)
                      (toDslExpr' expr1)
                      (toDslExpr' expr2)) # toDslBody' mp xs
      else error $ "function " <> name <> " with 1 arguments does not exists"
toDslBody _ _ [] = empt

toDslExpr :: CppDsl p => FuncMap p -> VarMap p -> Expression -> p HValue
toDslExpr mpF mp expr = 
  let toDslExpr' = toDslExpr mpF mp in
  case expr of 
    (Add a b)     -> toDslExpr' a @+ toDslExpr' b
    (Sub a b)     -> toDslExpr' a @- toDslExpr' b
    (Mul a b)     -> toDslExpr' a @* toDslExpr' b
    (Div a b)     -> toDslExpr' a @/ toDslExpr' b
    (Le a b)      -> toDslExpr' a @< toDslExpr' b
    (Gt a b)      -> toDslExpr' a @> toDslExpr' b
    (Eq a b)      -> toDslExpr' a @== toDslExpr' b
    (Neq a b)     -> toDslExpr' a @/= toDslExpr' b
    (Geq a b)     -> toDslExpr' a @>= toDslExpr' b
    (Leq a b)     -> toDslExpr' a @<= toDslExpr' b
    (IntNum a)    -> (@~) a
    (DoubleNum a) -> (@~) a
    (BoolNum a)   -> (@~) a
    (Str a)       -> (@~) a
    (Var name)    -> if   member name mp
                     then readVar (mp ! name)
                     else error $ "can't find variable " <> name
    (FuncECall0 name) -> if   member name (arg0 mpF)
                         then ((arg0 mpF) ! name)
                         else error $ "can't find function " <> name
    (FuncECall1 name expr') -> if   member name (arg1 mpF)
                               then ((arg1 mpF) ! name) $ toDslExpr' expr'
                               else error $ "can't find function " <> name
    (FuncECall2 name expr1 expr2) ->
      if   member name (arg2 mpF)
      then ((arg2 mpF) ! name) (toDslExpr' expr1) (toDslExpr' expr2)
      else error $ "can't find function " <> name 
