import Data.Time.Calendar


data FamilyMember = FamilyMember {
    name :: Maybe String, 
    surname :: Maybe String, 
    gender :: Maybe String, 
    birth_date :: Maybe DateTime, 
    death_date :: Maybe DateTime, 
    father :: Maybe FamilyMember, 
    mother :: Maybe FamilyMember, 
    children :: Maybe [FamilyMember], 
    tree :: Maybe String,
    spouse :: Maybe FamilyMember
    } deriving (Show)

-- create a family tree as a list of family members
family_tree :: [FamilyMember]

-- function to add a family member to the family tree
add_family_member :: FamilyMember -> [FamilyMember] -> [FamilyMember]
add_family_member member family_tree = family_tree ++ [member]

-- function to add a member as a child to family members without adding the child to the family tree
add_child :: FamilyMember -> FamilyMember -> FamilyMember
add_child member child = member {children = children member ++ [child]}

-- function to add a member as spouse to a family member without adding the it to the family tree
add_spouse :: FamilyMember -> FamilyMember -> FamilyMember
add_spouse member spouse = member {spouse = spouse}

-- check a person is dead
is_dead :: FamilyMember -> Bool
is_dead member = isJust (death_date member)

-- find the level of a given member in the family tree
find_level :: FamilyMember -> Int
find_level member = length (takeWhile (/= member) family_tree)


-- find if a member is a father of another member from the family tree
is_father :: FamilyMember -> FamilyMember -> Bool
is_father member1 member2 = isJust (father member1) && (fromJust (father member1) == member2)

-- find if a member is a mother of another member from the family tree
is_mother :: FamilyMember -> FamilyMember -> Bool
is_mother member1 member2 = isJust (mother member1) && (fromJust (mother member1) == member2)

-- find if a member is a sibling of another member from the family tree
is_sibling :: FamilyMember -> FamilyMember -> Bool
is_sibling member1 member2 = is_father member1 member2 || is_mother member1 member2

-- find if a member is a brother of another member from the family tree
is_brother :: FamilyMember -> FamilyMember -> Bool
is_brother member1 member2 = is_sibling member1 member2 && is_male member2

-- find if a member is a sister of another member from the family tree
is_sister :: FamilyMember -> FamilyMember -> Bool
is_sister member1 member2 = is_sibling member1 member2 && (is_male member2) == False

-- function called as is_male
is_male :: FamilyMember -> Bool
is_male member = (gender member) == "male"

-- find the brothers of mother from the family tree
find_brothers_of_mother :: FamilyMember -> [FamilyMember]
find_brothers_of_mother member = filter (\x -> is_brother x member) family_tree
    where is_brother x y = is_sibling x y && is_mother x y

-- find the sisters of my mother from the family tree
find_sisters_of_mother :: FamilyMember -> [FamilyMember]
find_sisters_of_mother member = filter (\x -> is_sister x member) family_tree
    where is_sister x y = is_sibling x y && is_mother x y

-- find the relationship of a given member to another member
find_relationship :: FamilyMember -> FamilyMember -> String
find_relationship member1 member2 =
    if member1 == member2 then "self"
    else if is_father member1 member2 then "father"
    else if is_mother member1 member2 then "mother"
    else if is_brother member1 member2 then "brother"
    else if is_sister member1 member2 then "sister"
    else if is_sibling member1 member2 then "sibling"
    else if is_spouse member1 member2 then "spouse"
    else if is_child member1 member2 then "child"
    else "unknown"
    

