module Relations where
import FamilyMember
import FamilyTree
import Data.List
import Data.Maybe



-- return a member of the family tree with the given name
get_family_member :: String -> [FamilyMember] -> Maybe FamilyMember
get_family_member name family_tree = find (\member -> name == (fullName member)) family_tree

is_father :: String -> String -> [FamilyMember] -> Bool
is_father fm1 fm2 ft = father (fromJust (get_family_member fm1 ft)) == Just fm2

is_mother :: String -> String -> [FamilyMember] -> Bool
is_mother fm1 fm2 ft = mother (fromJust (get_family_member fm1 ft)) == Just fm2

is_siblings :: String -> String -> [FamilyMember] -> Bool
is_siblings fm1 fm2 ft = mother (fromJust (get_family_member fm1 ft)) == mother (fromJust (get_family_member fm2 ft)) && father (fromJust (get_family_member fm1 ft)) == father (fromJust (get_family_member fm2 ft))

is_male :: String -> [FamilyMember] -> Bool
is_male fm1 ft = gender (fromJust (get_family_member fm1 ft)) == "male"

is_son :: String -> String -> [FamilyMember] -> Bool
is_son child member ft = (is_father child member ft || is_mother child member ft) && is_male child ft

is_daughter :: String -> String -> [FamilyMember] -> Bool
is_daughter child member ft = (is_father child member ft || is_mother child member ft) && (is_male child ft) == False

is_younger :: String -> String -> [FamilyMember] -> Bool
is_younger young old family_tree = birthDate ( fromJust (get_family_member young family_tree)) > birthDate ( fromJust (get_family_member old family_tree))

is_brother :: String -> String -> [FamilyMember] -> Bool
is_brother member1 member2 family_tree = is_siblings member1 member2 family_tree && is_male member1 family_tree

is_sister :: String -> String -> [FamilyMember] -> Bool
is_sister member1 sister family_tree = is_siblings member1 sister family_tree && (is_male sister family_tree) == False

is_little_brother :: String -> String -> [FamilyMember] -> Bool
is_little_brother member1 member2 family_tree = is_brother member1 member2 family_tree && is_younger member1 member2 family_tree

is_big_brother :: String -> String -> [FamilyMember] -> Bool
is_big_brother member1 member2 family_tree = is_brother member1 member2 family_tree && is_younger member2 member1 family_tree

is_little_sister :: String -> String -> [FamilyMember] -> Bool
is_little_sister member1 lit_sis family_tree = is_sister member1 lit_sis family_tree && is_younger lit_sis member1 family_tree

is_big_sister :: String -> String -> [FamilyMember] -> Bool
is_big_sister member1 big_sis family_tree = is_sister member1 big_sis family_tree && is_younger member1 big_sis family_tree

is_amca :: String -> String -> [FamilyMember] -> Bool
is_amca member1 member2 family_tree = is_brother (fromJust (father (fromJust (get_family_member member1 family_tree)))) member2 family_tree

is_hala :: String -> String -> [FamilyMember] -> Bool
is_hala member1 member2 family_tree = is_sister member1 (fromJust (father (fromJust (get_family_member member2 family_tree)))) family_tree

is_dayi :: String -> String -> [FamilyMember] -> Bool
is_dayi member1 member2 family_tree = is_brother member1 (fromJust (mother (fromJust (get_family_member member2 family_tree)))) family_tree

is_teyze :: String -> String -> [FamilyMember] -> Bool
is_teyze member1 member2 family_tree = is_sister member1 (fromJust (mother (fromJust (get_family_member member2 family_tree)))) family_tree

is_yegen :: String -> String -> [FamilyMember] -> Bool -- check if yegen is one of the children of member1's siblings
is_yegen member1 yegen family_tree = do
    let siblings = remove member1 $ children $ fromJust $ get_family_member (fromJust $ father $ fromJust $ get_family_member member1 family_tree) family_tree
    -- get every name of the sibling children from children list
    let children_names = concat (map (\sibling -> children (fromJust (get_family_member sibling family_tree))) siblings)

    -- check if yegen is one of the children of member1's siblings
    if (yegen `elem` children_names) then True else False

is_cousin :: String -> String -> [FamilyMember] -> Bool
is_cousin member1 cousin family_tree = do
    let mem1_father = fromJust $ father $ fromJust $ get_family_member member1 family_tree
    let mem1_mother = fromJust $ mother $ fromJust $ get_family_member member1 family_tree
    let mem1_father_siblings = remove member1 $ children $ fromJust $ get_family_member (fromJust $ father $ fromJust $ get_family_member mem1_father family_tree) family_tree
    let mem1_mother_siblings = remove member1 $ children $ fromJust $ get_family_member (fromJust $ father $ fromJust $ get_family_member mem1_mother family_tree) family_tree

    let father_cousins = concat (map (\sibling -> children (fromJust (get_family_member sibling family_tree))) mem1_father_siblings)
    let mother_cousins = concat (map (\sibling -> children (fromJust (get_family_member sibling family_tree))) mem1_mother_siblings)

    let cousins = father_cousins ++ mother_cousins

    -- check if cousin is one of the cousins of member1
    if (cousin `elem` cousins) then True else False


