
{-# LANGUAGE TypeSynonymInstances, FlexibleInstances #-}

module GUI (
    start
) where

--import System.Random
import Helper
import Generator
--import Control.Applicative
import Control.Monad


import qualified Graphics.UI.Threepenny as UI
import Graphics.UI.Threepenny.Core


start :: IO ()
start = startGUI defaultConfig setup

setup :: Window ->  UI ()
setup window = void $ do
    _ <- return window # set title "Currency Converter"
    fullboard <- liftIO $ gen
    easy <- UI.button #+ [string "Easy"]
    medium <- UI.button #+ [string "Medium"]
    hard <- UI.button #+ [string "Hard"]
    _ <- getBody window #+ [
            column [ string "Select difficulty:",
                row [element easy, element medium, element hard]
            ]]
    on UI.click easy $ \_ -> do
        _ <- getBody window # set children []
        board <- liftIO $ removeRandomElements fullboard 40 []
        runSetup board window
    on UI.click medium $ \_ -> do
        _ <- getBody window # set children []
        board <- liftIO $ removeRandomElements fullboard 50 []
        runSetup board window
    on UI.click hard $ \_ -> do
        _ <- getBody window # set children []
        board <- liftIO $ removeRandomElements fullboard 60 []
        runSetup board window
    return ()


