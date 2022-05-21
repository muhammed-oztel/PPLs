module PrettyPrint where
import Data.Tree 
import FamilyMember
import Data.Maybe
import FamilyTree


createNodes :: FamilyMember -> FamilyTree -> Tree String
createNodes root ft = do
    let rootChildren = children root
    if (spouse root) == Nothing then
        Node (fullName root) []
    else
        Node (fullName root ++ " & " ++ (fullName (fromJust (get_family_member (fromJust (spouse root)) (treeMembers ft))))) $ map (\child -> createNodes (fromJust (get_family_member child (treeMembers ft))) ft) rootChildren
 