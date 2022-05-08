module FamilyTree where
import Data.List
import Data.Maybe
import Data.Time.Calendar

data FamilyTree = FamilyTree {
    name :: String,
    members :: [String],
    root :: Maybe String 
} deriving (Show)


addPerson :: FamilyTree -> IO FamilyTree -- take input for name and add to family tree
addPerson (FamilyTree name members root) = do
    putStrLn "Enter name of person to add:"
    newName <- getLine
    return (FamilyTree name (newName:members) root)
-- data FamilyMember = FamilyMember {
--         memName :: Maybe String, 
--         surname :: Maybe String, 
--         gender :: Maybe String, 
--         birth_date :: Maybe Day, 
--         death_date :: Maybe Day, 
--         father :: Maybe String, 
--         mother :: Maybe String, 
--         children :: Maybe [FamilyMember], 
--         tree :: Maybe FamilyTree, 
--         spouse :: Maybe FamilyMember
--         } deriving (Show)

