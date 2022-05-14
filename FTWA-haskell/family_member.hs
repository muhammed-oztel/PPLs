import Data.Time.Calendar


data FamilyMember = FamilyMember {
    full_name :: Maybe String, 
    gender :: Maybe String, 
    birth_date :: Maybe DateTime, 
    death_date :: Maybe DateTime, 
    father :: Maybe String, 
    mother :: Maybe String, 
    children :: Maybe [String],
    spouse :: Maybe String
    } deriving (Show)

-- create a family tree as a list of family members
family_tree :: [FamilyMember]

-- function to add a family member to the family tree
add_family_member :: FamilyMember -> [FamilyMember] -> [FamilyMember]
add_family_member member family_tree = family_tree ++ [member]

set_full_name :: String -> FamilyMember -> FamilyMember
set_full_name name member = member {full_name = Just name}

set_gender :: String -> FamilyMember -> FamilyMember
set_gender gender member = member {gender = Just gender}

set_birth_date :: DateTime -> FamilyMember -> FamilyMember
set_birth_date birth_date member = member {birth_date = Just birth_date}

set_death_date :: DateTime -> FamilyMember -> FamilyMember
set_death_date death_date member = member {death_date = Just death_date}

set_father :: String -> FamilyMember -> FamilyMember
set_father father member = member {father = Just father}

set_mother :: String -> FamilyMember -> FamilyMember
set_mother mother member = member {mother = Just mother}

add_child :: String -> FamilyMember -> FamilyMember
add_child child member = member {children = Just (child : (children member))}

set_spouse :: String -> FamilyMember -> FamilyMember
set_spouse spouse member = member {spouse = Just spouse}



-- return a member of the family tree with the given name
get_family_member :: String -> [FamilyMember] -> Maybe FamilyMember
get_family_member name family_tree = find (\member -> name == (name member)) family_tree

is_father :: String -> String -> [FamilyMember] -> Bool
is_father fm1 fm2 ft = father (fromJust (get_family_member fm1 ft)) == Just fm2

if_mother :: String -> String -> [FamilyMember] -> Bool
if_mother name mother family_tree = (mother get_family_member name family_tree) == Just mother

is_siblings :: String -> String -> [FamilyMember] -> Bool
is_siblings name name2 family_tree = (mother get_family_member name family_tree) == (mother get_family_member name2 family_tree) && (father get_family_member name family_tree) == (father get_family_member name2 family_tree)

is_male :: String -> [FamilyMember] -> Bool
is_male name family_tree = gender (get_family_member name family_tree) == "male"

is_son :: String -> String -> [FamilyMember] -> Bool
is_son child member family_tree = (is_father child member family_tree || is_mother child member family_tree) && is_male child family_tree

is_daughter :: String -> String -> [FamilyMember] -> Bool
is_daughter child member family_tree = (is_father child member family_tree || is_mother child member family_tree) && (is_male child family_tree) == False

is_younger :: String -> String -> [FamilyMember] -> Bool
is_younger member1 member2 family_tree = birth_date (get_family_member member1 family_tree) < birth_date (get_family_member member2 family_tree)

is_brother :: String -> String -> [FamilyMember] -> Bool
is_brother member1 member2 family_tree = is_siblings member1 member2 family_tree && is_male member1 family_tree

is_sister :: String -> String -> [FamilyMember] -> Bool
is_sister member1 member2 family_tree = is_siblings member1 member2 family_tree && (is_male member1 family_tree) == False

is_little_brother :: String -> String -> [FamilyMember] -> Bool
is_little_brother member1 member2 family_tree = is_brother member1 member2 family_tree && is_younger member1 member2 family_tree

is_big_brother :: String -> String -> [FamilyMember] -> Bool
is_big_brother member1 member2 family_tree = is_brother member1 member2 family_tree && (is_younger member2 member1 family_tree) == False

is_little_sister :: String -> String -> [FamilyMember] -> Bool
is_little_sister member1 member2 family_tree = is_sister member1 member2 family_tree && is_younger member1 member2 family_tree

is_big_sister :: String -> String -> [FamilyMember] -> Bool
is_big_sister member1 member2 family_tree = is_sister member1 member2 family_tree && (is_younger member2 member1 family_tree) == False

is_amca :: String -> String -> [FamilyMember] -> Bool
is_amca member1 member2 family_tree = is_brother (father get_family_member member1 family_tree) member2 family_tree




-- main function
main :: IO ()
main = do
    putStrLn "Hello, what is your name?"
    name <- getLine
    putStrLn $ "Hello, " ++ name ++ ", what is your
        
