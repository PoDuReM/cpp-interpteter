module InterpretTest
  ( interpretSpec
  ) where

import CppDsl
import Data.Functor.Identity
import Interpretator
import TestUtil 
import Parser
import Lib
import Test.Hspec (SpecWith, describe, shouldBe, it)
import Control.Monad.State
import Data.Map

interpretProgram :: String -> HValue
interpretProgram str = 
  runIdentity (evalStateT (interpret $ executeProgram (parseLine str)) empty)

interpretSpec :: SpecWith ()
interpretSpec = 
  describe ("Interpret tests") $ do
    it "interpret bin pow of 10 program" $
      interpretProgram binPowProgram `shouldBe` HNumber (HInt 1024)
    it "interpret hello world program" $
      interpretProgram helloWorldProgram `shouldBe` HString "hello world!"
    it "test if and vars" $ do
      let execStateinterpretF = runIdentity (execStateT (interpret (testIf False)) empty)
      let execStateinterpretT = runIdentity (execStateT (interpret (testIf True)) empty)
      snd (execStateinterpretF ! "a") `shouldBe` HNumber (HInt 2)
      snd (execStateinterpretT ! "a") `shouldBe` HNumber (HInt 1)
      fst (execStateinterpretF ! "a") `shouldBe` 0
      fst (execStateinterpretT ! "a") `shouldBe` 0
    it "test while and vars" $ do 
      let st = runIdentity (execStateT (interpret testWhile) empty)
      snd (st ! "a") `shouldBe` HNumber (HInt 0)
      snd (st ! "b") `shouldBe` HNumber (HInt 11)
      fst (st ! "a") `shouldBe` 0
      fst (st ! "b") `shouldBe` 0

      
      


