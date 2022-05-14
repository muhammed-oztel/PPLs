import Data.List
import Data.Maybe
import Data.Time.Calendar
import Data.Time.Clock
import Data.Time

import Relations
import FamilyMember 
import FamilyTree


ozgurTree = FamilyTree{
    treeName = "Ozgur's Family Tree",
    treeRoot = Nothing,
    treeMembers = [
    FamilyMember {
        firstName = "Ahmet",
        lastName = "Ozgur",
        gender = "male",
        birthDate = Just $ fromGregorian 1956 11 20,
        deathDate  = Nothing,
        father  =Nothing,
        mother =Nothing,
        children =["Selin Ozgur", "Ali Ozgur", "Omer Ozgur"],
        tree =Nothing,
        spouse = Just "Hilal Demirtas Ozgur"
    },
    FamilyMember {
        firstName = "Hilal",
        lastName = "Demirtas Ozgur",
        gender = "female",
        birthDate = Just $ fromGregorian 1957 5 20,
        deathDate  = Nothing,
        father  =Nothing,
        mother =Nothing,
        children =["Selin Ozgur", "Ali Ozgur", "Omer Ozgur"],
        tree =Nothing,
        spouse =Just "Ahmet Ozgur"
    },
    FamilyMember {
        firstName = "Selin",
        lastName = "Ozgur",
        gender = "female",
        birthDate = Just $ fromGregorian 1979 1 20,
        deathDate  = Nothing,
        father  = Just "Ahmet Ozgur",
        mother = Just "Hilal Demirtas Ozgur",
        children =["Yunus Isci", "Leyla Isci", "Zeynep Isci"],
        tree =Nothing,
        spouse = Just "Mehmet Isci"
    },
    FamilyMember {
        firstName = "Ali",
        lastName = "Ozgur",
        gender = "male",
        birthDate = Just $ fromGregorian 1977 8 15,
        deathDate  = Nothing,
        father  =Just "Ahmet Ozgur",
        mother = Just "Hilal Demirtas Ozgur",
        children =["Bilal Ozgur", "Suleiman Ozgur", "Burcu Ozgur"],
        tree =Nothing,
        spouse = Just "Ayse Yalcintas Ozgur"
    },
    FamilyMember {
        firstName = "Omer",
        lastName = "Ozgur",
        gender = "male",
        birthDate = Just $ fromGregorian 1981 4 15,
        deathDate  = Nothing,
        father  =Just "Ahmet Ozgur",
        mother =Just "Hilal Demirtas Ozgur",
        children =[],
        tree =Nothing,
        spouse =Nothing
    },
    FamilyMember {
        firstName = "Mehmet",
        lastName = "Isci",
        gender = "male",
        birthDate = Just $ fromGregorian 1975 11 9,
        deathDate  = Nothing,
        father  =Nothing,
        mother =Nothing,
        children =["Yunus Isci", "Leyla Isci", "Zeynep Isci"],
        tree =Nothing,
        spouse = Just "Selin Ozgur" 
    },
    FamilyMember {
        firstName = "Ayse",
        lastName = "Yalcintas Ozgur",
        gender = "female",
        birthDate = Just $ fromGregorian 1979 2 3,
        deathDate  = Nothing,
        father  =Nothing,
        mother =Nothing,
        children =["Bilal Ozgur", "Suleiman Ozgur", "Burcu Ozgur"],
        tree =Nothing,
        spouse = Just "Ali Ozgur"
    },
    FamilyMember{
        firstName = "Yunus",
        lastName = "Isci",
        gender = "male",
        birthDate = Just $ fromGregorian 1999 8 20,
        deathDate  = Nothing,
        father  =Just "Mehmet Isci",
        mother =Just "Seling Ozgur",
        children =[],
        tree =Nothing,
        spouse =Nothing
    },
    FamilyMember{
        firstName = "Leyla",
        lastName = "Isci",
        gender = "female",
        birthDate = Just $ fromGregorian 2005 4 2,
        deathDate  = Nothing,
        father  =Just "Mehmet Isci",
        mother =Just "Seling Ozgur",
        children =["Batuhan Ozgur"],
        tree =Nothing,
        spouse =Just "Suleiman Ozgur"
    },
    FamilyMember{
        firstName = "Zeynep",
        lastName = "Isci",
        gender = "female",
        birthDate = Just $ fromGregorian 1996 9 9,
        deathDate  = Nothing,
        father  =Just "Mehmet Isci",
        mother =Just "Seling Ozgur",
        children =["Arif Ozgur"],
        tree =Nothing,
        spouse =Just "Bilal Ozgur"
    },
    FamilyMember{
        firstName = "Bilal",
        lastName = "Ozgur",
        gender = "male",
        birthDate = Just $ fromGregorian 1998 8 10,
        deathDate  = Nothing,
        father  =Just "Ali Ozgur",
        mother =Just "Ayse Yalcintas Ozgur",
        children =["Arif Ozgur"],
        tree =Nothing,
        spouse =Just "Zeynep Isci"
    },
    FamilyMember{
        firstName = "Suleiman",
        lastName = "Ozgur",
        gender = "male",
        birthDate = Just $ fromGregorian 1999 8 20,
        deathDate  = Nothing,
        father  =Just "Ali Ozgur",
        mother =Just "Ayse Yalcintas Ozgur",
        children =["Batuhan Ozgur"],
        tree =Nothing,
        spouse =Just "Leyla Isci"
    },
    FamilyMember{
        firstName = "Burcu",
        lastName = "Ozgur",
        gender = "female",
        birthDate = Just $ fromGregorian 2001 7 9,
        deathDate  = Nothing,
        father  =Just "Ali Ozgur",
        mother =Just "Ayse Yalcintas Ozgur",
        children =[],
        tree =Nothing,
        spouse =Nothing
    },
    FamilyMember{
        firstName = "Batuhan",
        lastName = "Ozgur",
        gender = "male",
        birthDate = Just $ fromGregorian 2019 5 5,
        deathDate  = Nothing,
        father  = Just "Suleiman Ozgur",
        mother = Just "Leyla Isci",
        children =[],
        tree =Nothing,
        spouse =Nothing
    },
    FamilyMember{
        firstName = "Arif",
        lastName = "Ozgur",
        gender = "male",
        birthDate = Just $ fromGregorian 2022 5 11,
        deathDate  = Nothing,
        father  = Just "Bilal Ozgur",
        mother = Just "Zeynep Isci",
        children =[],
        tree =Nothing,
        spouse =Nothing
    }
    ]
}


