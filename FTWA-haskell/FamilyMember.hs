
module FamilyMember where
import Data.Dates
import Data.Time.Calendar
import FamilyTree

-- Family member module and class
-- Class FamilyMember that has certain attributes
data FamilyMember = FamilyMember {
        name :: Maybe String, 
        surname :: Maybe String, 
        gender :: Maybe String, 
        birth_date :: Maybe Day, 
        death_date :: Maybe Day, 
        father :: Maybe String, 
        mother :: Maybe String, 
        children :: Maybe [FamilyMember], 
        tree :: Maybe FamilyTree, 
        spouse :: Maybe FamilyMember
        } deriving (Show)

defaultFM :: FamilyMember
defaultFM = FamilyMember {
        name = "",
        surname = "",
        gender = "",
        birth_date = DateTime{},
        death_date = ,
        father = "",
        mother = "",
        children = [],
        tree = "",
        spouse = 
}

-- example FM 
-- aMember = defaultFM {
--         name = "John",
--         surname = "Smith",
-- }



