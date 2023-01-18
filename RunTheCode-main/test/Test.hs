module Main where

import Helper
import Generator 
import Test.QuickCheck
-- import qualified Test.QuickCheck as QC
-- import Test.QuickCheck.Monadic

quickCheckN :: Testable prop => Int -> prop -> IO ()
quickCheckN n = quickCheckWith stdArgs { maxSuccess = n }

quickCheckN' :: Testable prop => Int -> prop -> IO ()
quickCheckN' n = quickCheckWith stdArgs { maxSuccess = n, maxSize = 100 }

{-
monadicIO $ do writtenData <- pick arbitrary
                                    pre $ not (null writtenData)
                                    readData <- run $ writeThenRead writtenData
                                    assert $ writtenData == readData
-}
-- quicktest1 :: [Int] -> Bool
-- quicktest1 sudoku = length sudoku == 81

-- quicktest2 :: Bool
-- quicktest2 = do
--     let sudoku = gen
--     all (\x -> x >= 0 && x <= 9) sudoku
--     in length sudoku == 81

joinTest :: [[Int]] -> Bool
joinTest x = join x == concat x

testOne :: [Int] -> Property
testOne sudoku = label (if length (solve sudoku) >= 0 then "valid" else "invalid") True


-- testOne :: Bool
-- testOne = length sudoku == 81
--     where
--         let sudoku = gen in sudoku

-- conformTest :: [Int] -> [Int] -> Bool
-- conformTest ns sudoku = conform ns sudoku == take 81 sudoku

-- everyTest :: Int -> [Int] -> Bool
-- everyTest n as = every n as == take n as ++ every n (drop n as)

-- quadCheck :: Int -> Int -> [Int] -> Bool
-- quadCheck x y n = (every 3 $ take 3 $ drop (x*3) $ row (y*3 + 0) n) == [1..3] &&
--                   (every 3 $ take 3 $ drop (x*3) $ row (y*3 + 1) n) == [4..6] &&
--                   (every 3 $ take 3 $ drop (x*3) $ row (y*3 + 2) n) == [7..9]


-- removeRandomElementsTest :: [Int] -> Int -> Bool
-- removeRandomElementsTest xs n = (n < 81) && (numberOfZeroes (removeRandomElementsOne xs n []) == n)

numberOfZeroes :: [Int] -> Int
numberOfZeroes xs = length $ filter (== 0) xs

-- checkGenandSolved :: [Int] -> Bool
-- checkGenandSolved xs = helperCheck xs (solve (removeRandomElementsOne xs 40 []))

helperCheck :: [Int] -> [[Int]] -> Bool
helperCheck [] [] = True
helperCheck _ [] = False
helperCheck xs (y:ys) = (xs == y) || helperCheck xs ys

-- isValidImputTest :: String -> Bool
-- isValidImputTest xs = isValidImput xs == (length input == 3) && ( isDigit (head input)) && (isDigit (input !! 1)) && (isDigit (input !! 2)) &&
    
--     (read (head input) :: Int) > 0 &&
--       (read (head input) :: Int) < 10
--       &&
--         (read (input !! 1) :: Int) > 0
--           &&
--             (read (input !! 1) :: Int) < 10
--               &&
--                 (read (input !! 2) :: Int) > 0 && (read (input !! 2) :: Int) < 10
--   where input = words xs

isDigitTest :: String -> Bool
isDigitTest xs = isDigit xs == foldl (\a x -> a && x `elem` ['0'..'9']) True xs

