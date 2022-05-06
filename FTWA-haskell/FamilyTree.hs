import Data.List
import FamilyMember

module FamilyTree where



data FamilyTree = FamilyTree {
    name :: String,
    members :: [FamilyMember],
    root :: FamilyMember | None   
}

