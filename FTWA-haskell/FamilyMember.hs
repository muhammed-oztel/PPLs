
module FamilyMember where
import Data.Time.Calendar
import Data.Maybe

data FamilyMember = FamilyMember {
    firstName :: String,
    lastName :: String,
    gender :: String,
    birthDate :: Maybe Day,
    deathDate :: Maybe Day,
    father :: Maybe FamilyMember,
    mother :: Maybe FamilyMember,
    children :: [FamilyMember],
    tree :: Maybe String,
    spouse :: Maybe FamilyMember
} deriving (Show)


-- if firstname and lastnames are same, then they are same person
-- if the birth date is bigger the the person bigger
instance Eq FamilyMember where
    (==) (FamilyMember fname1 lname1 _ _ _ _ _ _ _ _) (FamilyMember fname2 lname2 _ _ _ _ _ _ _ _) = fname1 == fname2 && lname1 == lname2



addSpouse :: FamilyMember -> FamilyMember -> [FamilyMember]
addSpouse fm1 fm2 = [fm1{spouse = Just fm2}, fm2{spouse = Just fm1}]


--check if the person has a death date then its not alive
isAlive :: FamilyMember -> Bool
isAlive fm = isNothing $ deathDate fm

 

getAge :: FamilyMember -> Int
getAge fm = fromIntegral $ diffDays (fromJust $ birthDate fm) (fromJust $ deathDate fm)


--function that number of ancestors by checking father
getLevel :: FamilyMember -> Int
getLevel FamilyMember{father=Nothing} = 1
getLevel fm = 1 + getLevel (fromJust $ father fm)



-- TODO: add relationships
-- getRelationship :: FamilyMember -> String
setTree :: FamilyMember -> String -> FamilyMember
setTree fm tree = fm{tree = Just tree}

