module FamilyTree where
import Data.List
import Data.Maybe
import Data.Time.Calendar
import FamilyMember 

data FamilyTree = FamilyTree {
    treeName :: String,
    treeMembers :: [FamilyMember],
    treeRoot :: Maybe String
} deriving (Show)



remove element list = filter (\e -> e/=element) list

-- funtion takes full name string and family tree and returns family member
getMember :: String -> FamilyTree -> Maybe FamilyMember
getMember name tree = find (\x -> fullName x == name) (treeMembers tree)

addSpouse :: String -> String -> FamilyTree -> FamilyTree
addSpouse s1 s2 ft = do
    let fm1 = fromJust (getMember s1 ft)
    let fm2 = fromJust (getMember s2 ft)
    let removedMembers = remove fm1 (remove fm2 (treeMembers ft))
    ft{treeMembers=fm1{spouse=Just s1}:fm2{spouse=Just s2}:removedMembers}




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



