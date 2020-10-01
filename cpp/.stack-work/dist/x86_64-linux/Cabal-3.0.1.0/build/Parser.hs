{-# OPTIONS_GHC -w #-}
{-# OPTIONS -XMagicHash -XBangPatterns -XTypeSynonymInstances -XFlexibleInstances -cpp #-}
#if __GLASGOW_HASKELL__ >= 710
{-# OPTIONS_GHC -XPartialTypeSignatures #-}
#endif
module Parser where
import Lexer
import Type
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import qualified GHC.Exts as Happy_GHC_Exts
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.12

newtype HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 = HappyAbsSyn HappyAny
#if __GLASGOW_HASKELL__ >= 607
type HappyAny = Happy_GHC_Exts.Any
#else
type HappyAny = forall a . a
#endif
happyIn4 :: t4 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11)
happyIn4 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn4 #-}
happyOut4 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11) -> t4
happyOut4 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut4 #-}
happyIn5 :: t5 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11)
happyIn5 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn5 #-}
happyOut5 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11) -> t5
happyOut5 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut5 #-}
happyIn6 :: t6 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11)
happyIn6 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn6 #-}
happyOut6 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11) -> t6
happyOut6 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut6 #-}
happyIn7 :: t7 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11)
happyIn7 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn7 #-}
happyOut7 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11) -> t7
happyOut7 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut7 #-}
happyIn8 :: t8 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11)
happyIn8 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn8 #-}
happyOut8 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11) -> t8
happyOut8 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut8 #-}
happyIn9 :: t9 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11)
happyIn9 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn9 #-}
happyOut9 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11) -> t9
happyOut9 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut9 #-}
happyIn10 :: t10 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11)
happyIn10 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn10 #-}
happyOut10 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11) -> t10
happyOut10 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut10 #-}
happyIn11 :: t11 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11)
happyIn11 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn11 #-}
happyOut11 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11) -> t11
happyOut11 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut11 #-}
happyInTok :: (Token) -> (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11)
happyInTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyInTok #-}
happyOutTok :: (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11) -> (Token)
happyOutTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOutTok #-}


happyExpList :: HappyAddr
happyExpList = HappyA# "\x00\x08\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x80\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x01\x00\x00\xd8\x05\x00\x20\x00\x00\x00\x80\x10\x00\x00\x00\x00\x10\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x80\x5d\x00\x00\x02\x00\x00\x00\x00\x20\x00\x00\x00\x40\x00\x00\x00\x00\x00\x04\xe0\x03\x00\x00\x40\x00\x3e\x00\x00\x02\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x10\x04\x00\x00\x00\x00\x40\x00\x3e\x00\x00\x00\x0c\xe0\x03\x00\x00\x00\x00\x02\x00\x00\x00\x04\xe0\x03\x00\x00\x00\xed\x01\x00\x00\x60\x00\x00\x00\x00\x00\x18\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x3e\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\xec\x01\x00\x00\x00\x04\xe0\x03\x00\x00\x21\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x80\x5d\x00\x00\x02\x00\x00\x00\x20\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x04\xe0\x03\x00\x00\x00\x00\x00\x00\x00\x00\xc8\x1e\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\xe0\x03\x00\x00\x40\x00\x3e\x00\x00\x00\x04\xe0\x03\x00\x00\x40\x00\x3e\x00\x00\x00\x04\xe0\x03\x00\x00\x40\x00\x3e\x00\x00\x00\x0c\xe0\x03\x00\x00\x80\xec\x01\x00\x00\x00\x04\xe0\x03\x00\x00\x40\x00\x3e\x00\x00\x00\x04\xe0\x03\x00\x00\x40\x00\x3e\x00\xd8\x05\x00\x20\x00\x00\x00\x20\xec\x01\x00\x00\x00\x02\x00\x00\x00\x00\x80\xfc\x01\x00\x00\x00\x02\x00\x00\x00\x00\x20\xec\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x40\x00\x3e\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x18\x00\x00\x00\x00\x80\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc8\x1f\x00\x00\x00\x00\x00\x00\x00\x00\x60\x00\x00\x00\x00\x00\x06\x00\x00\x00\x00\x60\x00\x00\x00\x00\x00\x06\x00\x00\x00\x00\x60\x00\x00\x00\x00\x00\x06\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x20\xec\x01\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\xd8\x05\x00\x20\x00\x00\x00\x00\x00\x00\x00\xd8\x05\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\xe0\x03\x00\x00\x00\x00\x00\x00\x00\x00\xc8\x1e\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x80\xec\x01\x00\x00\x00\x20\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x80\x5d\x00\x00\x02\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parses","Functions","Function","Body","Statement","Expr","Expr2","Expr3","Expr4","type","if","else","return","while","cout","'<<'","cin","'>>'","'='","'+'","'-'","'*'","'/'","';'","'('","')'","'{'","'}'","'<'","'>'","','","'=='","'<='","'>='","'!='","name","bool","int","double","str","'\"'","%eof"]
        bit_start = st * 44
        bit_end = (st + 1) * 44
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..43]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

