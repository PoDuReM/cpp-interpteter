module Main where

import Control.Monad.State
import Data.IORef
import Data.Map
import GHC.IO.Handle.FD (openFile)
import Interpretator
import Lib
import Parser
import Printer
import System.Directory.Internal.Prelude (getArgs)
import System.Directory.Internal.Prelude (IOMode(ReadMode))
import System.IO (hGetContents)


main :: IO ()
main = do 
  args <- getArgs
  case args of 
    [] -> error "File path excepted"
    "help":[] -> do
      putStrLn "Need 2 arguments: path to cpp file and work mode (interpret/print)"
    path:mode:[] -> do 
      file    <- openFile path ReadMode
      content <- hGetContents $ file
      case mode of
        "interpret" -> do 
          val <- evalStateT (interpret $ executeProgram (parseLine content)) empty
          putStrLn $ show val
        "print" -> do
          i   <- newIORef (0 :: Int)
          str <- toStr (executeProgram (parseLine content)) i ""
          putStrLn str
        _ -> putStrLn "invalid mode"
    _ -> putStrLn "Need 2 arguments: path to cpp file and work mode (interpret/print)"
