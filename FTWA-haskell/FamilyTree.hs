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


addChild :: String -> String -> String -> FamilyTree -> FamilyTree
addChild child mother father ft = do
    let memChild = fromJust (getMember child ft)
    let memMother = fromJust (getMember mother ft)
    let memFather = fromJust (getMember father ft)
    let removedMembers = remove memChild (remove memMother (remove memFather (treeMembers ft)))
    let newChild = memChild{mother=Just mother, father=Just father}
    let newMother =memMother{children=child:children memMother}
    let newFather =memFather{children=child:children memFather}
    ft{treeMembers=newChild:newMother:newFather:removedMembers}

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


-- find if a member is a father of another member from the family tree
-- is_father :: FamilyMember -> FamilyMember -> Bool
-- is_father member1 member2 = isJust (father member1) && (fromJust (father member1) == member2)


getRelationship :: FamilyMember -> FamilyMember -> FamilyTree -> IO ()
getRelationship fm1 fm2 ft = do
    putStrLn "Hello"
    -- if is_father fm1 fm2 ft
    --     then putStrLn "Father"
    -- else do
    --     putStrLn "Not a father"