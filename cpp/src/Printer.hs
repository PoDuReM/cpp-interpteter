{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE DeriveDataTypeable #-}
module Printer
  ( Printer (..)
  ) where

import CppDsl
import Data.IORef
import Data.Typeable

newtype Printer a = Printer { toStr :: IORef Int -> String -> IO String }

stripBeginWhiteSpaces :: String -> String
stripBeginWhiteSpaces (x:xs) = if x == ' '
                               then stripBeginWhiteSpaces xs
                               else x : xs
stripBeginWhiteSpaces [] = ""

instance CppDsl Printer where
  type (Var Printer) = String

  (@~) a = Printer (\_ _ -> return $ "(@~)(" <> show a <> " :: " <> show (typeOf a) <> ")")

  (@+) a b = Printer (\v pr -> do 
    sa <- toStr a v pr
    sb <- toStr b v pr
    return $ "(" <> stripBeginWhiteSpaces sa  <> " @+ " <> stripBeginWhiteSpaces sb <> ")")
  (@*) a b = Printer (\v pr -> do 
    sa <- toStr a v pr
    sb <- toStr b v pr
    return $ "(" <> stripBeginWhiteSpaces sa  <> " @* " <> stripBeginWhiteSpaces sb <> ")")
  (@-) a b = Printer (\v pr -> do 
    sa <- toStr a v pr
    sb <- toStr b v pr
    return $ "(" <> stripBeginWhiteSpaces sa  <> " @- " <> stripBeginWhiteSpaces sb <> ")")
  (@/) a b = Printer (\v pr -> do 
    sa <- toStr a v pr
    sb <- toStr b v pr
    return $ "(" <> stripBeginWhiteSpaces sa <> " @/ " <> stripBeginWhiteSpaces sb <> ")")

  (@<) a b = Printer (\v pr -> do 
    sa <- toStr a v pr
    sb <- toStr b v pr
    return $ "(" <> stripBeginWhiteSpaces sa <> " @< " <> stripBeginWhiteSpaces sb <> ")")
  (@<=) a b = Printer (\v pr -> do 
    sa <- toStr a v pr
    sb <- toStr b v pr
    return $ "(" <> stripBeginWhiteSpaces sa <> " @<= " <> stripBeginWhiteSpaces sb <> ")")
  (@>) a b = Printer (\v pr -> do 
    sa <- toStr a v pr
    sb <- toStr b v pr
    return $ "(" <> stripBeginWhiteSpaces sa <> " @> " <> stripBeginWhiteSpaces sb <> ")")
  (@>=) a b = Printer (\v pr -> do 
    sa <- toStr a v pr
    sb <- toStr b v pr
    return $ "(" <> stripBeginWhiteSpaces sa  <> " @>= " <> stripBeginWhiteSpaces sb <> ")")
  (@==) a b = Printer (\v pr -> do 
    sa <- toStr a v pr
    sb <- toStr b v pr
    return $ "(" <> stripBeginWhiteSpaces sa <> " @== " <> stripBeginWhiteSpaces sb <> ")")
  (@/=) a b = Printer (\v pr -> do 
    sa <- toStr a v pr
    sb <- toStr b v pr
    return $ "(" <> stripBeginWhiteSpaces sa <> " @/= " <> stripBeginWhiteSpaces sb <> ")")

  (#) a b = Printer (\v pr -> do 
    sa <- toStr a v pr
    sb <- toStr b v pr
    return $ sa <> " #\n" <> sb)
  (@=) a b = Printer (\v pr -> do 
    sa <- toStr a v pr
    sb <- toStr b v pr
    return $ pr <> stripBeginWhiteSpaces sa  <> " @= " <> stripBeginWhiteSpaces sb)

  sWithVar typ var func = Printer (\v pr -> do 
    num <- readIORef v
    writeIORef v (num + 1)
    v1 <- toStr var v pr
    let retStr = "v" <> show num
    f1 <- toStr (func $ Printer (\_ _ -> return retStr)) v (pr <> "  ")
    return $ pr <> "sWithVar " <> show typ <> " ("  
                <> stripBeginWhiteSpaces v1 <> ") (\\" <> retStr <> " ->\n" 
                <> f1 <> ")")

  sFun0 typ func = Printer (\v pr -> do 
    num <- readIORef v
    writeIORef v (num + 1)
    let retStr = "v" <> show num
    f1 <- toStr (func (Printer (\_ _ -> return retStr))) v (pr <> "  ")
    return $ pr <> "sFun0 " <> show typ <> " (\\" <> retStr <> " ->\n" 
                <> f1 <> ")")

  sFun1 typ func typ1 arg1 = Printer (\v pr -> do 
    num <- readIORef v
    let retStr = "v" <> show num
    let arg1Str = "v" <> show (num + 1)
    writeIORef v (num + 2)
    a1 <- toStr arg1 v pr
    f1 <- toStr (func (Printer (\_ _ -> return arg1Str)) 
                      (Printer (\_ _ -> return retStr))) v (pr <> "  ")
    return $ pr <> "sFun1 " <> show typ <> " (\\" <> arg1Str <> " " <> retStr <> " ->\n" 
                <> f1 <> ") " <> show typ1 <> " (" 
                <> stripBeginWhiteSpaces a1 <> ")")

  sFun2 typ func typ1 typ2 arg1 arg2 = Printer (\v pr -> do 
    num <- readIORef v 
    let retStr = "v" <> show num 
    let arg1Str = "v" <> show (num + 1)
    let arg2Str = "v" <> show (num + 2)
    writeIORef v (num + 3)
    a1 <- toStr arg1 v pr 
    a2 <- toStr arg2 v pr 
    f1 <- toStr (func (Printer (\_ _ -> return arg1Str)) 
                      (Printer (\_ _ -> return arg2Str))
                      (Printer (\_ _ -> return retStr))) v (pr <> "  ")
    return $ pr <> "sFun2 " <> show typ <> " (\\" <> arg1Str <> " " <> arg2Str <> " " <> retStr
                <> " ->\n" <> f1 <> ") " <> show typ1 <> " " 
                <> show typ2 <> " (" <> stripBeginWhiteSpaces a1
                <> ") (" <> stripBeginWhiteSpaces a2 <> ")")

  readVar a = Printer (\v pr -> do
    v1 <- toStr a v pr
    return $ "(readVar " <> v1 <> ")")

  sWhile a b = Printer (\v pr -> do
    a1 <- toStr a v pr
    b1 <- toStr b v (pr <> "  ")
    return $ pr <> "sWhile (" <> stripBeginWhiteSpaces a1 <> ") (\n" <> b1 <> ")")
  
  sIf a b c = Printer (\v pr -> do 
    a1 <- toStr a v pr
    b1 <- toStr b v (pr <> "  ")
    c1 <- toStr c v (pr <> "  ")
    return $ pr <> "sIf (" <> stripBeginWhiteSpaces a1 <> ") (\n" <> b1 <> ") (\n" <> c1 <> ")")
  
  sCin a = Printer (\v pr -> do 
    a1 <- toStr a v pr 
    return $ pr <> "sCin (" <> stripBeginWhiteSpaces a1 <> ")") 
  
  sCout a = Printer (\v pr -> do 
    a1 <- toStr a v pr 
    return $ pr <> "sCout (" <> stripBeginWhiteSpaces a1 <> ")") 
  
  sCallFunc a = Printer (\v pr -> do 
    a1 <- toStr a v pr 
    return $ pr <> "sCallFunc (" <> stripBeginWhiteSpaces a1 <> ")")

  empt = Printer (\_ pr -> return $ pr <> "empt")
