# Project Title

Team members:

- Mayur Reddy Sangepu
- Hima Bindu Krovvidi
- Anurag Kacham

## Summary Description

The goal of this project was to use TUI and GUI interfaces to produce an efficient, user-friendly Sudoku game. We created a Sudoku generator module that generates random sudoku puzzles and includes a difficulty feature that allows the user to select the level of difficulty they wish to play at. We implemented the game using two types of interfaces: text-view and graphical-user interfaces. Both interfaces provide a comfortable and user-friendly environment for the user to play in, with a display warning stating "invalid input" when the user inputs an incorrect number in the relevant cell.

## Project Execution Summary

We began by creating a puzzle with a 9x9 grid, which we determined as our standard grid size by using a list of integer types. This is the same data structure that was continuously changed as the user provided inputs until the end. A function will be invoked to generate the puzzle, and random values will be added to the list. Before assigning these random values to the list, each element to be inserted will undergo validity checks. These checks entail addressing all of the constraints required for the puzzle to be valid and solvable. Validity checks encompass constraints such as ensuring that the same two integers are not in the same row or column. Another crucial requirement that was covered was that there was no repeat of any number in any given 3x3 block belonging to the 9x9 grid, i.e., each number appeared only once. Following the generation of the puzzle, based on the difficulty selected, the puzzle will be modified to conform to the difficulty desired by the user. The puzzle adjustment based on the specified complexity consists of a stage in which random values are deleted and the table is updated. Before the user can begin playing the game, the user must select either the interface in which they want to play the game or whether they want to exit the game. If the user chooses to play the game in Text-View mode, a command-line interface will be launched, allowing the user to play the game in the terminal used. If the user chooses to play the game in graphic-user mode, a URL will be displayed to the user, allowing the user to play the game in any browser in graphic-user mode. When the user inputs a number to be placed in an empty cell, the data type of the input is confirmed, whether it is a digit or not, and only then will the validity checks on the input provided take place. If the digit entered passes the validity checks, i.e., it is appropriately inserted, the table is updated, and the user is prompted to enter the next number. This operation is repeated until the board is entirely full. The message "SOLVED!" is displayed to the user once the user has finished providing input and the board is completely filled.

Learning how to integrate a graphical user interface with Haskell was one of the most valuable lessons that could be obtained from working on this project. To begin the process of putting this into action, we needed to first have an understanding of the necessary libraries. We discovered the appropriate locations to import these libraries, such as the cabal and stack.yaml files. We also learned how to add buttons, display grids, display any messages, and other similar skills. While implementing any project, we discovered that Haskell may be coupled with a variety of languages in a variety of ways. Adding in the build dependencies has been a solution to this problem. The employment of other libraries in Haskell is an additional crucial learning opportunity presented by this project. Important libraries like threepenny-gui and QuickCheck were among the libraries that were incorporated into our project by referencing the libraries in the cabal and stack files and installing them. First and foremost, this project educated us on the significance of functional programming, as well as when and why it should be used, as well as the kind of projects that are most suited for functional programming. Additionally, we were able to learn effective testing methods such as QuickCheck and how to put them into practice according to this project.

## Additional Details

Build depends required for this project:
  random
  threepenny-gui
  safe

Build depends required for the testing of this project:
  random,
  threepenny-gui,
  quickcheck-instances,
  QuickCheck

Extra-deps required for this project:
  threepenny,
  snap,
  web sockets,
  io streams,
  readable

  Generator, Main, the Graphical User Interface, and Test are the primary modules that make up this project. The Generator module houses all of the functionality necessary for the creation, modification, and validation of the puzzles. The functionality associated with the Text-View interface can be found within the Main module. The Graphical User Interface (GUI) module is where all of the functionality relating the implementation and maintenance of the GUI can be found. The functionality concerning the testing of the many different facets of this project is contained within the Test module. The generation and updation of the puzzle has been implemented in an individual module namely, the Generator module. This is considered as one of the main modules, since the Main, GUI and Test module utilize the Generator module. And, there are two other modules for differentiating the type of interface, for the user to choose. For testing the working of different functions built, a different module named Test has been implemented in order to present the validity of working that has been developed.

The gen function implementation provided us with a solid understanding of Haskell capabilities like IO. In addition, the code has been cleansed to remove any unnecessary lines of code and has been presented in a more compact and concise format.

```haskell
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
```

This function is written in such a way that it keeps track of the numbers eliminated so that it does not remove the same digits consecutively. Using this function, we remove elements from the created problem in order to reflect the difficulty of the puzzle provided.
```haskell
removeRandomElements :: [Int] -> Int -> [Int] -> IO [Int]
removeRandomElements board 0 _ = return board
removeRandomElements board n xs = do
  r <- randomRIO (0, 80)
  if (r `elem` xs) then do
    removeRandomElements board n xs
  else do
    let newBoard = place board (r `div` 9) (r `mod` 9 ) 0
    removeRandomElements newBoard (n-1) (r:xs)
```

The activities required to develop the graphical user interface were the most difficult to deal with because it was new to us, there was no support for it, and there were version compatibility concerns.

An attempt was made to implement GTK+3, however integration became unfeasible due to the lack of support for MacOS systems, thus we chose threepenny-gui as the best solution to develop the graphical user interface.

Review the final project grading rubric and discuss any relevant aspects of the
project.

## Instructions:

1. Download the code-ZIP and run "stack ghci".
2. Make a choice between TUI and GUI in-order to start the game.
3. Select the difficulty from the options: Easy, Medium and Hard.
4. Play the game and follow the instructions as you play.

For running test-cases, simply run "stack test".

## Conclusion:

Creating a text-view Sudoku game in a text-view interface was simple, but we wanted to challenge ourselves by creating tests and developing the graphical interface. We wanted to take on this task because there was a dearth of support for the Haskell GUI frameworks. We attempted to implement the GUI with GTK+3, however there was no foundation or extensive resources from which to base our solution. Because other programming languages provide scope and resources for GUI implementation, whereas Haskell has very restricted scope, we wanted to investigate and design an efficient GUI implementation application.
