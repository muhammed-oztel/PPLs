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
is_siblings fm1 fm2 ft = mother (fromJust (get_family_member fm1 ft)) == (mother (fromJust (get_family_member fm2 ft))) && 
        father (fromJust (get_family_member fm1 ft)) == father (fromJust (get_family_member fm2 ft)) && 
        mother (fromJust (get_family_member fm1 ft)) /= Nothing && father (fromJust (get_family_member fm1 ft)) /= Nothing && fm1 /=fm2

is_male :: String -> [FamilyMember] -> Bool
is_male fm1 ft = gender (fromJust (get_family_member fm1 ft)) == "male"

is_son :: String -> String -> [FamilyMember] -> Bool
is_son member child ft = (is_father child member ft || is_mother child member ft) && is_male child ft

is_daughter :: String -> String -> [FamilyMember] -> Bool
is_daughter member child ft = (is_father child member ft || is_mother child member ft) && (is_male child ft) == False

is_younger :: String -> String -> [FamilyMember] -> Bool
is_younger young old family_tree = birthDate ( fromJust (get_family_member young family_tree)) > birthDate ( fromJust (get_family_member old family_tree))

is_brother :: String -> String -> [FamilyMember] -> Bool
is_brother member1 brother family_tree = is_siblings member1 brother family_tree && is_male brother family_tree

is_sister :: String -> String -> [FamilyMember] -> Bool
is_sister member1 sister family_tree = is_siblings member1 sister family_tree && (is_male sister family_tree) == False

is_little_brother :: String -> String -> [FamilyMember] -> Bool
is_little_brother member1 lit_bro family_tree = is_brother member1 lit_bro family_tree && is_younger lit_bro member1 family_tree

is_big_brother :: String -> String -> [FamilyMember] -> Bool
is_big_brother member1 big_bro family_tree = is_brother member1 big_bro family_tree && is_younger member1 big_bro family_tree

is_little_sister :: String -> String -> [FamilyMember] -> Bool
is_little_sister member1 lit_sis family_tree = is_sister member1 lit_sis family_tree && is_younger lit_sis member1 family_tree

is_big_sister :: String -> String -> [FamilyMember] -> Bool
is_big_sister member1 big_sis family_tree = is_sister member1 big_sis family_tree && is_younger member1 big_sis family_tree

is_amca :: String -> String -> [FamilyMember] -> Bool
is_amca member1 amca family_tree = do 
    if (father (fromJust (get_family_member member1 family_tree))) == Nothing then False
    else (is_brother (fromJust (father (fromJust (get_family_member member1 family_tree)))) amca family_tree)
        

is_hala :: String -> String -> [FamilyMember] -> Bool
is_hala member1 hala family_tree = do
    if ((father (fromJust (get_family_member member1 family_tree))))== Nothing then False
    else is_sister (fromJust (father (fromJust (get_family_member member1 family_tree)))) hala family_tree

is_dayi :: String -> String -> [FamilyMember] -> Bool
is_dayi (member1) (dayi) family_tree = do
    if (mother (fromJust (get_family_member member1 family_tree))) == Nothing then False
    else is_brother  (fromJust (mother (fromJust (get_family_member member1 family_tree)))) (dayi) family_tree

is_teyze :: String -> String -> [FamilyMember] -> Bool
is_teyze member1 member2 family_tree = do
    if (mother (fromJust (get_family_member member1 family_tree))) == Nothing then False
    else is_sister member2 (fromJust (mother (fromJust (get_family_member member1 family_tree)))) family_tree &&
        is_sister (fromJust (mother (fromJust (get_family_member member1 family_tree)))) member2 family_tree

is_yegen :: String -> String -> [FamilyMember] -> Bool -- check if yegen is one of the children of member1's siblings
is_yegen member1 yegen family_tree = do
    if (father $ fromJust $ get_family_member member1 family_tree) == Nothing
        then False
    else do
        let siblings = remove member1 $ children $ fromJust $ get_family_member (fromJust $ father $ fromJust $ get_family_member member1 family_tree) family_tree
        let children_names = concat (map (\sibling -> children (fromJust (get_family_member sibling family_tree))) siblings)

        if (yegen `elem` children_names) then True else False

is_cousin :: String -> String -> [FamilyMember] -> Bool
is_cousin member1 cousin family_tree = do
    if (father $ fromJust $ get_family_member member1 family_tree) == Nothing ||
        (mother $ fromJust $ get_family_member member1 family_tree) == Nothing ||
        father (fromJust (get_family_member (fromJust (father $ fromJust $ get_family_member member1 family_tree)) family_tree)) == Nothing ||
        father (fromJust (get_family_member (fromJust (mother $ fromJust $ get_family_member member1 family_tree)) family_tree)) == Nothing ||
        (father $ fromJust $ get_family_member cousin family_tree) == Nothing ||
        (mother $ fromJust $ get_family_member cousin family_tree) == Nothing ||
        father (fromJust (get_family_member (fromJust (father $ fromJust $ get_family_member cousin family_tree)) family_tree)) == Nothing ||
        father (fromJust (get_family_member (fromJust (mother $ fromJust $ get_family_member cousin family_tree)) family_tree)) == Nothing 
        then False
    else do
        let father_dede = fromJust (father (fromJust (get_family_member (fromJust (father $ fromJust $ get_family_member member1 family_tree)) family_tree)))
        let mother_dede = fromJust (father (fromJust (get_family_member (fromJust (mother $ fromJust $ get_family_member member1 family_tree)) family_tree)))

        let cousin_father_dede = fromJust (father (fromJust (get_family_member (fromJust (father $ fromJust $ get_family_member cousin family_tree)) family_tree)))
        let cousin_mother_dede = fromJust (father (fromJust (get_family_member (fromJust (mother $ fromJust $ get_family_member cousin family_tree)) family_tree)))
        
        if (cousin_father_dede == father_dede || cousin_mother_dede == mother_dede || cousin_father_dede == mother_dede || cousin_mother_dede == father_dede) 
            then True 
        else False


