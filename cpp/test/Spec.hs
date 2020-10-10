module Main
  ( main
  ) where

import Test.Hspec (hspec)
import InterpretTest
import PrintTest

main :: IO ()
main = hspec $ do 
  interpretSpec
  printSpec