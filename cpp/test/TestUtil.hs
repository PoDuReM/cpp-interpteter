module TestUtil
  ( binPowProgram
  , helloWorldProgram
  , testIf
  , testWhile
  , binPowProgramDslString
  ) where

import CppDsl
import Type

binPowProgram :: String 
binPowProgram = 
  "int bin_pow(int a) {\n" <>
  "  int b = 1;\n" <>
  "  while (a > 0) {\n" <> 
  "    b = b * 2;\n" <> 
  "    a = a - 1;" <>
  "  }\n" <>
  "  return b;" <>
  "}\n\n" <> 
  "int main() {\n" <>
  "  int c = 10;\n" <>
  "  return bin_pow(c);\n" <> 
  "}\n"

binPowProgramDslString :: String 
binPowProgramDslString = 
  "sFun0 PInt (\\v0 ->\n" <>
  "  sWithVar PInt \"c\" ((@~)(10 :: Int)) (\\v1 ->\n" <>
  "    v0 @= sFun1 PInt (\\v3 v2 ->\n" <> 
  "      sWithVar PInt \"b\" ((@~)(1 :: Int)) (\\v4 ->\n" <>
  "        sWhile (((readVar v3) @> (@~)(0 :: Int))) (\n" <>
  "          v4 @= ((readVar v4) @* (@~)(2 :: Int)) #\n" <>
  "          v3 @= ((readVar v3) @- (@~)(1 :: Int)) #\n" <>
  "          empt) #\n" <>
  "        v2 @= (readVar v4) #\n" <>
  "        empt)) PInt ((readVar v1)) #\n" <>
  "    empt))"


helloWorldProgram :: String 
helloWorldProgram = 
  "string hello() {\n" <>
  "  return \"hello \";\n" <> 
  "}\n\n" <> 
  "string world() {\n" <>
  "  return \"world!\";\n" <>
  "}\n\n" <>
  "string main() {\n" <>
  "  string ans;\n" <>
  "  ans = ans + hello();\n" <>
  "  ans = ans + world();\n" <>
  "  return ans;\n" <>
  "}\n"

testIf :: CppDsl p => Bool -> p ()
testIf b = 
  sWithVar PInt "a" (((@~) (0 :: Int))) (\a -> 
    sIf ((@~)(b)) (a @= (@~) (1 :: Int)) (a @= (@~) (2 :: Int)))  

testWhile :: CppDsl p => p ()
testWhile = 
  sWithVar PInt "a" ((@~)(10 :: Int)) (\v1 ->
    sWithVar PInt "b" ((@~)(1 :: Int)) (\v2 ->
      sWhile (((readVar v1) @> (@~)(0 :: Int))) (
        v2 @= ((readVar v2) @+ (@~)(1 :: Int)) #
        v1 @= ((readVar v1) @- (@~)(1 :: Int)))))