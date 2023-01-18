module Helper (
    removeRandomElements,
    prettyPrint,
    isValidImput,
    isDigit
    ) where

import System.Random
import Generator 

removeRandomElements :: [Int] -> Int -> [Int] -> IO [Int]
removeRandomElements board 0 _ = return board
removeRandomElements board n xs = do
  r <- randomRIO (0, 80)
  if (r `elem` xs) then do
    removeRandomElements board n xs
  else do
    let newBoard = place board (r `div` 9) (r `mod` 9 ) 0
    removeRandomElements newBoard (n-1) (r:xs)

prettyPrint :: [Int] -> IO ()
prettyPrint board = do
  putStr $ terminator (formatArg [])
  putStr $ format (formatArg []) (paddingArg []) board
  putStr "\n"
  return ()

isValidImput :: String -> Bool
isValidImput response = do
  let input = words response
  (length input == 3) && ( isDigit (head input)) && (isDigit (input !! 1)) && (isDigit (input !! 2)) &&
    
    (read (head input) :: Int) > 0 &&
      (read (head input) :: Int) < 10
      &&
        (read (input !! 1) :: Int) > 0
          &&
            (read (input !! 1) :: Int) < 10
              &&
                (read (input !! 2) :: Int) > 0 && (read (input !! 2) :: Int) < 10

isDigit :: String -> Bool
isDigit [] = True
isDigit (x:xs) = x `elem` ['0'..'9'] && isDigit xs

-- removeRandomElementsOne :: [Int] -> Int -> [Int] -> [Int]
-- removeRandomElementsOne board 0 _ = board
-- removeRandomElementsOne board n xs = do
--   r <- randomRIO (0, 80)
--   if (r `elem` xs) then do
--     removeRandomElementsOne board n xs
--   else do
--     let newBoard = place board (r `div` 9) (r `mod` 9 ) 0
--     removeRandomElementsOne newBoard (n-1) (r:xs)