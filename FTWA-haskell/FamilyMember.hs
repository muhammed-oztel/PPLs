
module FamilyMember where


-- Family member module and class
-- Class FamilyMember that has certain attributes
data FamilyMember = FamilyMember {
        name :: String, 
        surname :: String, 
        gender :: String, 
        birth_date :: String, 
        death_date :: String, 
        father :: String, 
        mother :: String, 
        children :: [FamilyMember], 
        tree :: String, 
        spouse :: String, 
        } deriving (Show)

defaultFM :: FamilyMember
defaultFM = FamilyMember {
        name = "",
        surname = "",
        gender = "",
        birth_date = "",
        death_date = "",
        father = "",
        mother = "",
        children = [],
        tree = "",
        spouse = "",
}

-- example FM 
-- aMember = defaultFM {
--         name = "John",
--         surname = "Smith",
-- }
