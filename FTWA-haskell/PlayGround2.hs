import Data.List
import Data.Maybe
import Data.Time.Calendar
import FamilyMember 
import FamilyTree

-- | The main function
main :: IO ()
main = do
    putStrLn "Welcome to the family tree!"
    -- create a new family tree
    let familyTree = FamilyTree []
    -- create a new family member
    let familyMember = FamilyMember "John" "Doe" (fromGregorian 1970 1 1)
    -- add the family member to the family tree
    let familyTree' = addFamilyMember familyTree familyMember