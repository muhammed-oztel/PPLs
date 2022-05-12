module FamilyTree where
import Data.List
import Data.Maybe
import Data.Time.Calendar
import FamilyMember 

data FamilyTree = FamilyTree {
    treeName :: String,
    treeMembers :: [FamilyMember]
    treeRoot :: Maybe FamilyMember
} derivng (Show)



addMember :: FamilyMember -> FamilyTree -> FamilyTree
addMember fm (FamilyTree tn tmembers tr) = set element (elemIndex fm) 

-- function that replace the given member from the list of members
updateMember :: FamilyMember -> FamilyTree -> FamilyTree
updateMember fm ft = ft { treeMembers = replace (treeMembers ft) fm }

updatePerson :: FamilyTree -> IO FamilyTree -- ask for which user to update and update their info
updatePerson (FamilyTree name members root) = do
    putStrLn "Enter name of person to update:"
    updateName <- getLine
    let updatePerson = find (\x -> memName x == updateName) members
    if updatePerson == Nothing 
        then do
            putStrLn "Person not found"
            return (FamilyTree name members root) 

    else do
        putStrLn "1. Add a spouse"
        putStrLn "2. Add a child"
        putStrLn "3. Add gender"
        putStrLn "4. Add birth date"
        putStrLn "5. Add death date"
        putStrLn "6. Add father"
        putStrLn "7. Add mother"
        putStrLn "8. Return to  tree menu"
        return (FamilyTree name members root)

    -- if updateName `elem` ( members) 
    --     then do
    --         putStrLn "1. Add a spouse"
    --         putStrLn "2. Add a child"
    --         putStrLn "3. Add gender"
    --         putStrLn "4. Add birth date"
    --         putStrLn "5. Add death date"
    --         putStrLn "6. Add father"
    --         putStrLn "7. Add mother"
    --         putStrLn "8. Return to  tree menu"
    --         option <- getLine
    --         putStrLn "Enter new information:"
    --         -- case option of
    --         --     "7" -> do

            
    -- else do
    --     putStrLn "Person not found"
    -- return (FamilyTree name members root)