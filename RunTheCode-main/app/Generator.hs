
{-# LANGUAGE OverloadedStrings #-}
module Generator (
    format,
    terminator,
    solve,
    gen,
    placeable,
    place,
    solved,
    conform,
    getRandomRs,
    paddingArg,
    formatArg,
    join, every
)
where

import System.Random
import Data.List

data Format = Lines | OneLiner
  deriving (Eq, Read, Show)

type Padding = Int

--type SUDOKU = Data.Array (Int, Int) Int

groups :: Int -> [a] -> [[a]]
groups _ [] = []
groups n l
  | n > 0 = take n l : groups n (drop n l)
  | otherwise = error "Negative or zero n"

strRowsD :: String -> [Int] -> [[String]]
strRowsD d o = groups 9 $ map (\c -> if c > 0 then show c else d) o

strRows :: [Int] -> [[String]]
strRows = strRowsD " "

strRows_ :: [Int] -> [[String]]
strRows_  = strRowsD "_" 

join :: [[a]] -> [a]
join  = concat

format :: Format -> Padding -> [Int] -> String
format OneLiner _ o = join . join . strRows_ $ o
format _       p o = join $ intersperse "\n" $ (if p > 1 then intersperse inbetweenPad else id) $ borders $ rows $ strRows o
  where
    borders rs = [topcap] ++ inbetweens rs ++ [bottomcap]
    rows = map (line '┃' '│' '┃' ' ' '┃') 
    inbetweenThin = line '┠' '┼' '╂' '─' '┨' $ row9 '─'
    inbetweenThick = line '┣' '┿' '╋' '━' '┫' $ row9 '━'
    inbetweenPad = join $ intersperse "\n" $ replicate (p `div` 2) $ line '┃' '│' '┃' ' ' '┃' $ row9 ' '
    inbetweens rs = join $ intersperse [inbetweenThick] $ groups 5 $ join . map (intersperse inbetweenThin) $ groups 3 rs
    topcap = line '┏' '┯' '┳' '━' '┓' $ row9 '━'
    bottomcap = line '┗' '┷' '┻' '━' '┛' $ row9 '━'
    line ll cl cb m rl r = [ll] ++ join (intersperse [cb] $ map (\ r3 -> join $ intersperse [cl] $ map (\ c -> replicate p m ++ c ++ replicate p m) r3) $ groups 3 r) ++ [rl]
    row9 c = replicate 9 [c]

formatArg :: [String] -> Format
formatArg args
  | "oneliner" `elem` args  = OneLiner
  | otherwise               = Lines

paddingArg :: [String] -> Padding
paddingArg args = if p > -1 then p else 1
  where
    p = findmax $ map (\a -> case reads a of
        [(val, "")] -> val
        _           -> (-1)
      ) args

findmax :: [Int] -> Int
findmax = foldl max (-1) 

placeable :: [Int] -> Int -> Int -> Int -> Bool
placeable sudoku x y n = not $ n `elem` r || n `elem` c || n `elem` q
  where
    r = row y sudoku
    c = column x sudoku
    q = quad (x `div` 3) (y `div` 3) sudoku

place :: [Int] -> Int -> Int -> Int -> [Int]
place sudoku x y n = take (y * 9 + x) sudoku ++ [n] ++ drop ((y * 9 + x) + 1) sudoku

conform :: [Int] -> [Int] -> [Int]
conform []     sudoku = sudoku 
conform (n:ns) sudoku
  | length sudoku == 81 = sudoku
  | otherwise           = if placeable sudoku x y n then append else skip
                            where
                              x = length sudoku `mod` 9
                              y = length sudoku `div` 9
                              append = conform ns $ sudoku ++ [n]
                              skip = if candidates then continue else reset
                              candidates = any (placeable sudoku x y) [1..9]
                              continue = conform ns sudoku
                              reset = conform ns []

row :: Int -> [a] -> [a]
row _ [] = []
row r o  = take 9 $ drop (r * 9) o

column :: Int -> [a] -> [a]
column _ [] = []
column c o = every 9 $ drop c o

every :: Int -> [a] -> [a]
every _ [] = []
every n as  = head as : every n (drop n as)

quad :: Int -> Int -> [a] -> [a]
quad x y o = join $ map (\r -> take 3 $ drop (x*3) $ row (y*3 + r) o) [0..2]

problematize :: [Int] -> [Int] -> [Int]
problematize []   sudoku = sudoku
problematize (u:us) sudoku = if length (solve problematized) == 1 then sudoku else problematize us problematized
  where
    problematized = replace sudoku u 0

solve :: [Int] -> [[Int]]
solve []     = []
solve sudoku
  | 0 `notElem` sudoku = [sudoku]
  | otherwise = join $ map solve potential
    where
      potential = case elemIndex 0 sudoku of
        Nothing -> [sudoku]
        Just n  -> [replace sudoku n p |
            p <- [1 .. 9], placeable sudoku x y p]
          where
            x = n `mod` 9
            y = n `div` 9

solved :: [Int] -> Bool
solved sudoku = case elemIndex 0 sudoku of 
  Nothing -> True
  Just _  -> False

replace :: [Int] -> Int -> Int -> [Int]
replace l i n = take i l ++ [n] ++ drop (i + 1) l

getRandomRs :: (Random a) => (a, a) -> IO [a]
getRandomRs (a, b) = do randomRs (a, b) <$> newStdGen

gen :: IO [Int]
gen = do
  -- generate sudoku
  r <- getRandomRs (1, 9)
  let sudoku = conform r []
  n81 <- getRandomRs (0, 80)
  let t81 = nub n81
  let problem = problematize t81 sudoku
  let numbers = length $ filter (/= 0) problem
  -- output
  if numbers == 81 then 
    return sudoku
  else gen
  

terminator :: Format -> String
terminator f = case f of
    OneLiner  -> ","
    Lines     -> "\n"