main::IO()
main = do
    putStrLn "Welcome to the Family Tree Warehouse!"
    -- print members in the tree
    -- putStrLn "The members of the tree are:"
    -- mapM_ print $ treeMembers ozgurTree
    -- display the children of member with name Ahmet Ozgur
    putStrLn "The children of member with name Ahmet Ozgur are:"
    putStrLn $ show $ children $ fromJust $ getMember "Ahmet Ozgur" ozgurTree
    -- putStrLn $ show $ is_father "Selin Ozgur" "Ahmet Ozgur" (treeMembers ozgurTree)
    -- putStrLn $ show $ is_father "Ali Ozgur" "Selin Ozgur" (treeMembers ozgurTree)
    -- putStrLn $ show $ is_mother "Selin Ozgur" "Ahmet Ozgur" (treeMembers ozgurTree)
    -- putStrLn $ show $ is_mother "Selin Ozgur" "Hilal Demirtas Ozgur" (treeMembers ozgurTree)
    -- putStrLn $ show $ is_siblings "Yunus Isci" "Leyla Isci" (treeMembers ozgurTree)
    -- putStrLn $ show $ is_son "Batuhan Ozgur" "Leyla Isci" (treeMembers ozgurTree)
    -- putStrLn $ show $ is_daughter "Selin Ozgur" "Hilal Demirtas Ozgur" (treeMembers ozgurTree)
    -- putStrLn $ show $ is_younger "Ahmet Ozgur" "Selin Ozgur"(treeMembers ozgurTree)
    -- putStrLn $ show $ is_sister "Burcu Ozgur" "Suleiman Ozgur" (treeMembers ozgurTree)
    
    putStrLn $ show $ is_younger "Suleiman Ozgur" "Bilal Ozgur" (treeMembers ozgurTree)
    putStrLn $ show $ is_little_brother "Bilal Ozgur" "Suleiman Ozgur" (treeMembers ozgurTree) 



    -- let tree0 = FamilyTree{ treeName = "Marmara", treeMembers = [], treeRoot = Nothing}
    -- let member0 = FamilyMember {
    -- firstName = "Ahmet",
    -- lastName = "Ozgur",
    -- gender = "male",
    -- birthDate = Just $ fromGregorian 1956 11 20,
    -- deathDate  = Nothing,
    -- father  =Nothing,
    -- mother =Nothing,
    -- children =[],
    -- tree =Nothing,
    -- spouse =Nothing
    -- }


    -- let tree0' = addMember tree0 member0
    -- let member1 = FamilyMember {
    --     firstName = "Hilal",
    --     lastName = "Demirtas Ozgur",
    --     gender = "female",
    --     birthDate = Just $ fromGregorian 1957 5 20,
    --     deathDate  = Nothing,
    --     father  =Nothing,
    --     mother =Nothing,
    --     children =[],
    --     tree =Nothing,
    --     spouse =Nothing
    -- }
    -- let tree0'' = addMember tree0' member1
    -- putStrLn $ show $ tree0''

    -- add spouse to member0 and member1
    
    -- printTree tree0'' with Data.Tree.Pretty module
    


    

    -- let tree01 = addSpouse member0 member1 tree0''
    -- -- putStrLn $ show tree01
    -- -- check the spouse of the first member in the tree is same as member 1
    -- if (fromJust $ spouse $ head $ treeMembers tree01) == member1
    --     then putStrLn "Spouse is correct"
    -- else putStrLn "Spouse is not correct"

    -- let selin = FamilyMember {
    --     firstName = "Selin",
    --     lastName = "Ozgur",
    --     gender = "female",
    --     birthDate = Just $ fromGregorian 1979 1 20,
    --     deathDate  = Nothing,
    --     father  =Nothing,
    --     mother =Nothing,
    --     children =[],
    --     tree =Nothing,
    --     spouse =Nothing
    -- }

    -- let ali = FamilyMember {
    --     firstName = "Ali",
    --     lastName = "Ozgur",
    --     gender = "male",
    --     birthDate = Just $ fromGregorian 1977 8 15,
    --     deathDate  = Nothing,
    --     father  =Nothing,
    --     mother =Nothing,
    --     children =[],
    --     tree =Nothing,
    --     spouse =Nothing
    -- }

    -- let omer = FamilyMember {
    --     firstName = "Omer",
    --     lastName = "Ozgur",
    --     gender = "male",
    --     birthDate = Just $ fromGregorian 1981 4 15,
    --     deathDate  = Nothing,
    --     father  =Nothing,
    --     mother =Nothing,
    --     children =[],
    --     tree =Nothing,
    --     spouse =Nothing
    -- }


    -- let tree02 = addChild selin (fromJust (getMember "Hilal Demirtas Ozgur" (treeMembers tree01))) (fromJust (getMember "Ahmet Ozgur" (treeMembers tree01))) tree01
    
    -- let tree03 = addChild ali (fromJust (getMember "Hilal Demirtas Ozgur" (treeMembers tree02))) (fromJust (getMember "Ahmet Ozgur" (treeMembers tree02))) tree02
    -- let tree04 = addChild omer (fromJust (getMember "Hilal Demirtas Ozgur" (treeMembers tree03))) (fromJust (getMember "Ahmet Ozgur" (treeMembers tree03))) tree03
    -- -- putStrLn $ show $ treeMembers tree04

    -- let mehmet = FamilyMember {
    --     firstName = "Mehmet",
    --     lastName = "Isci",
    --     gender = "male",
    --     birthDate = Just $ fromGregorian 1975 11 9,
    --     deathDate  = Nothing,
    --     father  =Nothing,
    --     mother =Nothing,
    --     children =[],
    --     tree =Nothing,
    --     spouse =Nothing
    -- }

    -- let ayse = FamilyMember {
    --     firstName = "Ayse",
    --     lastName = "Yalcintas Ozgur",
    --     gender = "female",
    --     birthDate = Just $ fromGregorian 1979 2 3,
    --     deathDate  = Nothing,
    --     father  =Nothing,
    --     mother =Nothing,
    --     children =[],
    --     tree =Nothing,
    --     spouse =Nothing
    -- }

    -- let tree05' = addMember tree04 mehmet
    -- let tree05 = addSpouse mehmet (fromJust (getMember "Selin Ozgur" (treeMembers tree05'))) tree05'
    -- let tree06' = addMember tree05 ayse
    -- let tree06 = addSpouse (fromJust (getMember "Ali Ozgur" (treeMembers tree06'))) ayse tree06'


    -- let yunus = FamilyMember{
    --     firstName = "Yunus",
    --     lastName = "Isci",
    --     gender = "male",
    --     birthDate = Just $ fromGregorian 1999 8 20,
    --     deathDate  = Nothing,
    --     father  =Nothing,
    --     mother =Nothing,
    --     children =[],
    --     tree =Nothing,
    --     spouse =Nothing
    -- }

    -- let leyla = FamilyMember{
    --     firstName = "Leyla",
    --     lastName = "Isci",
    --     gender = "female",
    --     birthDate = Just $ fromGregorian 2005 4 2,
    --     deathDate  = Nothing,
    --     father  =Nothing,
    --     mother =Nothing,
    --     children =[],
    --     tree =Nothing,
    --     spouse =Nothing
    -- }

    -- let zeynep = FamilyMember{
    --     firstName = "Zeynep",
    --     lastName = "Isci",
    --     gender = "female",
    --     birthDate = Just $ fromGregorian 1996 9 9,
    --     deathDate  = Nothing,
    --     father  =Nothing,
    --     mother =Nothing,
    --     children =[],
    --     tree =Nothing,
    --     spouse =Nothing
    -- }

    -- -- let tree07' = addMember tree06 yunus
    -- let tree07 = addChild yunus (fromJust (getMember "Selin Ozgur" (treeMembers tree06))) (fromJust (getMember "Mehmet Isci" (treeMembers tree06))) tree06
    -- -- let tree08' = addMember tree07 leyla
    -- let tree08 = addChild leyla (fromJust (getMember "Selin Ozgur" (treeMembers tree07))) (fromJust (getMember "Mehmet Isci" (treeMembers tree07))) tree07

    -- let tree09 = addChild zeynep (fromJust (getMember "Selin Ozgur" (treeMembers tree08))) (fromJust (getMember "Mehmet Isci" (treeMembers tree08))) tree08


    -- -- bilal = FamilyMember("Bilal", "Ozgur", "male", date(1998, 8, 10))
    -- -- suleiman = FamilyMember("Suleiman", "Ozgur", "male", date(1999, 8, 20))

    -- let bilal = FamilyMember{
    --     firstName = "Bilal",
    --     lastName = "Ozgur",
    --     gender = "male",
    --     birthDate = Just $ fromGregorian 1998 8 10,
    --     deathDate  = Nothing,
    --     father  =Nothing,
    --     mother =Nothing,
    --     children =[],
    --     tree =Nothing,
    --     spouse =Nothing
    -- }
    -- let suleiman = FamilyMember{
    --     firstName = "Suleiman",
    --     lastName = "Ozgur",
    --     gender = "male",
    --     birthDate = Just $ fromGregorian 1999 8 20,
    --     deathDate  = Nothing,
    --     father  =Nothing,
    --     mother =Nothing,
    --     children =[],
    --     tree =Nothing,
    --     spouse =Nothing
    -- }
    -- -- burcu = FamilyMember("Burcu", "Ozgur", "female", date(2001, 7, 9))

    -- let burcu = FamilyMember{
    --     firstName = "Burcu",
    --     lastName = "Ozgur",
    --     gender = "female",
    --     birthDate = Just $ fromGregorian 2001 7 9,
    --     deathDate  = Nothing,
    --     father  =Nothing,
    --     mother =Nothing,
    --     children =[],
    --     tree =Nothing,
    --     spouse =Nothing
    -- }
    

    -- -- leyla suleiman spouse
    -- let tree10' = addMember tree09 leyla
    -- let tree10 = addSpouse leyla suleiman tree10'
    -- -- zeynep bilal spouse
    -- let tree11' = addMember tree10 zeynep
    -- let tree11 = addSpouse zeynep bilal tree11'

    -- let batuhan = FamilyMember{
    --     firstName = "Batuhan",
    --     lastName = "Ozgur",
    --     gender = "male",
    --     birthDate = Just $ fromGregorian 2019 5 5,
    --     deathDate  = Nothing,
    --     father  =Nothing,
    --     mother =Nothing,
    --     children =[],
    --     tree =Nothing,
    --     spouse =Nothing
    -- }

    -- let arif = FamilyMember{
    --     firstName = "Arif",
    --     lastName = "Ozgur",
    --     gender = "male",
    --     birthDate = Just $ fromGregorian 2022 5 11,
    --     deathDate  = Nothing,
    --     father  =Nothing,
    --     mother =Nothing,
    --     children =[],
    --     tree =Nothing,
    --     spouse =Nothing
    -- }

    -- let tree12 = addChild batuhan leyla suleiman tree11
    -- let tree13 = addChild arif zeynep bilal  tree12

    -- -- Details of batuhan age, isAlive, level in family tree
    -- -- putStrLn $ "Details of " ++ firstName batuhan ++ " " ++ lastName batuhan
    -- -- -- print $ (diffDays  (fromGregorian 2001 1 1) (fromGregorian 2000 1 1)) `div` 365
    -- -- putStrLn $ "age: " ++ show (getAge batuhan)
    -- -- putStrLn "is alive: " 
    -- -- if isAlive batuhan
    -- --     then putStrLn "Yes"
    -- --     else putStrLn "No"
    -- -- putStrLn "level in Family tree: " ++ show (getLevel batuhan)

    -- putStrLn $ fullName selin
    -- putStrLn $ show $ children (fromJust (getMember "Selin Ozgur" (treeMembers tree13)))
    -- -- putStrLn $ show member0
    -- -- getRelationship ali member0 tree13

