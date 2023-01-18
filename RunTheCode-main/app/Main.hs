module Main where

import Helper
import Generator as G
import GUI 
--import System.Random
import System.IO (hFlush, stdout)

data Format = Lines | Plain | OneLiner
  deriving (Eq, Read, Show)

type Padding = Int
type Solution = Bool
type Rank = Bool

--type SUDOKU = Array (Int, Int) Int

type Sudoku = [[Int]]

prompt :: String -> IO String
prompt text = do
  putStr text
  hFlush stdout
  getLine

main :: IO ()
main = do
  putStr $ unlines
    [ "SUDOKU"
    , "  1) Start game in text-mode"
    , "  2) Start game in GUI-mode"
    , "  3) Quit"
    ]
  response <- prompt "> "
  putStr response
  if (length response /= 1) then 
    do
        putStrLn " Invalid input\n"
        main
  else
    do
    case head response of
      '1' -> do 
          putStrLn " Starting text-mode"
          difficulty <- selectDifficulty
          board <- gen
          --printBoard board
          newBoard <- removeRandomElements board difficulty []
          --printBoard newBoard
          prettyPrint newBoard
          playGame newBoard
      '2' -> do
        putStrLn " Starting GUI-mode"
        start
      '3' -> putStrLn " Quitting..."
      _   -> do
        putStrLn " Invalid input\n"
        main


selectDifficulty :: IO Int
selectDifficulty = do
  putStr $ unlines
    [ "Select difficulty"
    , "  1) Easy"
    , "  2) Medium"
    , "  3) Hard"
    ]
  response <- prompt "> "
  if (length response /= 1) then 
    do
      putStrLn " Invalid input\n"
      selectDifficulty
  else
    case head response of
      '1' -> return 40
      '2' -> return 50
      '3' -> return 60
      _   -> do
        putStrLn " Invalid input\n"
        selectDifficulty


--printBoard :: [Int] -> IO ()
-- printBoard [] = putStr ""
-- printBoard (x:xs) = do
--   putStr $ show x ++ " "
--   printBoard xs

playGame :: [Int] -> IO ()
playGame board = do
  putStr $ unlines
    [ "Help"
    , "  To insert value, type in the position (row column) and value"
    , "  For example, to insert 5 in the top left corner, type in 1 1 5"
    , "  1) New game"
    , "  2) Solve game (displays solved puzzle)"
    , "  3) Quit this game"
    ]
  response <- prompt "> "
  case (isValidImput response) of
    True -> do
      let input = words response
      let row = read (head input) :: Int
      let col = read (input !! 1) :: Int
      let val = read (input !! 2) :: Int
      
      if placeable board (pred col) (pred row) val then do
        --putStrLn (show row ++ " " ++ show col ++ " " ++ show val)
        let newBoard = place board (pred col) (pred row) val
        prettyPrint newBoard
        if solved newBoard then do
          putStrLn "Solved!"
          main
        else do
          playGame newBoard
      else do
        putStrLn "Invalid move\n"
        playGame board
    False -> do
      case response of
        "1" -> do
          putStrLn "New game"
          main
        "2" -> do
          putStrLn "Solving game"
          let puzzle = solve board
          prettyPrint (head puzzle)              
          main
        "3" -> do
          putStrLn "Quitting.."
        _ -> do
          putStr "Invalid input\n"
          playGame board

-- prettyPrintSolved :: [[Int]] -> IO ()
-- prettyPrintSolved board = do
--                 putStr $ terminator (formatArg [])
--                 putStr $ format (formatArg []) (paddingArg []) (concat board)
--                 putStr "\n"
--                 return ()



