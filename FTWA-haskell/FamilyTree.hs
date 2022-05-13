module FamilyTree where
import Data.List
import Data.Maybe
import Data.Time.Calendar
import FamilyMember 

data FamilyTree = FamilyTree {
    treeName :: String,
    treeMembers :: [FamilyMember],
    treeRoot :: Maybe FamilyMember
} deriving (Show)



remove element list = filter (\e -> e/=element) list

-- addPerson :: FamilyTree -> IO FamilyTree
-- addPerson tree = do
--     putStrLn "Enter the name of the person:"
--     givenName <- getLine
--     putStrLn "Enter the surname of the person:"
--     givenSurname <- getLine
--     putStrLn "Enter the gender of the person(M/F):"
--     givenGender <- getLine

addChild :: FamilyMember -> FamilyMember -> FamilyMember -> FamilyTree -> FamilyTree
addChild child mother father ft = do
    let newChild = child{mother=Just mother, father=Just father}
    let newMother = mother{children=newChild:children mother}
    let newFather = father{children=newChild:children father}
    ft{treeMembers=newChild:newMother:newFather: remove child (treeMembers ft)}

addMember :: FamilyTree -> FamilyMember -> FamilyTree
addMember ft fm = ft { treeMembers = fm : treeMembers ft }

-- function that replace the given member from the list of members
updateMemberList :: FamilyMember -> FamilyTree -> FamilyTree
updateMemberList fm ft = ft { treeMembers = fm : remove fm (treeMembers ft) }

updatePerson :: FamilyTree -> IO FamilyTree -- ask for which user to update and update their info
updatePerson (FamilyTree name members root) = do
    putStrLn "Enter name of person to update:"
    updateName <- getLine
    let updatePerson = find (\x -> firstName x ++ " " ++ lastName x == updateName) members
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


-- getMemberDetails :: FamilyMember -> FamilyTree -> IO 
-- getMemberDetails fm ft = do
--     putStrLn "Details of " ++ firstName fm ++ " " ++ lastName fm
--     putStrLn "age: " ++ show (getAge fm)
--     putStrLn "is alive: " ++ show (isAlive fm)
--     putStrLn "level in Family tree: " ++ show (getLevel fm)