runSetup :: [Int] -> Window -> UI ()
runSetup board window = do
    --addStyleSheet window "sudoku.css"
    r1c1 <- UI.input # set UI.value (show (board !! 0))
    r1c2 <- UI.input # set UI.value (show (board !! 1))
    r1c3 <- UI.input # set UI.value (show (board !! 2))
    r1c4 <- UI.input # set UI.value (show (board !! 3))
    r1c5 <- UI.input # set UI.value (show (board !! 4))
    r1c6 <- UI.input # set UI.value (show (board !! 5))
    r1c7 <- UI.input # set UI.value (show (board !! 6))
    r1c8 <- UI.input # set UI.value (show (board !! 7))
    r1c9 <- UI.input # set UI.value (show (board !! 8))
    r2c1 <- UI.input # set UI.value (show (board !! 9))
    r2c2 <- UI.input # set UI.value (show (board !! 10))
    r2c3 <- UI.input # set UI.value (show (board !! 11))
    r2c4 <- UI.input # set UI.value (show (board !! 12))
    r2c5 <- UI.input # set UI.value (show (board !! 13))
    r2c6 <- UI.input # set UI.value (show (board !! 14))
    r2c7 <- UI.input # set UI.value (show (board !! 15))
    r2c8 <- UI.input # set UI.value (show (board !! 16))
    r2c9 <- UI.input # set UI.value (show (board !! 17))
    r3c1 <- UI.input # set UI.value (show (board !! 18))
    r3c2 <- UI.input # set UI.value (show (board !! 19))
    r3c3 <- UI.input # set UI.value (show (board !! 20))
    r3c4 <- UI.input # set UI.value (show (board !! 21))
    r3c5 <- UI.input # set UI.value (show (board !! 22))
    r3c6 <- UI.input # set UI.value (show (board !! 23))
    r3c7 <- UI.input # set UI.value (show (board !! 24))
    r3c8 <- UI.input # set UI.value (show (board !! 25))
    r3c9 <- UI.input # set UI.value (show (board !! 26))
    r4c1 <- UI.input # set UI.value (show (board !! 27))
    r4c2 <- UI.input # set UI.value (show (board !! 28))
    r4c3 <- UI.input # set UI.value (show (board !! 29))
    r4c4 <- UI.input # set UI.value (show (board !! 30))
    r4c5 <- UI.input # set UI.value (show (board !! 31))
    r4c6 <- UI.input # set UI.value (show (board !! 32))
    r4c7 <- UI.input # set UI.value (show (board !! 33))
    r4c8 <- UI.input # set UI.value (show (board !! 34))
    r4c9 <- UI.input # set UI.value (show (board !! 35))
    r5c1 <- UI.input # set UI.value (show (board !! 36))
    r5c2 <- UI.input # set UI.value (show (board !! 37))
    r5c3 <- UI.input # set UI.value (show (board !! 38))
    r5c4 <- UI.input # set UI.value (show (board !! 39))
    r5c5 <- UI.input # set UI.value (show (board !! 40))
    r5c6 <- UI.input # set UI.value (show (board !! 41))
    r5c7 <- UI.input # set UI.value (show (board !! 42))
    r5c8 <- UI.input # set UI.value (show (board !! 43))
    r5c9 <- UI.input # set UI.value (show (board !! 44))
    r6c1 <- UI.input # set UI.value (show (board !! 45))
    r6c2 <- UI.input # set UI.value (show (board !! 46))
    r6c3 <- UI.input # set UI.value (show (board !! 47))
    r6c4 <- UI.input # set UI.value (show (board !! 48))
    r6c5 <- UI.input # set UI.value (show (board !! 49))
    r6c6 <- UI.input # set UI.value (show (board !! 50))
    r6c7 <- UI.input # set UI.value (show (board !! 51))
    r6c8 <- UI.input # set UI.value (show (board !! 52))
    r6c9 <- UI.input # set UI.value (show (board !! 53))
    r7c1 <- UI.input # set UI.value (show (board !! 54))
    r7c2 <- UI.input # set UI.value (show (board !! 55))
    r7c3 <- UI.input # set UI.value (show (board !! 56))
    r7c4 <- UI.input # set UI.value (show (board !! 57))
    r7c5 <- UI.input # set UI.value (show (board !! 58))
    r7c6 <- UI.input # set UI.value (show (board !! 59))
    r7c7 <- UI.input # set UI.value (show (board !! 60))
    r7c8 <- UI.input # set UI.value (show (board !! 61))
    r7c9 <- UI.input # set UI.value (show (board !! 62))
    r8c1 <- UI.input # set UI.value (show (board !! 63))
    r8c2 <- UI.input # set UI.value (show (board !! 64))
    r8c3 <- UI.input # set UI.value (show (board !! 65))
    r8c4 <- UI.input # set UI.value (show (board !! 66))
    r8c5 <- UI.input # set UI.value (show (board !! 67))
    r8c6 <- UI.input # set UI.value (show (board !! 68))
    r8c7 <- UI.input # set UI.value (show (board !! 69))
    r8c8 <- UI.input # set UI.value (show (board !! 70))
    r8c9 <- UI.input # set UI.value (show (board !! 71))
    r9c1 <- UI.input # set UI.value (show (board !! 72))
    r9c2 <- UI.input # set UI.value (show (board !! 73))
    r9c3 <- UI.input # set UI.value (show (board !! 74))
    r9c4 <- UI.input # set UI.value (show (board !! 75))
    r9c5 <- UI.input # set UI.value (show (board !! 76))
    r9c6 <- UI.input # set UI.value (show (board !! 77))
    r9c7 <- UI.input # set UI.value (show (board !! 78))
    r9c8 <- UI.input # set UI.value (show (board !! 79))
    r9c9 <- UI.input # set UI.value (show (board !! 80))
    newGameButton <- UI.button #+ [string "New Game"]
    solveButton <- UI.button #+ [string "Solve"]
    quitButton <- UI.button #+ [string "Quit"]

    
    _ <- getBody window #+ [
            column [
                grid [[element r1c1, element r1c2, element r1c3, element r1c4, element r1c5, element r1c6, element r1c7, element r1c8, element r1c9],
                      [element r2c1, element r2c2, element r2c3, element r2c4, element r2c5, element r2c6, element r2c7, element r2c8, element r2c9],
                      [element r3c1, element r3c2, element r3c3, element r3c4, element r3c5, element r3c6, element r3c7, element r3c8, element r3c9],
                      [element r4c1, element r4c2, element r4c3, element r4c4, element r4c5, element r4c6, element r4c7, element r4c8, element r4c9],
                      [element r5c1, element r5c2, element r5c3, element r5c4, element r5c5, element r5c6, element r5c7, element r5c8, element r5c9],
                      [element r6c1, element r6c2, element r6c3, element r6c4, element r6c5, element r6c6, element r6c7, element r6c8, element r6c9],
                      [element r7c1, element r7c2, element r7c3, element r7c4, element r7c5, element r7c6, element r7c7, element r7c8, element r7c9],
                      [element r8c1, element r8c2, element r8c3, element r8c4, element r8c5, element r8c6, element r8c7, element r8c8, element r8c9],
                      [element r9c1, element r9c2, element r9c3, element r9c4, element r9c5, element r9c6, element r9c7, element r9c8, element r9c9]]
            ,row [element newGameButton, element solveButton, element quitButton]
            ]]

    on UI.click newGameButton $ \_ -> do
        _ <- getBody window # set children []
        newBoard <- liftIO $ gen 
        board1 <- liftIO $ removeRandomElements newBoard 40 []
        runSetup board1 window
    
    on UI.click solveButton $ \_ -> do
        _ <- getBody window # set children []
        let newboard = solve board
        runSetup (head newboard) window

    on UI.click quitButton $ \_ -> do
        _ <- getBody window # set children []
        return ()


    on UI.valueChange r1c1 $ \r1c1In -> do
        if (r1c1In /= "0") && (placeable board 0 0 (read r1c1In)) then do
            let board1 = place board 0 0 (read r1c1In)
            runSetup board1 window
        else do
            runSetup board window
    
    on UI.valueChange r1c2 $ \r1c2In -> do
        if (r1c2In /= "0") && (placeable board 0 1 (read r1c2In)) then do
            let board1 = place board 0 1 (read r1c2In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r1c3 $ \r1c3In -> do
        if (r1c3In /= "0") && (placeable board 0 2 (read r1c3In)) then do
            let board1 = place board 0 2 (read r1c3In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r1c4 $ \r1c4In -> do
        if (r1c4In /= "0") && (placeable board 0 3 (read r1c4In)) then do
            let board1 = place board 0 3 (read r1c4In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r1c5 $ \r1c5In -> do
        if (r1c5In /= "0") && (placeable board 0 4 (read r1c5In)) then do
            let board1 = place board 0 4 (read r1c5In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r1c6 $ \r1c6In -> do
        if (r1c6In /= "0") && (placeable board 0 5 (read r1c6In)) then do
            let board1 = place board 0 5 (read r1c6In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r1c7 $ \r1c7In -> do
        if (r1c7In /= "0") && (placeable board 0 6 (read r1c7In)) then do
            let board1 = place board 0 6 (read r1c7In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r1c8 $ \r1c8In -> do
        if (r1c8In /= "0") && (placeable board 0 7 (read r1c8In)) then do
            let board1 = place board 0 7 (read r1c8In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r1c9 $ \r1c9In -> do
        if (r1c9In /= "0") && (placeable board 0 8 (read r1c9In)) then do
            let board1 = place board 0 8 (read r1c9In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r2c1 $ \r2c1In -> do
        if (r2c1In /= "0") && (placeable board 1 0 (read r2c1In)) then do
            let board1 = place board 1 0 (read r2c1In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r2c2 $ \r2c2In -> do
        if (r2c2In /= "0") && (placeable board 1 1 (read r2c2In)) then do
            let board1 = place board 1 1 (read r2c2In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r2c3 $ \r2c3In -> do
        if (r2c3In /= "0") && (placeable board 1 2 (read r2c3In)) then do
            let board1 = place board 1 2 (read r2c3In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r2c4 $ \r2c4In -> do
        if (r2c4In /= "0") && (placeable board 1 3 (read r2c4In)) then do
            let board1 = place board 1 3 (read r2c4In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r2c5 $ \r2c5In -> do
        if (r2c5In /= "0") && (placeable board 1 4 (read r2c5In)) then do
            let board1 = place board 1 4 (read r2c5In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r2c6 $ \r2c6In -> do
        if (r2c6In /= "0") && (placeable board 1 5 (read r2c6In)) then do
            let board1 = place board 1 5 (read r2c6In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r2c7 $ \r2c7In -> do
        if (r2c7In /= "0") && (placeable board 1 6 (read r2c7In)) then do
            let board1 = place board 1 6 (read r2c7In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r2c8 $ \r2c8In -> do
        if (r2c8In /= "0") && (placeable board 1 7 (read r2c8In)) then do
            let board1 = place board 1 7 (read r2c8In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r2c9 $ \r2c9In -> do
        if (r2c9In /= "0") && (placeable board 1 8 (read r2c9In)) then do
            let board1 = place board 1 8 (read r2c9In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r3c1 $ \r3c1In -> do
        if (r3c1In /= "0") && (placeable board 2 0 (read r3c1In)) then do
            let board1 = place board 2 0 (read r3c1In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r3c2 $ \r3c2In -> do
        if (r3c2In /= "0") && (placeable board 2 1 (read r3c2In)) then do
            let board1 = place board 2 1 (read r3c2In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r3c3 $ \r3c3In -> do
        if (r3c3In /= "0") && (placeable board 2 2 (read r3c3In)) then do
            let board1 = place board 2 2 (read r3c3In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r3c4 $ \r3c4In -> do
        if (r3c4In /= "0") && (placeable board 2 3 (read r3c4In)) then do
            let board1 = place board 2 3 (read r3c4In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r3c5 $ \r3c5In -> do
        if (r3c5In /= "0") && (placeable board 2 4 (read r3c5In)) then do
            let board1 = place board 2 4 (read r3c5In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r3c6 $ \r3c6In -> do
        if (r3c6In /= "0") && (placeable board 2 5 (read r3c6In)) then do
            let board1 = place board 2 5 (read r3c6In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r3c7 $ \r3c7In -> do
        if (r3c7In /= "0") && (placeable board 2 6 (read r3c7In)) then do
            let board1 = place board 2 6 (read r3c7In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r3c8 $ \r3c8In -> do
        if (r3c8In /= "0") && (placeable board 2 7 (read r3c8In)) then do
            let board1 = place board 2 7 (read r3c8In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r3c9 $ \r3c9In -> do
        if (r3c9In /= "0") && (placeable board 2 8 (read r3c9In)) then do
            let board1 = place board 2 8 (read r3c9In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r4c1 $ \r4c1In -> do
        if (r4c1In /= "0") && (placeable board 3 0 (read r4c1In)) then do
            let board1 = place board 3 0 (read r4c1In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r4c2 $ \r4c2In -> do
        if (r4c2In /= "0") && (placeable board 3 1 (read r4c2In)) then do
            let board1 = place board 3 1 (read r4c2In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r4c3 $ \r4c3In -> do
        if (r4c3In /= "0") && (placeable board 3 2 (read r4c3In)) then do
            let board1 = place board 3 2 (read r4c3In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r4c4 $ \r4c4In -> do
        if (r4c4In /= "0") && (placeable board 3 3 (read r4c4In)) then do
            let board1 = place board 3 3 (read r4c4In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r4c5 $ \r4c5In -> do
        if (r4c5In /= "0") && (placeable board 3 4 (read r4c5In)) then do
            let board1 = place board 3 4 (read r4c5In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r4c6 $ \r4c6In -> do
        if (r4c6In /= "0") && (placeable board 3 5 (read r4c6In)) then do
            let board1 = place board 3 5 (read r4c6In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r4c7 $ \r4c7In -> do
        if (r4c7In /= "0") && (placeable board 3 6 (read r4c7In)) then do
            let board1 = place board 3 6 (read r4c7In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r4c8 $ \r4c8In -> do
        if (r4c8In /= "0") && (placeable board 3 7 (read r4c8In)) then do
            let board1 = place board 3 7 (read r4c8In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r4c9 $ \r4c9In -> do
        if (r4c9In /= "0") && (placeable board 3 8 (read r4c9In)) then do
            let board1 = place board 3 8 (read r4c9In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r5c1 $ \r5c1In -> do
        if (r5c1In /= "0") && (placeable board 4 0 (read r5c1In)) then do
            let board1 = place board 4 0 (read r5c1In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r5c2 $ \r5c2In -> do
        if (r5c2In /= "0") && (placeable board 4 1 (read r5c2In)) then do
            let board1 = place board 4 1 (read r5c2In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r5c3 $ \r5c3In -> do
        if (r5c3In /= "0") && (placeable board 4 2 (read r5c3In)) then do
            let board1 = place board 4 2 (read r5c3In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r5c4 $ \r5c4In -> do
        if (r5c4In /= "0") && (placeable board 4 3 (read r5c4In)) then do
            let board1 = place board 4 3 (read r5c4In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r5c5 $ \r5c5In -> do
        if (r5c5In /= "0") && (placeable board 4 4 (read r5c5In)) then do
            let board1 = place board 4 4 (read r5c5In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r5c6 $ \r5c6In -> do
        if (r5c6In /= "0") && (placeable board 4 5 (read r5c6In)) then do
            let board1 = place board 4 5 (read r5c6In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r5c7 $ \r5c7In -> do
        if (r5c7In /= "0") && (placeable board 4 6 (read r5c7In)) then do
            let board1 = place board 4 6 (read r5c7In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r5c8 $ \r5c8In -> do
        if (r5c8In /= "0") && (placeable board 4 7 (read r5c8In)) then do
            let board1 = place board 4 7 (read r5c8In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r5c9 $ \r5c9In -> do
        if (r5c9In /= "0") && (placeable board 4 8 (read r5c9In)) then do
            let board1 = place board 4 8 (read r5c9In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r6c1 $ \r6c1In -> do
        if (r6c1In /= "0") && (placeable board 5 0 (read r6c1In)) then do
            let board1 = place board 5 0 (read r6c1In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r6c2 $ \r6c2In -> do
        if (r6c2In /= "0") && (placeable board 5 1 (read r6c2In)) then do
            let board1 = place board 5 1 (read r6c2In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r6c3 $ \r6c3In -> do
        if (r6c3In /= "0") && (placeable board 5 2 (read r6c3In)) then do
            let board1 = place board 5 2 (read r6c3In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r6c4 $ \r6c4In -> do
        if (r6c4In /= "0") && (placeable board 5 3 (read r6c4In)) then do
            let board1 = place board 5 3 (read r6c4In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r6c5 $ \r6c5In -> do
        if (r6c5In /= "0") && (placeable board 5 4 (read r6c5In)) then do
            let board1 = place board 5 4 (read r6c5In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r6c6 $ \r6c6In -> do
        if (r6c6In /= "0") && (placeable board 5 5 (read r6c6In)) then do
            let board1 = place board 5 5 (read r6c6In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r6c7 $ \r6c7In -> do
        if (r6c7In /= "0") && (placeable board 5 6 (read r6c7In)) then do
            let board1 = place board 5 6 (read r6c7In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r6c8 $ \r6c8In -> do
        if (r6c8In /= "0") && (placeable board 5 7 (read r6c8In)) then do
            let board1 = place board 5 7 (read r6c8In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r6c9 $ \r6c9In -> do
        if (r6c9In /= "0") && (placeable board 5 8 (read r6c9In)) then do
            let board1 = place board 5 8 (read r6c9In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r7c1 $ \r7c1In -> do
        if (r7c1In /= "0") && (placeable board 6 0 (read r7c1In)) then do
            let board1 = place board 6 0 (read r7c1In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r7c2 $ \r7c2In -> do
        if (r7c2In /= "0") && (placeable board 6 1 (read r7c2In)) then do
            let board1 = place board 6 1 (read r7c2In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r7c3 $ \r7c3In -> do
        if (r7c3In /= "0") && (placeable board 6 2 (read r7c3In)) then do
            let board1 = place board 6 2 (read r7c3In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r7c4 $ \r7c4In -> do
        if (r7c4In /= "0") && (placeable board 6 3 (read r7c4In)) then do
            let board1 = place board 6 3 (read r7c4In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r7c5 $ \r7c5In -> do
        if (r7c5In /= "0") && (placeable board 6 4 (read r7c5In)) then do
            let board1 = place board 6 4 (read r7c5In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r7c6 $ \r7c6In -> do
        if (r7c6In /= "0") && (placeable board 6 5 (read r7c6In)) then do
            let board1 = place board 6 5 (read r7c6In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r7c7 $ \r7c7In -> do
        if (r7c7In /= "0") && (placeable board 6 6 (read r7c7In)) then do
            let board1 = place board 6 6 (read r7c7In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r7c8 $ \r7c8In -> do
        if (r7c8In /= "0") && (placeable board 6 7 (read r7c8In)) then do
            let board1 = place board 6 7 (read r7c8In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r7c9 $ \r7c9In -> do
        if (r7c9In /= "0") && (placeable board 6 8 (read r7c9In)) then do
            let board1 = place board 6 8 (read r7c9In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r8c1 $ \r8c1In -> do
        if (r8c1In /= "0") && (placeable board 7 0 (read r8c1In)) then do
            let board1 = place board 7 0 (read r8c1In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r8c2 $ \r8c2In -> do
        if (r8c2In /= "0") && (placeable board 7 1 (read r8c2In)) then do
            let board1 = place board 7 1 (read r8c2In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r8c3 $ \r8c3In -> do
        if (r8c3In /= "0") && (placeable board 7 2 (read r8c3In)) then do
            let board1 = place board 7 2 (read r8c3In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r8c4 $ \r8c4In -> do
        if (r8c4In /= "0") && (placeable board 7 3 (read r8c4In)) then do
            let board1 = place board 7 3 (read r8c4In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r8c5 $ \r8c5In -> do
        if (r8c5In /= "0") && (placeable board 7 4 (read r8c5In)) then do
            let board1 = place board 7 4 (read r8c5In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r8c6 $ \r8c6In -> do
        if (r8c6In /= "0") && (placeable board 7 5 (read r8c6In)) then do
            let board1 = place board 7 5 (read r8c6In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r8c7 $ \r8c7In -> do
        if (r8c7In /= "0") && (placeable board 7 6 (read r8c7In)) then do
            let board1 = place board 7 6 (read r8c7In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r8c8 $ \r8c8In -> do
        if (r8c8In /= "0") && (placeable board 7 7 (read r8c8In)) then do
            let board1 = place board 7 7 (read r8c8In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r8c9 $ \r8c9In -> do
        if (r8c9In /= "0") && (placeable board 7 8 (read r8c9In)) then do
            let board1 = place board 7 8 (read r8c9In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r9c1 $ \r9c1In -> do
        if (r9c1In /= "0") && (placeable board 8 0 (read r9c1In)) then do
            let board1 = place board 8 0 (read r9c1In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r9c2 $ \r9c2In -> do
        if (r9c2In /= "0") && (placeable board 8 1 (read r9c2In)) then do
            let board1 = place board 8 1 (read r9c2In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r9c3 $ \r9c3In -> do
        if (r9c3In /= "0") && (placeable board 8 2 (read r9c3In)) then do
            let board1 = place board 8 2 (read r9c3In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r9c4 $ \r9c4In -> do
        if (r9c4In /= "0") && (placeable board 8 3 (read r9c4In)) then do
            let board1 = place board 8 3 (read r9c4In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r9c5 $ \r9c5In -> do
        if (r9c5In /= "0") && (placeable board 8 4 (read r9c5In)) then do
            let board1 = place board 8 4 (read r9c5In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r9c6 $ \r9c6In -> do
        if (r9c6In /= "0") && (placeable board 8 5 (read r9c6In)) then do
            let board1 = place board 8 5 (read r9c6In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r9c7 $ \r9c7In -> do
        if (r9c7In /= "0") && (placeable board 8 6 (read r9c7In)) then do
            let board1 = place board 8 6 (read r9c7In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r9c8 $ \r9c8In -> do
        if (r9c8In /= "0") && (placeable board 8 7 (read r9c8In)) then do
            let board1 = place board 8 7 (read r9c8In)
            runSetup board1 window
        else do
            runSetup board window

    on UI.valueChange r9c9 $ \r9c9In -> do
        if (r9c9In /= "0") && (placeable board 8 8 (read r9c9In)) then do
            let board1 = place board 8 8 (read r9c9In)
            runSetup board1 window
        else do
            runSetup board window
    

    return ()