-- sister spouse only
is_eniste :: String -> String -> [FamilyMember] -> Bool
is_eniste member1 eniste family_tree = do
    if (spouse (fromJust (get_family_member eniste family_tree))) == Nothing then False
    else do
        let eniste_spouse = fromJust (spouse (fromJust (get_family_member eniste family_tree)))
        is_sister member1 eniste_spouse family_tree && is_male eniste family_tree

is_yenge :: String -> String -> [FamilyMember] -> Bool
is_yenge member1 yenge family_tree = do
    if (spouse (fromJust (get_family_member yenge family_tree))) == Nothing then False
    else do
        let yenge_spouse = fromJust (spouse (fromJust (get_family_member yenge family_tree)))
        is_brother member1 yenge_spouse family_tree && is_brother yenge_spouse member1 family_tree
is_mother_law :: String -> String -> [FamilyMember] -> Bool
is_mother_law member1 mother_law family_tree = do -- find the mother in law
    if (spouse $ fromJust $ get_family_member member1 family_tree) == Nothing then False
    else do 
        let mem1_spouse = fromJust $ spouse $ fromJust $ get_family_member member1 family_tree
        let mem1_spouse_mother = mother $ fromJust $ get_family_member mem1_spouse family_tree

        -- check if mother_low is one of the mother's spouse's children
        if mem1_spouse_mother == (Just mother_law) then True else False

is_father_law :: String -> String -> [FamilyMember] -> Bool
is_father_law member1 father_law family_tree = do -- find the father in law
    if (spouse $ fromJust $ get_family_member member1 family_tree) == Nothing then False
    else do 
        let mem1_spouse = fromJust $ spouse $ fromJust $ get_family_member member1 family_tree
        let mem1_spouse_father = father $ fromJust $ get_family_member mem1_spouse family_tree

        -- check if father_low is one of the father's spouse's children
        if mem1_spouse_father == (Just father_law) then True else False


is_son_law :: String -> String -> [FamilyMember] -> Bool
is_son_law member1 son_law family_tree = do 
    let children_spouses = map (\child -> ((spouse (fromJust (get_family_member child family_tree))))) (children (fromJust (get_family_member member1 family_tree)))
    let male_spouse = filter (\spouse -> spouse/=Nothing && (gender (fromJust (get_family_member (fromJust spouse) family_tree))) == "male" ) children_spouses
    
    if (Just son_law `elem` male_spouse) then True else False

is_daughter_law :: String -> String -> [FamilyMember] -> Bool
is_daughter_law member1 daughter_law family_tree = do
    let children_spouses = map (\child -> ((spouse (fromJust (get_family_member child family_tree))))) (children (fromJust (get_family_member member1 family_tree)))
    let female_spouse = filter (\spouse -> spouse/=Nothing && (gender (fromJust (get_family_member (fromJust spouse) family_tree))) == "female" ) children_spouses

    if ((Just daughter_law) `elem` female_spouse) then True else False

-- !TODO bacanak

is_bacanak :: String -> String -> [FamilyMember] -> Bool
is_bacanak member1 bacanak family_tree = do
    if (spouse (fromJust (get_family_member member1 family_tree))) == Nothing || (spouse (fromJust (get_family_member bacanak family_tree))) == Nothing
        then False
    else do
        let mem1_spouse = fromJust (spouse (fromJust (get_family_member member1 family_tree)))
        let mem2_spouse = fromJust (spouse (fromJust (get_family_member bacanak family_tree)))

        if (is_sister mem1_spouse mem2_spouse family_tree && is_sister mem2_spouse mem1_spouse family_tree) then True else False

-- !TODO elti

is_elti :: String -> String -> [FamilyMember] -> Bool
is_elti member1 elti family_tree = do
    if (spouse (fromJust (get_family_member member1 family_tree))) == Nothing || (spouse (fromJust (get_family_member elti family_tree))) == Nothing
        then False
    else do
        let mem1_spouse = fromJust (spouse (fromJust (get_family_member member1 family_tree)))
        let mem2_spouse = fromJust (spouse (fromJust (get_family_member elti family_tree)))

        if (is_brother mem1_spouse mem2_spouse family_tree && is_brother mem2_spouse mem1_spouse family_tree) then True else False

-- !TODO baldız
is_baldiz :: String -> String -> [FamilyMember] -> Bool
is_baldiz member1 baldiz family_tree = do
    if (spouse (fromJust (get_family_member member1 family_tree))) == Nothing then False
    else do
        let mem1_spouse =  fromJust (spouse (fromJust (get_family_member member1 family_tree)))
        is_sister mem1_spouse baldiz family_tree && is_sister baldiz mem1_spouse family_tree

    

-- !TODO kayinbirader
is_kayinbirader :: String -> String -> [FamilyMember] -> Bool
is_kayinbirader member1 kayinbirader family_tree = do
    if (spouse (fromJust (get_family_member member1 family_tree))) == Nothing then False
    else do
        let mem1_spouse =  fromJust (spouse (fromJust (get_family_member member1 family_tree)))
        is_brother mem1_spouse kayinbirader family_tree && (is_male mem1_spouse family_tree)== False



getLevelInTree :: Maybe String -> FamilyTree -> Int
getLevelInTree Nothing ft = 0
getLevelInTree name ft = max (getLevelInTree (father (fromJust (get_family_member (fromJust name) (treeMembers ft)))) ft + 1) (getLevelInTree (mother (fromJust (get_family_member (fromJust name) (treeMembers ft)))) ft + 1)