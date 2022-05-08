import Data.Char
import Data.List
import Data.Time.Calendar
import Data.Time.Clock
import Data.Maybe
import Control.Monad (unless)
import FamilyTree

createFamilyTree :: IO FamilyTree
createFamilyTree = do
    putStrLn "Enter the name of the tree:"
    name <- getLine
    return FamilyTree{name = name, members=[], root=Nothing}



printTreeMenu :: FamilyTree -> IO ()
printTreeMenu tree = do
    putStrLn    "1. Add a person"
    -- putStrLn    "2. Update a person"
    -- putStrLn    "3. Get a person's status (dead or alive)"
    -- putStrLn    "4. Get a person's age"
    -- putStrLn    "5. Get a person's level"
    -- putStrLn    "6. Get a person's relationship with another person"
    -- putStrLn    "7. Print the tree"
    -- putStrLn    "8. Return to main menu"
    putStrLn   "Enter your choice: "
    choice <- getLine
    case choice of
        "1" -> do
            tree' <- addPerson tree 
            print $ tree'
            printTreeMenu tree'
        -- "2" -> updatePerson
        -- "3" -> getStatus
        -- "4" -> getAge
        -- "5" -> getLevel
        -- "6" -> getRelationship
        -- "7" -> printTree
        "8" -> return ()
        _   -> do
            putStrLn "Invalid choice"
            printTreeMenu tree
    



printMainMenu :: [FamilyTree] -> IO ()
printMainMenu trees = do
    putStrLn "1. Create a new family tree"
    putStrLn "2. Quit"
    putStrLn "\nEnter your choice: \n"
    choice <- getLine
    case choice of
        "1" -> do
            tree <- createFamilyTree
            putStrLn $ "Tree created: " ++ (name tree)
            let trees' = trees ++ [tree]
            printTreeMenu tree
            


        "2" -> do
            putStrLn "Goodbye!"
            print $ trees
            return ()


main :: IO ()
main = do
    -- call the function to ask for person info
    putStrLn "Welcome to the Family Tree Warehouse!\n"
    printMainMenu []