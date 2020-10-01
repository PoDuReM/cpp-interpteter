module Main where

import System.Directory.Internal.Prelude (getArgs)
import System.IO (hGetContents)
import GHC.IO.Handle.FD (openFile)
import System.Directory.Internal.Prelude (IOMode(ReadMode))
import Parser
import Interpretator
import Lib
import Printer
import Data.IORef


main :: IO ()
main = do 
  args <- getArgs
  case args of 
    [] -> error "File path excepted"
    "help":[] -> do
      putStrLn "Need 2 arguments: path to cpp file and work mode (interpret/print)"
    path:mode:[] -> do 
      file <- openFile path ReadMode
      content <- hGetContents $ file
      case mode of
        "interpret" -> do 
          val <- interpret $ executeProgram (parseLine content)
          putStrLn $ show val
        "print" -> do
          i <- newIORef (0 :: Int)
          str <- toStr (executeProgram (parseLine content)) i ""
          putStrLn str
        _ -> putStrLn "invalid mode"
    _ -> putStrLn "Need 2 arguments: path to cpp file and work mode (interpret/print)"
    