happyActOffsets :: HappyAddr
happyActOffsets = HappyA# "\x07\x00\x07\x00\x07\x00\xf6\xff\x24\x00\x4c\x00\x00\x00\x03\x00\x4b\x00\x5e\x00\x01\x00\x72\x00\x68\x00\xc8\x00\xc7\x00\x01\x00\x65\x00\xc9\x00\xf1\xff\xf1\xff\xcf\x00\xd3\x00\x34\x00\xf1\xff\xfa\xff\xbc\x00\xf1\xff\x6d\x00\x0f\x00\x41\x00\x00\x00\xf1\xff\xcb\x00\x00\x00\x00\x00\x00\x00\x00\x00\x13\x00\xf1\xff\x7f\x00\x00\x00\x00\x00\xc2\x00\x01\x00\xcd\x00\xd1\x00\xf1\xff\x00\x00\x46\x00\x00\x00\xf1\xff\xf1\xff\xf1\xff\xf1\xff\xf1\xff\xf1\xff\x02\x00\x50\x00\xf1\xff\xf1\xff\xf1\xff\xf1\xff\x01\x00\x1a\x00\xd4\x00\x32\x00\xd5\x00\x21\x00\x00\x00\x00\x00\xd6\x00\xf1\xff\x00\x00\x00\x00\xd7\x00\x41\x00\x41\x00\x00\x00\x00\x00\x00\x00\x3c\x00\x00\x00\x4d\x00\x4d\x00\x4d\x00\x4d\x00\x4d\x00\x4d\x00\xd9\x00\x28\x00\xda\x00\x00\x00\x01\x00\x00\x00\x01\x00\x00\x00\xf1\xff\x00\x00\x5a\x00\x00\x00\xd8\x00\x64\x00\xdb\x00\xdc\x00\x00\x00\xde\x00\x00\x00\x00\x00\xdf\x00\x01\x00\xdd\x00\x00\x00\x00\x00"#

happyGotoOffsets :: HappyAddr
happyGotoOffsets = HappyA# "\x62\x00\xe5\x00\x6c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x74\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc3\x00\x00\x00\x00\x00\x1f\x00\x86\x00\x00\x00\x00\x00\x00\x00\x8b\x00\x8f\x00\x00\x00\x93\x00\x00\x00\x00\x00\x00\x00\x00\x00\x97\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x9b\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc5\x00\x00\x00\x00\x00\x9f\x00\x00\x00\x00\x00\x00\x00\xae\x00\xb1\x00\xb4\x00\xb7\x00\xba\x00\xbd\x00\xa3\x00\x00\x00\xe1\x00\xe2\x00\xc4\x00\xc6\x00\xcc\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xa7\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xce\x00\x00\x00\xd0\x00\x00\x00\xab\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xd2\x00\x00\x00\x00\x00\x00\x00"#

happyAdjustOffset :: Happy_GHC_Exts.Int# -> Happy_GHC_Exts.Int#
happyAdjustOffset off = off

happyDefActions :: HappyAddr
happyDefActions = HappyA# "\xfd\xff\x00\x00\xfd\xff\x00\x00\x00\x00\x00\x00\xfe\xff\x00\x00\x00\x00\x00\x00\xf8\xff\x00\x00\x00\x00\x00\x00\x00\x00\xf8\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xe5\xff\xe2\xff\xdf\xff\x00\x00\xd9\xff\xd6\xff\xdd\xff\xd7\xff\xd8\xff\x00\x00\x00\x00\x00\x00\xf9\xff\xfc\xff\x00\x00\xf8\xff\x00\x00\x00\x00\x00\x00\xf6\xff\x00\x00\xef\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xf8\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xf5\xff\xee\xff\x00\x00\x00\x00\xf0\xff\xf1\xff\x00\x00\xe3\xff\xe4\xff\xe0\xff\xe1\xff\xde\xff\x00\x00\xdc\xff\xe6\xff\xe7\xff\xe8\xff\xe9\xff\xea\xff\xeb\xff\x00\x00\x00\x00\x00\x00\xfb\xff\xf8\xff\xf7\xff\xf8\xff\xdb\xff\x00\x00\xf2\xff\x00\x00\xed\xff\x00\x00\x00\x00\x00\x00\x00\x00\xfa\xff\xf3\xff\xda\xff\xec\xff\x00\x00\xf8\xff\x00\x00\xf4\xff"#

