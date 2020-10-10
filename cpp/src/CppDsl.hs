{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeFamilies #-}

module CppDsl
  ( CppDsl (..)
  , HValue (..)
  , HNumber (..)
  , MyType (..)
  , test
  ) where

import Type
import Data.Typeable

data HNumber = HInt Int | HDouble Double

instance Eq HNumber where
  (==) (HInt    a) (HInt    b) = a == b
  (==) (HInt    a) (HDouble b) = fromIntegral a == b
  (==) (HDouble a) (HInt    b) = a == fromIntegral b
  (==) (HDouble a) (HDouble b) = a == b

instance Ord HNumber where
  (<=) (HInt    a) (HInt    b) = a <= b
  (<=) (HInt    a) (HDouble b) = fromIntegral a <= b
  (<=) (HDouble a) (HInt    b) = a <= fromIntegral b
  (<=) (HDouble a) (HDouble b) = a <= b

instance Show HNumber where
  show (HInt    a) = show a
  show (HDouble a) = show a

instance Num HNumber where
  (+) (HInt    x) (HInt    y) = HInt $ x + y
  (+) (HInt    x) (HDouble y) = HDouble $ fromIntegral x + y
  (+) (HDouble x) (HDouble y) = HDouble $ x + y
  (+) (HDouble x) (HInt    y) = HDouble $ x + fromIntegral y

  (*) (HInt    x) (HInt    y) = HInt $ x * y
  (*) (HInt    x) (HDouble y) = HDouble $ fromIntegral x * y
  (*) (HDouble x) (HDouble y) = HDouble $ x * y
  (*) (HDouble x) (HInt    y) = HDouble $ x * fromIntegral y

  (-) (HInt    x) (HInt    y) = HInt $ x - y
  (-) (HInt    x) (HDouble y) = HDouble $ fromIntegral x - y
  (-) (HDouble x) (HDouble y) = HDouble $ x - y
  (-) (HDouble x) (HInt    y) = HDouble $ x - fromIntegral y

  abs (HInt    x) = HInt $ abs x
  abs (HDouble x) = HDouble $ abs x

  signum (HInt    x) = HInt $ signum x
  signum (HDouble x) = HDouble $ signum x

  fromInteger x = HInt $ fromInteger x

instance Fractional HNumber where
  fromRational a = HDouble $ fromRational a

  (/) (HInt    x) (HInt    y) = HInt $ x `div` y
  (/) (HInt    x) (HDouble y) = HDouble $ fromIntegral x / y
  (/) (HDouble x) (HDouble y) = HDouble $ x / y
  (/) (HDouble x) (HInt    y) = HDouble $ x / fromIntegral y

data HValue = HNumber HNumber
            | HBool Bool
            | HString String

instance Show HValue where
  show (HNumber a) = show a
  show (HBool   a) = show a
  show (HString a) = a

instance Eq HValue where 
  (==) (HNumber a) (HNumber b) = a == b
  (==) (HBool   a) (HBool   b) = a == b
  (==) (HString a) (HString b) = a == b
  (==)          a           b  =
    error $ "can't compare " <> show a <> " " <> show b

instance Ord HValue where 
  (<=) (HNumber a) (HNumber b) = a <= b 
  (<=) (HBool   a) (HBool   b) = a <= b
  (<=) (HString a) (HString b) = a <= b 
  (<=)          a           b  =
    error $ "can't compare " <> show a <> " " <> show b

class (Show t, Typeable t) => MyType t where
  toVal :: t -> HValue 

instance MyType Int where
  toVal x = HNumber $ HInt x

instance MyType Double where
  toVal x = HNumber $ HDouble x

instance MyType String where
  toVal = HString

instance MyType Bool where
  toVal = HBool

class CppDsl prog where
  type Var prog :: *

  infix 9 @~
  (@~) :: MyType a => a -> prog HValue

  infixl 6 @+
  (@+) :: prog HValue -> prog HValue -> prog HValue

  infixl 6 @-
  (@-) :: prog HValue -> prog HValue -> prog HValue

  infixl 7 @*
  (@*) :: prog HValue -> prog HValue -> prog HValue

  infixl 7 @/
  (@/) :: prog HValue -> prog HValue -> prog HValue

  infix 4 @<
  (@<) :: prog HValue -> prog HValue -> prog HValue

  infix 4 @<=
  (@<=) :: prog HValue -> prog HValue -> prog HValue

  infix 4 @>
  (@>) :: prog HValue -> prog HValue -> prog HValue

  infix 4 @>=
  (@>=) :: prog HValue -> prog HValue -> prog HValue

  infix 4 @==
  (@==) :: prog HValue -> prog HValue -> prog HValue

  infix 4 @/=
  (@/=) :: prog HValue -> prog HValue -> prog HValue
  infix 3 @=
  (@=) :: prog (Var prog) -> prog HValue -> prog ()

  infixl 1 #
  (#) :: prog () -> prog () -> prog ()

  sCin :: prog (Var prog) -> prog ()

  sCout :: prog HValue -> prog ()

  sCallFunc :: prog HValue -> prog ()

  sWithVar
    :: ProgType
    -> String
    -> prog HValue
    -> (prog (Var prog) -> prog ())
    -> prog ()
  
  sFun0 :: ProgType -> (prog (Var prog) -> prog ()) -> prog HValue

  sFun1
    :: ProgType
    -> (prog (Var prog) -> prog (Var prog) -> prog ())
    -> ProgType
    -> prog HValue
    -> prog HValue

  sFun2
    :: ProgType
    -> (prog (Var prog) -> prog (Var prog) -> prog (Var prog) -> prog ())
    -> ProgType
    -> ProgType
    -> prog HValue
    -> prog HValue
    -> prog HValue

  readVar :: prog (Var prog) -> prog HValue

  sWhile :: prog HValue -> prog () -> prog ()

  sIf :: prog HValue -> prog () -> prog () -> prog ()

  empt :: prog ()


test :: CppDsl p => p HValue
test = undefined