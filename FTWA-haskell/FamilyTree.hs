module FamilyTree where
import Data.List
import FamilyMember

data FamilyTree = FamilyTree {
    name :: String,
    members :: [FamilyMember],
    root :: FamilyMember 
}