happyCheck :: HappyAddr
happyCheck = HappyA# "\xff\xff\x10\x00\x01\x00\x02\x00\x01\x00\x04\x00\x05\x00\x06\x00\x01\x00\x08\x00\x10\x00\x11\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x1b\x00\x10\x00\x11\x00\x11\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x0b\x00\x0c\x00\x1b\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x0f\x00\x04\x00\x05\x00\x06\x00\x07\x00\x14\x00\x15\x00\x0f\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x14\x00\x15\x00\x0f\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x14\x00\x15\x00\x0f\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x14\x00\x15\x00\x0a\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x11\x00\x10\x00\x21\x00\x14\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x11\x00\x0d\x00\x0e\x00\x14\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x11\x00\x0b\x00\x0c\x00\x14\x00\x15\x00\x10\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x11\x00\x00\x00\x01\x00\x14\x00\x15\x00\x1b\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x11\x00\x00\x00\x01\x00\x14\x00\x15\x00\x12\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x11\x00\x02\x00\x03\x00\x14\x00\x15\x00\x12\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x12\x00\x1b\x00\x14\x00\x15\x00\x11\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x16\x00\x0a\x00\x04\x00\x05\x00\x06\x00\x07\x00\x0f\x00\x04\x00\x05\x00\x06\x00\x07\x00\x04\x00\x05\x00\x06\x00\x07\x00\x04\x00\x05\x00\x06\x00\x07\x00\x04\x00\x05\x00\x06\x00\x07\x00\x04\x00\x05\x00\x06\x00\x07\x00\x04\x00\x05\x00\x06\x00\x07\x00\x04\x00\x05\x00\x06\x00\x07\x00\x04\x00\x05\x00\x06\x00\x07\x00\x04\x00\x05\x00\x06\x00\x07\x00\x05\x00\x06\x00\x07\x00\x05\x00\x06\x00\x07\x00\x05\x00\x06\x00\x07\x00\x05\x00\x06\x00\x07\x00\x05\x00\x06\x00\x07\x00\x05\x00\x06\x00\x07\x00\x02\x00\x03\x00\x02\x00\x03\x00\x01\x00\x06\x00\x07\x00\x06\x00\x07\x00\x02\x00\x03\x00\x02\x00\x03\x00\x02\x00\x03\x00\x02\x00\x03\x00\x07\x00\x1b\x00\xff\xff\x10\x00\x13\x00\x10\x00\x09\x00\x1b\x00\xff\xff\xff\xff\x13\x00\x03\x00\x11\x00\x0f\x00\x0f\x00\x0f\x00\x01\x00\x0f\x00\x07\x00\x07\x00\x13\x00\x12\x00\x12\x00\xff\xff\x13\x00\x13\x00\x13\x00\x12\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"#

happyTable :: HappyAddr
happyTable = HappyA# "\x00\x00\x20\x00\x11\x00\x12\x00\x09\x00\x13\x00\x14\x00\x15\x00\x04\x00\x16\x00\x20\x00\x43\x00\x21\x00\x22\x00\x23\x00\x24\x00\x25\x00\x06\x00\x20\x00\x52\x00\x0a\x00\x21\x00\x22\x00\x23\x00\x24\x00\x25\x00\x3d\x00\x3e\x00\x17\x00\x21\x00\x22\x00\x23\x00\x24\x00\x25\x00\x32\x00\x25\x00\x1c\x00\x1d\x00\x1e\x00\x33\x00\x34\x00\x4a\x00\x35\x00\x36\x00\x37\x00\x38\x00\x33\x00\x34\x00\x45\x00\x35\x00\x36\x00\x37\x00\x38\x00\x33\x00\x34\x00\x5e\x00\x35\x00\x36\x00\x37\x00\x38\x00\x33\x00\x34\x00\x18\x00\x35\x00\x36\x00\x37\x00\x38\x00\x47\x00\x19\x00\xff\xff\x33\x00\x34\x00\x48\x00\x35\x00\x36\x00\x37\x00\x38\x00\x60\x00\x3b\x00\x3c\x00\x33\x00\x34\x00\x61\x00\x35\x00\x36\x00\x37\x00\x38\x00\x59\x00\x3d\x00\x3e\x00\x33\x00\x34\x00\x08\x00\x35\x00\x36\x00\x37\x00\x38\x00\x50\x00\x04\x00\x02\x00\x33\x00\x34\x00\x0c\x00\x35\x00\x36\x00\x37\x00\x38\x00\x65\x00\x06\x00\x02\x00\x33\x00\x34\x00\x0b\x00\x35\x00\x36\x00\x37\x00\x38\x00\x6b\x00\x0e\x00\x0f\x00\x33\x00\x34\x00\x2c\x00\x35\x00\x36\x00\x37\x00\x38\x00\x3f\x00\x28\x00\x33\x00\x34\x00\x0d\x00\x35\x00\x36\x00\x37\x00\x38\x00\x0e\x00\x2f\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x30\x00\x43\x00\x1c\x00\x1d\x00\x1e\x00\x41\x00\x1c\x00\x1d\x00\x1e\x00\x3f\x00\x1c\x00\x1d\x00\x1e\x00\x39\x00\x1c\x00\x1d\x00\x1e\x00\x30\x00\x1c\x00\x1d\x00\x1e\x00\x59\x00\x1c\x00\x1d\x00\x1e\x00\x50\x00\x1c\x00\x1d\x00\x1e\x00\x62\x00\x1c\x00\x1d\x00\x1e\x00\x65\x00\x1c\x00\x1d\x00\x1e\x00\x57\x00\x1d\x00\x1e\x00\x56\x00\x1d\x00\x1e\x00\x55\x00\x1d\x00\x1e\x00\x54\x00\x1d\x00\x1e\x00\x53\x00\x1d\x00\x1e\x00\x52\x00\x1d\x00\x1e\x00\x28\x00\x0f\x00\x2c\x00\x0f\x00\x2b\x00\x4c\x00\x1e\x00\x4b\x00\x1e\x00\x4a\x00\x0f\x00\x67\x00\x0f\x00\x66\x00\x0f\x00\x6e\x00\x0f\x00\x1b\x00\x41\x00\x00\x00\x27\x00\x2a\x00\x39\x00\x1a\x00\x2e\x00\x00\x00\x00\x00\x5c\x00\x6d\x00\x5b\x00\x49\x00\x46\x00\x64\x00\x02\x00\x6c\x00\x4e\x00\x4d\x00\x62\x00\x5f\x00\x5d\x00\x00\x00\x6a\x00\x69\x00\x70\x00\x6e\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyReduceArr = Happy_Data_Array.array (1, 41) [
	(1 , happyReduce_1),
	(2 , happyReduce_2),
	(3 , happyReduce_3),
	(4 , happyReduce_4),
	(5 , happyReduce_5),
	(6 , happyReduce_6),
	(7 , happyReduce_7),
	(8 , happyReduce_8),
	(9 , happyReduce_9),
	(10 , happyReduce_10),
	(11 , happyReduce_11),
	(12 , happyReduce_12),
	(13 , happyReduce_13),
	(14 , happyReduce_14),
	(15 , happyReduce_15),
	(16 , happyReduce_16),
	(17 , happyReduce_17),
	(18 , happyReduce_18),
	(19 , happyReduce_19),
	(20 , happyReduce_20),
	(21 , happyReduce_21),
	(22 , happyReduce_22),
	(23 , happyReduce_23),
	(24 , happyReduce_24),
	(25 , happyReduce_25),
	(26 , happyReduce_26),
	(27 , happyReduce_27),
	(28 , happyReduce_28),
	(29 , happyReduce_29),
	(30 , happyReduce_30),
	(31 , happyReduce_31),
	(32 , happyReduce_32),
	(33 , happyReduce_33),
	(34 , happyReduce_34),
	(35 , happyReduce_35),
	(36 , happyReduce_36),
	(37 , happyReduce_37),
	(38 , happyReduce_38),
	(39 , happyReduce_39),
	(40 , happyReduce_40),
	(41 , happyReduce_41)
	]

