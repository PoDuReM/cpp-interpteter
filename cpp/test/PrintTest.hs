module PrintTest
  ( printSpec
  ) where

import TestUtil 
import Parser
import Lib
import Test.Hspec (SpecWith, describe, shouldBe, it)
import Printer
import Data.IORef

printProgram :: String -> IO String
printProgram str = do 
    ref <- newIORef 0
    toStr (executeProgram (parseLine str)) ref ""

printSpec :: SpecWith ()
printSpec = 
  describe ("Print tests") $ do
    it "print bin pow of 10 program" $ do 
      ans <- printProgram binPowProgram
      ans `shouldBe` binPowProgramDslString
