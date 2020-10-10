{-# LANGUAGE PolyKinds #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeFamilies #-}

module Interpretator
  ( Interpretator (..)
  ) where

import Control.Monad.State
import Control.Applicative(liftA2)
import CppDsl
import Data.Map
import GHC.Float (double2Int)
import Type
import Control.Monad.Identity

type Vars = Map String MyRef

class Monad m => Console m where
  printStr :: String -> m ()

  readInt :: m Int

  readDouble :: m Double

  readBool :: m Bool

  readString :: m String

instance Console IO where
  printStr   = putStrLn

  readInt    = readLn :: IO Int

  readDouble = readLn :: IO Double

  readBool   = readLn :: IO Bool

  readString = readLn :: IO String

instance Console Identity where
  printStr _ = return ()

  readInt    = return 0

  readDouble = return 0.0

  readBool   = return False

  readString = return "test"

newtype Interpretator m s = Interpretator { interpret :: StateT Vars m s}

instance Console m => Functor (Interpretator m) where
  fmap func = Interpretator . fmap func . interpret

instance Console m => Applicative (Interpretator m) where
  pure = Interpretator . return

  (<*>) func a = Interpretator $ do
    f  <- interpret func
    a1 <- interpret a
    return $ f a1

instance Console m => Monad (Interpretator m) where
  (>>=) a func = Interpretator $ do
    a1 <- interpret a
    interpret $ func a1

defaultValue :: ProgType -> HValue
defaultValue PInt    = (HNumber (HInt 0))
defaultValue PDouble = (HNumber (HDouble 0))
defaultValue PString =  (HString "")
defaultValue PBool   =  (HBool False)

checkTyp :: HValue -> HValue -> HValue
checkTyp (HNumber (HInt _))    b@(HNumber (HInt _))    = b
checkTyp (HNumber (HInt _))    (HNumber (HDouble b))   =
  HNumber $ HInt (double2Int b)
checkTyp (HNumber (HInt _))    (HBool False)           = HNumber (HInt 0)
checkTyp (HNumber (HInt _))    (HBool True)            = HNumber (HInt 1)
checkTyp (HNumber       _)     (HString a)             =
  error $ "can't cast string " <> a <> " to number"
checkTyp (HString _)           (HNumber _)             =
  error $ "can't cast number to a string"
checkTyp (HNumber (HDouble _)) b@(HNumber (HDouble _)) = b
checkTyp (HNumber (HDouble _)) (HNumber (HInt b))      =
  HNumber $ HDouble (fromIntegral b)
checkTyp (HNumber (HDouble _)) (HBool _)               =
  error "trying to cast bool to double"
checkTyp (HBool _)             b@(HBool _)             = b
checkTyp (HBool _)             (HNumber (HInt b))      = HBool $ b > 0
checkTyp (HBool _)             (HNumber (HDouble _))   =
  error "trying to cast double to bool"
checkTyp (HBool _)             (HString _)             =
  error "trying to cast string to bool"
checkTyp (HString _)           b@(HString _)           = b
checkTyp (HString _)           (HBool _)               =
  error "trying to cast bool to a string"

toBoolValue :: HValue -> Bool
toBoolValue (HNumber (HInt    a)) = a > 0
toBoolValue (HNumber (HDouble a)) = a > 0
toBoolValue (HString          s)  = not (Prelude.null s)
toBoolValue (HBool            a)  = a

type MyRef = (Int, HValue)

readMyRef :: MyRef -> HValue
readMyRef a = snd a

writeMyRef :: MyRef -> HValue -> MyRef
writeMyRef var val =
  case fst var of
    0 -> (0, val)
    1 -> (2, val)
    2 -> (2, snd var)
    _ -> error "wrong mode"

newMyRef :: Int -> HValue -> MyRef
newMyRef mode val = (mode, val)

instance Console m => CppDsl (Interpretator m) where
  type Var (Interpretator m) = String

  (@~) a = Interpretator $ return (toVal a)

  (@+) = liftA2 helper
    where
      helper (HNumber a) (HNumber b) = HNumber $ a + b
      helper (HNumber a) (HBool   b) = HNumber $ a + HInt (fromEnum b)
      helper (HString a) (HString b) = HString $ a <> b
      helper (HBool   a) (HBool   b) = HBool $ a || b
      helper (HBool   a) (HNumber b) = HNumber $ HInt (fromEnum a) + b
      helper          a           b  =
        error $ "Can't add " <> show a <> " to " <> show b

  (@-) = liftA2 helper
    where
      helper (HNumber a) (HNumber b) = HNumber $ a - b
      helper (HNumber a) (HBool   b) = HNumber $ a - HInt (fromEnum b)
      helper (HBool   a) (HNumber b) = HNumber $ HInt (fromEnum a) - b
      helper          a           b  =
        error $ "Can't subtract " <> show a <> " and " <> show b

  (@*) = liftA2 helper
    where
      helper (HNumber a) (HNumber b) = HNumber $ a * b
      helper (HNumber a) (HBool   b) = HNumber $ a * HInt (fromEnum b)
      helper (HBool   a) (HNumber b) = HNumber $ HInt (fromEnum a) * b
      helper          a           b  =
        error $ "Can't multiply " <> show a <> " and " <> show b


  (@/) = liftA2 helper
    where
      helper (HNumber a) (HNumber b) = HNumber $ a / b
      helper (HNumber a) (HBool   b) = HNumber $ a / HInt (fromEnum b)
      helper (HBool   a) (HNumber b) = HNumber $ HInt (fromEnum a) / b
      helper          a           b  =
        error $ "Can't divide " <> show a <> " and " <> show b

  (@<)  = liftA2 (\a b -> HBool $ a < b)

  (@<=) = liftA2 (\a b -> HBool $ a <= b)

  (@>)  = liftA2 (\a b -> HBool $ a > b)

  (@>=) = liftA2 (\a b -> HBool $ a >= b)

  (@==) = liftA2 (\a b -> HBool $ a == b)

  (@/=) = liftA2 (\a b -> HBool $ a /= b)

  (#) = (>>)

  sCallFunc val = Interpretator $ do 
    _ <- interpret val
    return ()

  sCout val = Interpretator $ do 
    v <- interpret val
    lift $ printStr . show $ v

  sCin var = Interpretator $ do
    st <- get
    varName <- interpret var
    let ref    = (st ! varName)
    let refVal = readMyRef ref
    case refVal of
      (HNumber (HInt _)) -> do 
        let newVal   = readInt
                   >>= return . checkTyp refVal . HNumber . HInt
        let newST    = lift $ newVal >>= (\a ->
              return ((insert varName (writeMyRef ref a) st)))
        mapStateT (helper) newST
      (HNumber (HDouble _)) -> do 
        let newVal   = readDouble
                   >>= return . checkTyp refVal . HNumber . HDouble
        let newST    = lift $ newVal >>= (\a ->
              return ((insert varName (writeMyRef ref a) st)))
        mapStateT (helper) newST
      (HBool _) -> do 
        let newVal   = readBool
                   >>= return . checkTyp refVal . HBool
        let newST    = lift $ newVal >>= (\a ->
              return ((insert varName (writeMyRef ref a) st)))
        mapStateT (helper) newST
      (HString _) -> do 
        let newVal   = readString
                   >>= return . checkTyp refVal . HString
        let newST    = lift $ newVal >>= (\a ->
              return ((insert varName (writeMyRef ref a) st)))
        mapStateT (helper) newST
    where
      helper
        :: m (Map String MyRef, Map String MyRef)
        -> m ((), Map String MyRef)
      helper a = do
        (aa, _) <- a
        return ((), aa)

  (@=) var val = Interpretator $ do
    varName <- interpret var
    valVal  <- interpret val
    st      <- get
    let ref    = st ! varName
    let refVal = readMyRef ref
    put $ insert varName (writeMyRef ref (checkTyp refVal valVal)) st
  
  sWithVar typ name val' func = Interpretator $ do
    st  <- get
    val <- interpret val'
    let v = defaultValue typ
    put $ insert name (newMyRef 0 $ checkTyp v val) st
    interpret $ func (return name)
  
  sFun0 typ func = Interpretator $ do 
    let def     = defaultValue typ
    let resName = "FuncRes'"
    let newMp   = fromList [(resName, newMyRef 1 def)]
    let s       = execStateT (interpret (func (return resName))) newMp
    lift $ s  >>= (\a -> return . snd $ a ! resName)

  sFun1 typ func typ1 val1 = Interpretator $ do
    let resDefVal  = defaultValue typ
    let resName    = "FuncRes'"
    let arg1Name   = "arg1'"
    let arg1DefVal = defaultValue typ1
    arg1Val <- interpret val1
    let newSt = fromList [ (resName, newMyRef 1 resDefVal)
                         , (arg1Name, newMyRef 0 $ checkTyp arg1DefVal arg1Val) ]
    let s = execStateT (interpret (func (return arg1Name)
                                        (return resName))) newSt
    lift $ s >>= (\a -> return . snd $ a ! resName)

  sFun2 typ func typ1 typ2 var1 var2 = Interpretator $ do 
    let resDefVal  = defaultValue typ
    let resName    = "FuncRes'"
    let arg1Name   = "arg1'"
    let arg1DefVal = defaultValue typ1
    let arg2Name   = "arg2'"
    let arg2DefVal = defaultValue typ2
    arg1Val <- interpret var1
    arg2Val <- interpret var2
    let newSt = fromList [ (resName, newMyRef 1 resDefVal)
                         , (arg1Name, newMyRef 0 $ checkTyp arg1DefVal arg1Val)
                         , (arg2Name, newMyRef 0 $ checkTyp arg2DefVal arg2Val) ]
    let s = execStateT (interpret (func (return arg1Name)
                                        (return arg2Name)
                                        (return resName))) newSt
    lift $ s >>= (\a -> return . snd $ a ! resName)

  readVar var = Interpretator $ do
    st  <- get
    val <- interpret var
    return (snd $ st ! val)

  sWhile cond body = Interpretator $ do 
    flag <- interpret cond
    interpret (when (toBoolValue flag) $ body >> sWhile cond body)

  sIf cond a b = Interpretator $ do 
    flag <- interpret cond
    interpret (if toBoolValue flag 
               then a 
               else b)
  
  empt = return ()