happy_n_terms = 34 :: Int
happy_n_nonterms = 8 :: Int

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_1 = happySpecReduce_2  0# happyReduction_1
happyReduction_1 happy_x_2
	happy_x_1
	 =  case happyOut5 happy_x_1 of { happy_var_1 -> 
	case happyOut4 happy_x_2 of { happy_var_2 -> 
	happyIn4
		 (happy_var_1 : happy_var_2
	)}}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_2 = happySpecReduce_0  0# happyReduction_2
happyReduction_2  =  happyIn4
		 ([]
	)

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_3 = happyReduce 7# 1# happyReduction_3
happyReduction_3 (happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { (TType happy_var_1) -> 
	case happyOutTok happy_x_2 of { (TName happy_var_2) -> 
	case happyOut6 happy_x_6 of { happy_var_6 -> 
	happyIn5
		 (Function0 (getType happy_var_1) happy_var_2 happy_var_6
	) `HappyStk` happyRest}}}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_4 = happyReduce 9# 1# happyReduction_4
happyReduction_4 (happy_x_9 `HappyStk`
	happy_x_8 `HappyStk`
	happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { (TType happy_var_1) -> 
	case happyOutTok happy_x_2 of { (TName happy_var_2) -> 
	case happyOutTok happy_x_4 of { (TType happy_var_4) -> 
	case happyOutTok happy_x_5 of { (TName happy_var_5) -> 
	case happyOut6 happy_x_8 of { happy_var_8 -> 
	happyIn5
		 (Function1 (getType happy_var_1) happy_var_2 (getType happy_var_4) happy_var_5 happy_var_8
	) `HappyStk` happyRest}}}}}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_5 = happyReduce 12# 1# happyReduction_5
happyReduction_5 (happy_x_12 `HappyStk`
	happy_x_11 `HappyStk`
	happy_x_10 `HappyStk`
	happy_x_9 `HappyStk`
	happy_x_8 `HappyStk`
	happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { (TType happy_var_1) -> 
	case happyOutTok happy_x_2 of { (TName happy_var_2) -> 
	case happyOutTok happy_x_4 of { (TType happy_var_4) -> 
	case happyOutTok happy_x_5 of { (TName happy_var_5) -> 
	case happyOutTok happy_x_7 of { (TType happy_var_7) -> 
	case happyOutTok happy_x_8 of { (TName happy_var_8) -> 
	case happyOut6 happy_x_11 of { happy_var_11 -> 
	happyIn5
		 (Function2 (getType happy_var_1) happy_var_2 (getType happy_var_4) happy_var_5 (getType happy_var_7) happy_var_8 happy_var_11
	) `HappyStk` happyRest}}}}}}}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_6 = happySpecReduce_2  2# happyReduction_6
happyReduction_6 happy_x_2
	happy_x_1
	 =  case happyOut7 happy_x_1 of { happy_var_1 -> 
	case happyOut6 happy_x_2 of { happy_var_2 -> 
	happyIn6
		 (happy_var_1 : happy_var_2
	)}}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_7 = happySpecReduce_0  2# happyReduction_7
happyReduction_7  =  happyIn6
		 ([]
	)

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_8 = happyReduce 5# 3# happyReduction_8
happyReduction_8 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { (TType happy_var_1) -> 
	case happyOutTok happy_x_2 of { (TName happy_var_2) -> 
	case happyOut8 happy_x_4 of { happy_var_4 -> 
	happyIn7
		 (VarDecl (getType happy_var_1) happy_var_2 happy_var_4
	) `HappyStk` happyRest}}}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_9 = happySpecReduce_3  3# happyReduction_9
happyReduction_9 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { (TType happy_var_1) -> 
	case happyOutTok happy_x_2 of { (TName happy_var_2) -> 
	happyIn7
		 (VarDecl (getType happy_var_1) happy_var_2 (defaultValue $ getType happy_var_1)
	)}}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_10 = happyReduce 4# 3# happyReduction_10
happyReduction_10 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { (TName happy_var_1) -> 
	case happyOut8 happy_x_3 of { happy_var_3 -> 
	happyIn7
		 (VarAssi happy_var_1 happy_var_3
	) `HappyStk` happyRest}}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_11 = happyReduce 11# 3# happyReduction_11
happyReduction_11 (happy_x_11 `HappyStk`
	happy_x_10 `HappyStk`
	happy_x_9 `HappyStk`
	happy_x_8 `HappyStk`
	happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut8 happy_x_3 of { happy_var_3 -> 
	case happyOut6 happy_x_6 of { happy_var_6 -> 
	case happyOut6 happy_x_10 of { happy_var_10 -> 
	happyIn7
		 (IfExpr happy_var_3 happy_var_6 happy_var_10
	) `HappyStk` happyRest}}}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_12 = happyReduce 7# 3# happyReduction_12
happyReduction_12 (happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut8 happy_x_3 of { happy_var_3 -> 
	case happyOut6 happy_x_6 of { happy_var_6 -> 
	happyIn7
		 (IfExpr happy_var_3 happy_var_6 []
	) `HappyStk` happyRest}}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_13 = happyReduce 5# 3# happyReduction_13
happyReduction_13 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut8 happy_x_2 of { happy_var_2 -> 
	case happyOut6 happy_x_4 of { happy_var_4 -> 
	happyIn7
		 (WhileExpr happy_var_2 happy_var_4
	) `HappyStk` happyRest}}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_14 = happyReduce 4# 3# happyReduction_14
happyReduction_14 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut8 happy_x_3 of { happy_var_3 -> 
	happyIn7
		 (Cout happy_var_3
	) `HappyStk` happyRest}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_15 = happyReduce 4# 3# happyReduction_15
happyReduction_15 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_3 of { (TName happy_var_3) -> 
	happyIn7
		 (Cin happy_var_3
	) `HappyStk` happyRest}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_16 = happySpecReduce_3  3# happyReduction_16
happyReduction_16 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut8 happy_x_2 of { happy_var_2 -> 
	happyIn7
		 (VarAssi "funcRetVal'" happy_var_2
	)}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_17 = happyReduce 4# 3# happyReduction_17
happyReduction_17 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { (TName happy_var_1) -> 
	happyIn7
		 (FuncSCall0 happy_var_1
	) `HappyStk` happyRest}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_18 = happyReduce 5# 3# happyReduction_18
happyReduction_18 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { (TName happy_var_1) -> 
	case happyOut8 happy_x_3 of { happy_var_3 -> 
	happyIn7
		 (FuncSCall1 happy_var_1 happy_var_3
	) `HappyStk` happyRest}}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_19 = happyReduce 7# 3# happyReduction_19
happyReduction_19 (happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { (TName happy_var_1) -> 
	case happyOut8 happy_x_3 of { happy_var_3 -> 
	case happyOut8 happy_x_5 of { happy_var_5 -> 
	happyIn7
		 (FuncSCall2 happy_var_1 happy_var_3 happy_var_5
	) `HappyStk` happyRest}}}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_20 = happySpecReduce_3  4# happyReduction_20
happyReduction_20 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut8 happy_x_1 of { happy_var_1 -> 
	case happyOut9 happy_x_3 of { happy_var_3 -> 
	happyIn8
		 (Le happy_var_1 happy_var_3
	)}}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_21 = happySpecReduce_3  4# happyReduction_21
happyReduction_21 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut8 happy_x_1 of { happy_var_1 -> 
	case happyOut9 happy_x_3 of { happy_var_3 -> 
	happyIn8
		 (Gt happy_var_1 happy_var_3
	)}}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_22 = happySpecReduce_3  4# happyReduction_22
happyReduction_22 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut8 happy_x_1 of { happy_var_1 -> 
	case happyOut9 happy_x_3 of { happy_var_3 -> 
	happyIn8
		 (Eq happy_var_1 happy_var_3
	)}}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_23 = happySpecReduce_3  4# happyReduction_23
happyReduction_23 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut8 happy_x_1 of { happy_var_1 -> 
	case happyOut9 happy_x_3 of { happy_var_3 -> 
	happyIn8
		 (Leq happy_var_1 happy_var_3
	)}}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_24 = happySpecReduce_3  4# happyReduction_24
happyReduction_24 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut8 happy_x_1 of { happy_var_1 -> 
	case happyOut9 happy_x_3 of { happy_var_3 -> 
	happyIn8
		 (Geq happy_var_1 happy_var_3
	)}}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_25 = happySpecReduce_3  4# happyReduction_25
happyReduction_25 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut8 happy_x_1 of { happy_var_1 -> 
	case happyOut9 happy_x_3 of { happy_var_3 -> 
	happyIn8
		 (Neq happy_var_1 happy_var_3
	)}}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_26 = happySpecReduce_1  4# happyReduction_26
happyReduction_26 happy_x_1
	 =  case happyOut9 happy_x_1 of { happy_var_1 -> 
	happyIn8
		 (happy_var_1
	)}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_27 = happySpecReduce_3  5# happyReduction_27
happyReduction_27 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut9 happy_x_1 of { happy_var_1 -> 
	case happyOut10 happy_x_3 of { happy_var_3 -> 
	happyIn9
		 (Add happy_var_1 happy_var_3
	)}}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_28 = happySpecReduce_3  5# happyReduction_28
happyReduction_28 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut9 happy_x_1 of { happy_var_1 -> 
	case happyOut10 happy_x_3 of { happy_var_3 -> 
	happyIn9
		 (Sub happy_var_1 happy_var_3
	)}}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_29 = happySpecReduce_1  5# happyReduction_29
happyReduction_29 happy_x_1
	 =  case happyOut10 happy_x_1 of { happy_var_1 -> 
	happyIn9
		 (happy_var_1
	)}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_30 = happySpecReduce_3  6# happyReduction_30
happyReduction_30 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut10 happy_x_1 of { happy_var_1 -> 
	case happyOut11 happy_x_3 of { happy_var_3 -> 
	happyIn10
		 (Mul happy_var_1 happy_var_3
	)}}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_31 = happySpecReduce_3  6# happyReduction_31
happyReduction_31 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut10 happy_x_1 of { happy_var_1 -> 
	case happyOut11 happy_x_3 of { happy_var_3 -> 
	happyIn10
		 (Div happy_var_1 happy_var_3
	)}}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_32 = happySpecReduce_1  6# happyReduction_32
happyReduction_32 happy_x_1
	 =  case happyOut11 happy_x_1 of { happy_var_1 -> 
	happyIn10
		 (happy_var_1
	)}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_33 = happySpecReduce_3  7# happyReduction_33
happyReduction_33 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut8 happy_x_2 of { happy_var_2 -> 
	happyIn11
		 (happy_var_2
	)}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_34 = happySpecReduce_1  7# happyReduction_34
happyReduction_34 happy_x_1
	 =  case happyOutTok happy_x_1 of { (TInt happy_var_1) -> 
	happyIn11
		 (IntNum happy_var_1
	)}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_35 = happySpecReduce_3  7# happyReduction_35
happyReduction_35 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { (TName happy_var_1) -> 
	happyIn11
		 (FuncECall0 happy_var_1
	)}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_36 = happyReduce 4# 7# happyReduction_36
happyReduction_36 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { (TName happy_var_1) -> 
	case happyOut8 happy_x_3 of { happy_var_3 -> 
	happyIn11
		 (FuncECall1 happy_var_1 happy_var_3
	) `HappyStk` happyRest}}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_37 = happyReduce 6# 7# happyReduction_37
happyReduction_37 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { (TName happy_var_1) -> 
	case happyOut8 happy_x_3 of { happy_var_3 -> 
	case happyOut8 happy_x_5 of { happy_var_5 -> 
	happyIn11
		 (FuncECall2 happy_var_1 happy_var_3 happy_var_5
	) `HappyStk` happyRest}}}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_38 = happySpecReduce_1  7# happyReduction_38
happyReduction_38 happy_x_1
	 =  case happyOutTok happy_x_1 of { (TName happy_var_1) -> 
	happyIn11
		 (Var happy_var_1
	)}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_39 = happySpecReduce_1  7# happyReduction_39
happyReduction_39 happy_x_1
	 =  case happyOutTok happy_x_1 of { (TStr happy_var_1) -> 
	happyIn11
		 (Str happy_var_1
	)}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_40 = happySpecReduce_1  7# happyReduction_40
happyReduction_40 happy_x_1
	 =  case happyOutTok happy_x_1 of { (TDouble happy_var_1) -> 
	happyIn11
		 (DoubleNum happy_var_1
	)}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_41 = happySpecReduce_1  7# happyReduction_41
happyReduction_41 happy_x_1
	 =  case happyOutTok happy_x_1 of { (TBool happy_var_1) -> 
	happyIn11
		 (BoolNum happy_var_1
	)}

happyNewToken action sts stk [] =
	happyDoAction 33# notHappyAtAll action sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = happyDoAction i tk action sts stk tks in
	case tk of {
	TType happy_dollar_dollar -> cont 1#;
	TIf -> cont 2#;
	TElse -> cont 3#;
	TReturn -> cont 4#;
	TWhile -> cont 5#;
	TCout -> cont 6#;
	TOp "<<" -> cont 7#;
	TCin -> cont 8#;
	TOp ">>" -> cont 9#;
	TOp "=" -> cont 10#;
	TOp "+" -> cont 11#;
	TOp "-" -> cont 12#;
	TOp "*" -> cont 13#;
	TOp "/" -> cont 14#;
	TOp ";" -> cont 15#;
	TOp "(" -> cont 16#;
	TOp ")" -> cont 17#;
	TOp "{" -> cont 18#;
	TOp "}" -> cont 19#;
	TOp "<" -> cont 20#;
	TOp ">" -> cont 21#;
	TOp "," -> cont 22#;
	TOp "==" -> cont 23#;
	TOp "<=" -> cont 24#;
	TOp ">=" -> cont 25#;
	TOp "!=" -> cont 26#;
	TName happy_dollar_dollar -> cont 27#;
	TBool happy_dollar_dollar -> cont 28#;
	TInt happy_dollar_dollar -> cont 29#;
	TDouble happy_dollar_dollar -> cont 30#;
	TStr happy_dollar_dollar -> cont 31#;
	TOp "\"" -> cont 32#;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 33# tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Token)], [String]) -> HappyIdentity a
happyError' = HappyIdentity . (\(tokens, _) -> parseError tokens)
parses tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse 0# tks) (\x -> happyReturn (let {x' = happyOut4 x} in x'))

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError arg = error $ "Parse error" <> show arg

defaultValue :: ProgType -> Expression
defaultValue PInt = IntNum 0
defaultValue PDouble = DoubleNum 0.0
defaultValue PBool = BoolNum False 
defaultValue PString = Str ""

data Expression = Add Expression Expression 
                | Sub Expression Expression
                | Mul Expression Expression
                | Div Expression Expression
                | Le Expression Expression
                | Gt Expression Expression
                | Eq Expression Expression
                | Neq Expression Expression
                | Leq Expression Expression
                | Geq Expression Expression
                | IntNum Int
                | DoubleNum Double
                | BoolNum Bool
                | Var String
                | Str String 
                | FuncECall0 String 
                | FuncECall1 String Expression
                | FuncECall2 String Expression Expression

instance Show Expression where 
  show (Add a b) = "(" <> show a <> " + " <> show b <> ")"
  show (Sub a b) = "(" <> show a <> " - " <> show b <> ")"
  show (Mul a b) = "(" <> show a <> " * " <> show b <> ")"
  show (Div a b) = "(" <> show a <> " / " <> show b <> ")"
  show (Le a b)  = "(" <> show a <> " < " <> show b <> ")"
  show (Gt a b)  = "(" <> show a <> " > " <> show b <> ")"
  show (Eq a b)  = "(" <> show a <> " == " <> show b <> ")"
  show (Neq a b) = "(" <> show a <> " != " <> show b <> ")"
  show (Geq a b) = "(" <> show a <> " >= " <> show b <> ")"
  show (Leq a b) = "(" <> show a <> " <= " <> show b <> ")"
  show (IntNum a)   = show a
  show (DoubleNum a) = show a
  show (BoolNum a) = show a
  show (Var a)   = a
  show (Str a)   = show a
  show (FuncECall0 name) = name <> "()"
  show (FuncECall1 name expr) = name <> "(" <> show expr <> ")"
  show (FuncECall2 name expr1 expr2) = name <> "(" <> show expr1 <> ", " <> show expr2 <> ")"

data Statement = VarDecl ProgType String Expression 
               | IfExpr Expression [Statement] [Statement]
               | WhileExpr Expression [Statement]
               | Cout Expression
               | Cin String
               | VarAssi String Expression 
               | FuncSCall0 String 
               | FuncSCall1 String Expression
               | FuncSCall2 String Expression Expression

instance Show Statement where 
  show (VarDecl c a b) = show c <> " " <> a <> " = " <> show b <> ";"
  show (IfExpr a b c) = "if " <> show a <> " then {\n" <> printBody b <> "} else {\n" <> printBody c <> "}\n"
  show (WhileExpr a b) = "while " <> show a <> " {\n" <> printBody b <> "}"
  show (VarAssi name expr) = name <> " = " <> show expr <> ";"
  show (Cout expr) = "cout << " <> show expr <> ";"
  show (Cin name) = "cin >> " <> name <> ";"
  show (FuncSCall0 name) = name <> "();"
  show (FuncSCall1 name expr1) = name <> "(" <> show expr1 <> ");"
  show (FuncSCall2 name expr1 expr2) = name <> "(" <> show expr1 <> ", " <> show expr2 <> ");"

data Function = Function0 ProgType String [Statement]
              | Function1 ProgType String ProgType String [Statement]
              | Function2 ProgType String ProgType String ProgType String [Statement]

instance Show Function where 
  show (Function0 typ name body) = show typ <> " " <> name <> " () {\n" <> printBody body <> "}\n"
  show (Function1 typ1 name1 typ2 name2 body) = 
    show typ1 <> " " <> name1 <> " (" <> show typ2 <> " " <> name2 <> ") {\n" <> printBody body <> "}\n"
  show (Function2 typ1 name1 typ2 name2 typ3 name3 body) = 
    show typ1 <> " " <> name1 <> " (" <> show typ2 <> " " <> name2 <> ", " <> show typ3 <> " "
              <> name3 <> " ) {\n" <> printBody body <> "}\n"

getType :: String -> ProgType
getType "int" = PInt
getType "double" = PDouble
getType "string" = PString
getType "bool"   = PBool

printBody :: [Statement] -> String 
printBody = foldr (\a b -> show a <> "\n" <> b) ""

parseLine :: String -> [Function] 
parseLine = parses . alexScanTokens
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $













-- Do not remove this comment. Required to fix CPP parsing when using GCC and a clang-compiled alex.
#if __GLASGOW_HASKELL__ > 706
#define LT(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.<# m)) :: Bool)
#define GTE(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.>=# m)) :: Bool)
#define EQ(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.==# m)) :: Bool)
#else
#define LT(n,m) (n Happy_GHC_Exts.<# m)
#define GTE(n,m) (n Happy_GHC_Exts.>=# m)
#define EQ(n,m) (n Happy_GHC_Exts.==# m)
#endif



















data Happy_IntList = HappyCons Happy_GHC_Exts.Int# Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept 0# tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
        (happyTcHack j (happyTcHack st)) (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action



happyDoAction i tk st
        = {- nothing -}
          case action of
                0#           -> {- nothing -}
                                     happyFail (happyExpListPerState ((Happy_GHC_Exts.I# (st)) :: Int)) i tk st
                -1#          -> {- nothing -}
                                     happyAccept i tk st
                n | LT(n,(0# :: Happy_GHC_Exts.Int#)) -> {- nothing -}
                                                   (happyReduceArr Happy_Data_Array.! rule) i tk st
                                                   where rule = (Happy_GHC_Exts.I# ((Happy_GHC_Exts.negateInt# ((n Happy_GHC_Exts.+# (1# :: Happy_GHC_Exts.Int#))))))
                n                 -> {- nothing -}
                                     happyShift new_state i tk st
                                     where new_state = (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#))
   where off    = happyAdjustOffset (indexShortOffAddr happyActOffsets st)
         off_i  = (off Happy_GHC_Exts.+# i)
         check  = if GTE(off_i,(0# :: Happy_GHC_Exts.Int#))
                  then EQ(indexShortOffAddr happyCheck off_i, i)
                  else False
         action
          | check     = indexShortOffAddr happyTable off_i
          | otherwise = indexShortOffAddr happyDefActions st




indexShortOffAddr (HappyA# arr) off =
        Happy_GHC_Exts.narrow16Int# i
  where
        i = Happy_GHC_Exts.word2Int# (Happy_GHC_Exts.or# (Happy_GHC_Exts.uncheckedShiftL# high 8#) low)
        high = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr (off' Happy_GHC_Exts.+# 1#)))
        low  = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr off'))
        off' = off Happy_GHC_Exts.*# 2#




{-# INLINE happyLt #-}
happyLt x y = LT(x,y)


readArrayBit arr bit =
    Bits.testBit (Happy_GHC_Exts.I# (indexShortOffAddr arr ((unbox_int bit) `Happy_GHC_Exts.iShiftRA#` 4#))) (bit `mod` 16)
  where unbox_int (Happy_GHC_Exts.I# x) = x






data HappyAddr = HappyA# Happy_GHC_Exts.Addr#


-----------------------------------------------------------------------------
-- HappyState data type (not arrays)













-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state 0# tk st sts stk@(x `HappyStk` _) =
     let i = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--     trace "shifting the error token" $
     happyDoAction i tk new_state (HappyCons (st) (sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state (HappyCons (st) (sts)) ((happyInTok (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_0 nt fn j tk st@((action)) sts stk
     = happyGoto nt j tk st (HappyCons (st) (sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@((HappyCons (st@(action)) (_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_2 nt fn j tk _ (HappyCons (_) (sts@((HappyCons (st@(action)) (_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_3 nt fn j tk _ (HappyCons (_) ((HappyCons (_) (sts@((HappyCons (st@(action)) (_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) sts of
         sts1@((HappyCons (st1@(action)) (_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (happyGoto nt j tk st1 sts1 r)

happyMonadReduce k nt fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> happyGoto nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
         let drop_stk = happyDropStk k stk

             off = happyAdjustOffset (indexShortOffAddr happyGotoOffsets st1)
             off_i = (off Happy_GHC_Exts.+# nt)
             new_state = indexShortOffAddr happyTable off_i




          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop 0# l = l
happyDrop n (HappyCons (_) (t)) = happyDrop (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) t

happyDropStk 0# l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Happy_GHC_Exts.-# (1#::Happy_GHC_Exts.Int#)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction


happyGoto nt j tk st = 
   {- nothing -}
   happyDoAction j tk new_state
   where off = happyAdjustOffset (indexShortOffAddr happyGotoOffsets st)
         off_i = (off Happy_GHC_Exts.+# nt)
         new_state = indexShortOffAddr happyTable off_i




-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist 0# tk old_st _ stk@(x `HappyStk` _) =
     let i = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (action) sts stk =
--      trace "entering error recovery" $
        happyDoAction 0# tk action sts ((Happy_GHC_Exts.unsafeCoerce# (Happy_GHC_Exts.I# (i))) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions


happyTcHack :: Happy_GHC_Exts.Int# -> a -> a
happyTcHack x y = y
{-# INLINE happyTcHack #-}


-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.


{-# NOINLINE happyDoAction #-}
{-# NOINLINE happyTable #-}
{-# NOINLINE happyCheck #-}
{-# NOINLINE happyActOffsets #-}
{-# NOINLINE happyGotoOffsets #-}
{-# NOINLINE happyDefActions #-}

{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
