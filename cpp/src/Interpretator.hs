{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeFamilies #-}

module Interpretator
  ( Interpretator (..)
  ) where

import CppDsl
import Data.IORef
import Control.Applicative(liftA2)
import Control.Monad (when)
import GHC.Float (double2Int)
import Type

newtype Interpretator s = Interpretator { interpret :: IO s}

instance Functor (Interpretator) where
  fmap func = Interpretator . fmap func . interpret

instance Applicative (Interpretator) where
  pure = Interpretator . return

  (<*>) func a = Interpretator (do
    f <- interpret func
    a1 <- interpret a
    return $ f a1)

instance Monad (Interpretator) where
  (>>=) a func = Interpretator (do
    a1 <- interpret a
    interpret $ func a1)

fillVar :: Int -> ProgType  -> IO (MyRef)
fillVar a PInt = newMyRef a $ HNumber (HInt 0)
fillVar a PDouble = newMyRef a $ HNumber (HDouble 0)
fillVar a PString = newMyRef a $ HString ""
fillVar a PBool = newMyRef a $ HBool False

checkTyp :: HValue -> HValue -> HValue
checkTyp (HNumber (HInt _)) b@(HNumber (HInt _)) = b
checkTyp (HNumber (HInt _)) (HNumber (HDouble b)) = HNumber $ HInt (double2Int b)
checkTyp (HNumber (HInt _)) (HBool False) = HNumber (HInt 0)
checkTyp (HNumber (HInt _)) (HBool True) = HNumber (HInt 1)
checkTyp (HNumber _) (HString a) = error $ "can't cast string " <> a <> " to number"
checkTyp (HString _) (HNumber _) = error $ "can't cast number to a string"
checkTyp (HNumber (HDouble _)) b@(HNumber (HDouble _)) = b
checkTyp (HNumber (HDouble _)) (HNumber (HInt b)) = HNumber $ HDouble (fromIntegral b)
checkTyp (HNumber (HDouble _)) (HBool _) = error "trying to cast bool to double"
checkTyp (HBool _) b@(HBool _) = b
checkTyp (HBool _) (HNumber (HInt b)) = HBool $ b > 0
checkTyp (HBool _) (HNumber (HDouble _)) = error "trying to cast double to bool"
checkTyp (HBool _) (HString _) = error "trying to cast string to bool"
checkTyp (HString _) b@(HString _) = b
checkTyp (HString _) (HBool _) = error "trying to cast bool to a string"

toBoolValue :: HValue -> Bool
toBoolValue (HNumber (HInt a)) = a > 0
toBoolValue (HNumber (HDouble a)) = a > 0
toBoolValue (HString s) = not (null s)
toBoolValue (HBool a) = a

type MyRef = IORef (Int, HValue)

readMyRef :: MyRef -> IO HValue
readMyRef a = do 
  val <- readIORef a 
  return $ snd val

writeMyRef :: MyRef -> HValue -> IO ()
writeMyRef a val = do 
  av <- readIORef a
  case fst av of 
    0 -> writeIORef a (0, val)
    1 -> writeIORef a (2, val)
    2 -> return ()
    _ -> error "wrong mode"

newMyRef :: Int -> HValue -> IO (MyRef) 
newMyRef mode val = newIORef (mode, val)

instance CppDsl (Interpretator) where
  type Var (Interpretator) = MyRef

  (@~) a = Interpretator $ return (toVal a)

  (@+) = liftA2 helper
    where
      helper (HNumber a) (HNumber b) = HNumber $ a + b
      helper (HNumber a) (HBool   b) = HNumber $ a + HInt (fromEnum b)
      helper (HString a) (HString b) = HString $ a <> b
      helper (HBool   a) (HBool   b) = HBool $ a || b
      helper (HBool   a) (HNumber b) = HNumber $ HInt (fromEnum a) + b
      helper a           b           = error $ "Can't add " <> show a <> " to " <> show b

  (@-) = liftA2 helper
    where
      helper (HNumber a) (HNumber b) = HNumber $ a - b
      helper (HNumber a) (HBool   b) = HNumber $ a - HInt (fromEnum b)
      helper (HBool   a) (HNumber b) = HNumber $ HInt (fromEnum a) - b
      helper a           b           = error $ "Can't subtract " <> show a <> " and " <> show b

  (@*) = liftA2 helper
    where
      helper (HNumber a) (HNumber b) = HNumber $ a * b
      helper (HNumber a) (HBool   b) = HNumber $ a * HInt (fromEnum b)
      helper (HBool   a) (HNumber b) = HNumber $ HInt (fromEnum a) * b
      helper a           b           = error $ "Can't multiply " <> show a <> " and " <> show b


  (@/) = liftA2 helper
    where
      helper (HNumber a) (HNumber b) = HNumber $ a / b
      helper (HNumber a) (HBool   b) = HNumber $ a / HInt (fromEnum b)
      helper (HBool   a) (HNumber b) = HNumber $ HInt (fromEnum a) / b
      helper a           b           = error $ "Can't divide " <> show a <> " and " <> show b


  (@<) a b = Interpretator (do
    a1 <- interpret a
    b1 <- interpret b
    return (HBool $ a1 < b1))
  (@<=) a b = Interpretator (do
    a1 <- interpret a
    b1 <- interpret b
    return (HBool $ a1 <= b1))
  (@>) a b = Interpretator (do
    a1 <- interpret a
    b1 <- interpret b
    return (HBool $ a1 > b1))
  (@>=) a b = Interpretator (do
    a1 <- interpret a
    b1 <- interpret b
    return (HBool $ a1 >= b1))
  (@==) a b = Interpretator (do
    a1 <- interpret a
    b1 <- interpret b
    return (HBool $ a1 == b1))
  (@/=) a b = Interpretator (do
    a1 <- interpret a
    b1 <- interpret b
    return (HBool $ a1 /= b1))

  (#) = (>>)

  sCallFunc val = Interpretator $ do 
    _ <- interpret val
    return ()

  sCout val = Interpretator $ do 
    val1 <- interpret val 
    putStrLn $ show val1
  
  sCin var = Interpretator $ do 
    v <- interpret var
    v1 <- readMyRef v
    case v1 of 
      (HNumber (HInt _)) -> do 
        val <- readLn :: IO Int
        writeMyRef v (HNumber (HInt val))
      (HNumber (HDouble _)) -> do 
        val <- readLn :: IO Double
        writeMyRef v (HNumber (HDouble val))
      (HBool _) -> do 
        val <- readLn :: IO Bool 
        writeMyRef v (HBool val)
      (HString _) -> do 
        val <- readLn :: IO String 
        writeMyRef v (HString val)

  (@=) var val = Interpretator $ do
    var1 <- interpret var
    val1 <- interpret val
    var1Val <- readMyRef var1
    writeMyRef var1 $ checkTyp var1Val val1 
  
  sWithVar typ val func = Interpretator $ do
    val1 <- interpret val
    v <- fillVar 0 typ
    vVal <- readMyRef v
    writeMyRef v $ checkTyp vVal val1
    interpret $ func (return v)
  
  sFun0 typ func = Interpretator $ do 
    res <- fillVar 1 typ
    interpret $ func (return res)
    readMyRef res

  sFun1 typ func typ1 val1 = Interpretator $ do
    res <- fillVar 1 typ
    arg1 <- fillVar 0 typ1
    arg1Val <- readMyRef arg1
    val1Val <- interpret val1
    writeMyRef arg1 (checkTyp arg1Val val1Val)
    interpret $ func (return arg1) (return res)
    readMyRef res
    
  sFun2 typ func typ1 typ2 var1 var2 = Interpretator $ do 
    res <- fillVar 1 typ
    arg1 <- fillVar 0 typ1
    arg2 <- fillVar 0 typ2
    arg1Val <- readMyRef arg1
    arg2Val <- readMyRef arg2
    var1Val <- interpret var1
    var2Val <- interpret var2
    writeMyRef arg1 (checkTyp arg1Val var1Val)
    writeMyRef arg2 (checkTyp arg2Val var2Val)
    interpret $ func (return arg1) (return arg2) (return res)
    readMyRef res

  readVar var = Interpretator $ do
    var1 <- interpret var
    readMyRef var1

  sWhile cond body = Interpretator $ do 
    flag <- interpret cond
    interpret (when (toBoolValue flag) $ body >> sWhile cond body)

  sIf cond a b = Interpretator $ do 
    flag <- interpret cond
    interpret (if toBoolValue flag 
               then a 
               else b)
  
  empt = return ()
