
module FamilyMember where
import Data.Time.Calendar
import Data.Time.Clock
import Data.Maybe

data FamilyMember = FamilyMember {
    firstName :: String,
    lastName :: String,
    gender :: String,
    birthDate :: Maybe Day,
    deathDate :: Maybe Day,
    father :: Maybe String,
    mother :: Maybe String,
    children :: [String],
    tree :: Maybe String,
    spouse :: Maybe String
} deriving (Show)


instance Eq FamilyMember where
    (==) (FamilyMember fname1 lname1 _ _ _ _ _ _ _ _) (FamilyMember fname2 lname2 _ _ _ _ _ _ _ _) = fname1 == fname2 && lname1 == lname2


isAlive :: FamilyMember -> Bool
isAlive fm = isNothing $ deathDate fm

 
getAge :: FamilyMember -> Integer 
getAge fm = do
    if birthDate fm == Nothing then 0
    else do
        if (isAlive fm) then (diffDays (fromGregorian 2022 05 22) (fromJust $ birthDate fm)) `div` 365
        else (diffDays (fromJust $ deathDate fm) (fromJust $ birthDate fm)) `div` 365



setTree :: FamilyMember -> String -> FamilyMember
setTree fm tree = fm{tree = Just tree}

fullName :: FamilyMember -> String
fullName fm = firstName fm ++ " " ++ lastName fm