-- sister spouse only
is_eniste :: String -> String -> [FamilyMember] -> Bool
is_eniste member1 eniste family_tree = do
    let mem1_sisters = filter (\sister -> gender (fromJust (get_family_member sister family_tree)) == "female" ) (children (fromJust (get_family_member (fromJust (mother (fromJust (get_family_member member1 family_tree)))) family_tree)))
    let sister_spouses= map (\sister -> fromJust (spouse (fromJust (get_family_member sister family_tree)))) mem1_sisters

    -- sister_spouses

    -- check if eniste is one of the sister's spouses
    if (eniste `elem` sister_spouses) then True else False

is_yenge :: String -> String -> [FamilyMember] -> Bool
is_yenge member1 yenge family_tree = do
    let mem1_brothers = filter (\brother -> gender  (fromJust (get_family_member brother family_tree)) == "male" ) (children (fromJust (get_family_member (fromJust (mother (fromJust (get_family_member member1 family_tree)))) family_tree)))
    let brother_spouses = map (\brother ->  fromJust (spouse (fromJust (get_family_member brother family_tree)))) mem1_brothers

    if (yenge `elem` brother_spouses) then True else False

is_mother_law :: String -> String -> [FamilyMember] -> Bool
is_mother_law member1 mother_law family_tree = do -- find the mother in law
    let mem1_spouse = fromJust $ spouse $ fromJust $ get_family_member member1 family_tree
    let mem1_spouse_mother = fromJust $ mother $ fromJust $ get_family_member mem1_spouse family_tree

    -- check if mother_low is one of the mother's spouse's children
    if mem1_spouse_mother == mother_law then True else False

is_father_law :: String -> String -> [FamilyMember] -> Bool
is_father_law member1 father_law family_tree = do -- find the father in law
    let mem1_spouse = fromJust $ spouse $ fromJust $ get_family_member member1 family_tree
    let mem1_spouse_father = fromJust $ father $ fromJust $ get_family_member mem1_spouse family_tree

    -- check if father_low is one of the father's spouse's children
    if mem1_spouse_father == father_law then True else False


-- -- -- 

is_son_law :: String -> String -> [FamilyMember] -> Bool
is_son_law member1 son_law family_tree = do 
    let children_spouses = map (\child -> (fromJust (spouse (fromJust (get_family_member child family_tree))))) (children (fromJust (get_family_member member1 family_tree)))
    let male_spouse = filter (\spouse -> (gender (fromJust (get_family_member spouse family_tree))) == "male" ) children_spouses

    if (son_law `elem` male_spouse) then True else False

is_daughter_law :: String -> String -> [FamilyMember] -> Bool
is_daughter_law member1 daughter_law family_tree = do
    let children_spouses = map (\child -> (fromJust (spouse (fromJust (get_family_member child family_tree))))) (children (fromJust (get_family_member member1 family_tree)))
    let female_spouse = filter (\spouse -> (gender (fromJust (get_family_member spouse family_tree))) == "female" ) children_spouses

    if (daughter_law `elem` female_spouse) then True else False

-- !TODO bacanak

is_bacanak :: String -> String -> [FamilyMember] -> Bool
is_bacanak member1 bacanak family_tree = do
    let mem1_spouse = fromJust (spouse (fromJust (get_family_member member1 family_tree)))
    let siblings = children (fromJust (get_family_member (fromJust (father (fromJust (get_family_member mem1_spouse family_tree))) ) family_tree))  
    let sibling_spouses = map (\sibling -> fromJust (spouse (fromJust (get_family_member sibling family_tree)))) siblings

    let male_spouses = filter (\spouse -> gender (fromJust (get_family_member spouse family_tree)) == "male") sibling_spouses
    if (bacanak `elem` male_spouses) then True else False

-- !TODO elti

is_elti :: String -> String -> [FamilyMember] -> Bool
is_elti member1 elti family_tree = do
    let mem1_spouse = fromJust (spouse (fromJust (get_family_member member1 family_tree)))
    let siblings = children (fromJust (get_family_member (fromJust (father (fromJust (get_family_member mem1_spouse family_tree))) ) family_tree))  
    let sibling_spouses = map (\sibling -> fromJust (spouse (fromJust (get_family_member sibling family_tree)))) siblings

    let female_spouses = filter (\spouse -> gender (fromJust (get_family_member spouse family_tree)) == "female") sibling_spouses
    if (elti `elem` female_spouses) then True else False

-- !TODO baldız
is_baldiz :: String -> String -> [FamilyMember] -> Bool
is_baldiz member1 baldiz family_tree = do
    let mem1_spouse =  fromJust (spouse (fromJust (get_family_member member1 family_tree)))
    let siblings = children (fromJust (get_family_member (fromJust (father (fromJust (get_family_member mem1_spouse family_tree))) ) family_tree))  
    let female_siblings = filter (\sibling -> gender (fromJust (get_family_member sibling family_tree)) == "female") siblings

    if (baldiz `elem` female_siblings) then True else False

-- !TODO kayinbirader
is_kayinbirader :: String -> String -> [FamilyMember] -> Bool
is_kayinbirader member1 kayinbirader family_tree = do
    let mem1_spouse =  fromJust (spouse (fromJust (get_family_member member1 family_tree)))
    let siblings = children (fromJust (get_family_member (fromJust (father (fromJust (get_family_member mem1_spouse family_tree))) ) family_tree))  
    let male_siblings = filter (\sibling -> gender (fromJust (get_family_member sibling family_tree)) == "male") siblings

    if (kayinbirader `elem` male_siblings) then True else False