main :: IO()
main = do
    let solvedPuzzleOne = [3, 8, 7, 4, 9, 1, 6, 2, 5,
                        2, 4, 1, 5, 6, 8, 3, 7, 9,
                        5, 6, 9, 3, 2, 7, 4, 1, 8,
                        7, 5, 8, 6, 1, 9, 2, 3, 4,
                        1, 2, 3, 7, 8, 4, 5, 9, 6,
                        4, 9, 6, 2, 5, 3, 1, 8, 7,
                        9, 3, 4, 1, 7, 6, 8, 5, 2,
                        6, 7, 5, 8, 3, 2, 9, 4, 1,
                        8, 1, 2, 9, 4, 5, 7, 6, 3]
    let solvedPuzzleTwo = [4, 5, 7, 9, 3, 1, 6, 2, 8,
                        1, 2, 3, 7, 6, 8, 5, 4, 9,
                        9, 8, 6, 2, 5, 4, 3, 7, 1,
                        2, 7, 4, 6, 8, 9, 1, 5, 3,
                        8, 3, 1, 5, 7, 2, 4, 9, 6,
                        5, 6, 9, 4, 1, 3, 2, 8, 7,
                        6, 1, 2, 8, 9, 5, 7, 3, 4,
                        7, 9, 5, 3, 4, 6, 8, 1, 2,
                        3, 4, 8, 1, 2, 7, 9, 6, 5]
    let solvedPuzzleThree = [5, 1, 8, 4, 2, 3, 7, 9, 6,
                        9, 7, 3, 1, 5, 6, 4, 8, 2,
                        4, 2, 6, 8, 9, 7, 5, 3, 1,
                        7, 4, 2, 6, 3, 8, 1, 5, 9,
                        3, 5, 1, 9, 7, 4, 2, 6, 8,
                        6, 8, 9, 5, 1, 2, 3, 7, 4,
                        1, 3, 7, 2, 8, 9, 6, 4, 5,
                        8, 6, 5, 7, 4, 1, 9, 2, 3,
                        2, 9, 4, 3, 6, 5, 8, 1, 7]
    let solvedPuzzleFour = [1, 2, 4, 3, 9, 6, 5, 8, 7,
                        7, 6, 3, 8, 1, 5, 4, 2, 9,
                        5, 8, 9, 2, 4, 7, 3, 6, 1,
                        3, 5, 7, 6, 2, 4, 9, 1, 8,
                        4, 1, 8, 9, 7, 3, 6, 5, 2,
                        2, 9, 6, 1, 5, 8, 7, 4, 3,
                        8, 7, 5, 4, 3, 2, 1, 9, 6,
                        9, 4, 2, 7, 6, 1, 8, 3, 5,
                        6, 3, 1, 5, 8, 9, 2, 7, 4]
    let unsolvedPuzzleOne = [3, 0, 7, 4, 0, 1, 6, 2, 5,
                        2, 4, 0, 5, 0, 8, 3, 0, 9,
                        5, 0, 9, 3, 2, 7, 4, 1, 0,
                        7, 5, 8, 6, 1, 9, 2, 0, 4,
                        1, 2, 3, 7, 8, 4, 0, 9, 6,
                        0, 9, 6, 0, 5, 0, 1, 8, 7,
                        9, 3, 0, 1, 7, 6, 0, 5, 2,
                        6, 0, 5, 8, 0, 0, 9, 4, 1,
                        0, 1, 2, 0, 4, 5, 0, 6, 0]
    let unsolvedPuzzleTwo = [0, 0, 7, 9, 3, 0, 6, 2, 8,
                        1, 2, 3, 0, 6, 0, 5, 4, 0,
                        9, 0, 6, 0, 5, 4, 3, 7, 1,
                        0, 7, 4, 0, 8, 0, 1, 5, 3,
                        0, 0, 1, 5, 7, 2, 0, 9, 6,
                        5, 6, 0, 0, 1, 3, 2, 8, 0,
                        6, 1, 2, 0, 9, 0, 7, 0, 4,
                        7, 9, 0, 3, 0, 6, 0, 1, 2,
                        0, 4, 0, 1, 2, 7, 0, 0, 5]
    let unsolvedPuzzleThree = [5, 1, 8, 4, 2, 0, 7, 9, 0,
                        0, 7, 0, 1, 5, 6, 4, 0, 2,
                        4, 0, 6, 8, 0, 0, 5, 3, 1,
                        7, 4, 0, 0, 0, 8, 1, 5, 9,
                        3, 5, 1, 0, 7, 4, 0, 6, 0,
                        0, 8, 0, 5, 1, 2, 3, 7, 0,
                        0, 3, 7, 2, 8, 0, 6, 0, 5,
                        8, 0, 5, 0, 0, 1, 9, 2, 0,
                        0, 9, 4, 3, 6, 5, 8, 0, 7]
    let unsolvedPuzzleFour = [1, 2, 0, 0, 9, 0, 5, 8, 7,
                        0, 6, 3, 8, 1, 5, 0, 0, 9,
                        5, 0, 0, 2, 4, 7, 3, 6, 0,
                        0, 5, 7, 6, 2, 0, 9, 0, 8,
                        4, 0, 0, 9, 7, 3, 6, 0, 2,
                        2, 9, 0, 1, 5, 0, 0, 4, 3,
                        8, 7, 5, 0, 3, 2, 1, 9, 0,
                        0, 4, 2, 7, 6, 1, 0, 3, 5,
                        6, 0, 1, 0, 8, 0, 2, 7, 4]
    if isDigitTest "123456789" then
        putStrLn "isDigit works without any flaws" else
            putStrLn "isDigit does not work"
    -- if checkGenandSolved solvedPuzzleOne then
    --     putStrLn "Solve works without any flaws" else
    --         putStrLn "Solve does not work"
    if helperCheck solvedPuzzleOne (solve unsolvedPuzzleOne) then
        putStrLn "Puzzle One has been solved without any flaws" else
            putStrLn "Solve does not work"
    if helperCheck solvedPuzzleTwo (solve unsolvedPuzzleTwo) then
        putStrLn "Puzzle Two has been solvedwithout any flaws" else
            putStrLn "Solve does not work"
    if helperCheck solvedPuzzleThree (solve unsolvedPuzzleThree) then
        putStrLn "Puzzle Three has been solved without any flaws" else
            putStrLn "Solve does not work"
    if helperCheck solvedPuzzleFour (solve unsolvedPuzzleFour) then
        putStrLn "Puzzle Four has been solvedwithout any flaws" else
            putStrLn "Solve does not work"
    -- quickCheckN 100 quicktest1
    -- quickCheck 100 quicktest2
    quickCheckN 1000 joinTest
    quickCheck testOne
    -- quickCheck testTwo
    -- quickCheckN 100 conformTest
    -- quickCheckN 100 everyTest
    --quickCheckN 100 quadCheck
    --quickCheckN 100 removeRandomElementsTest
    --quickCheckN 1000 $ isValidImputTest