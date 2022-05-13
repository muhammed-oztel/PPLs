import Data.List
import Data.Maybe
import Data.Time.Calendar
import Data.Time.Clock
import Data.Time

import FamilyMember 
import FamilyTree


main::IO()
main = do
    putStrLn "Welcome to the Family Tree Warehouse!"
    let tree0 = FamilyTree{ treeName = "Marmara", treeMembers = [], treeRoot = Nothing}
    let member0 = FamilyMember {
    firstName = "Ahmet",
    lastName = "Ozgur",
    gender = "male",
    birthDate = Just $ fromGregorian 1956 11 20,
    deathDate  = Nothing,
    father  =Nothing,
    mother =Nothing,
    children =[],
    tree =Nothing,
    spouse =Nothing
    }


    let tree0' = addMember tree0 member0
    let member1 = FamilyMember {
        firstName = "Hilal",
        lastName = "Demirtas Ozgur",
        gender = "female",
        birthDate = Just $ fromGregorian 1957 5 20,
        deathDate  = Nothing,
        father  =Nothing,
        mother =Nothing,
        children =[],
        tree =Nothing,
        spouse =Nothing
    }
    let tree0'' = addMember tree0' member0

    -- add spouse to member0 and member1
    
    -- printTree tree0'' with Data.Tree.Pretty module
    


    

    let tree01 = tree0''{treeMembers = addSpouse member0 member1 }
    -- putStrLn $ show tree01
    -- check the spouse of the first member in the tree is same as member 1
    if (fromJust $ spouse $ head $ treeMembers tree01) == member1
        then putStrLn "Spouse is correct"
    else putStrLn "Spouse is not correct"

    let selin = FamilyMember {
        firstName = "Selin",
        lastName = "Ozgur",
        gender = "female",
        birthDate = Just $ fromGregorian 1979 1 20,
        deathDate  = Nothing,
        father  =Nothing,
        mother =Nothing,
        children =[],
        tree =Nothing,
        spouse =Nothing
    }

    let ali = FamilyMember {
        firstName = "Ali",
        lastName = "Ozgur",
        gender = "male",
        birthDate = Just $ fromGregorian 1977 8 15,
        deathDate  = Nothing,
        father  =Nothing,
        mother =Nothing,
        children =[],
        tree =Nothing,
        spouse =Nothing
    }

    let omer = FamilyMember {
        firstName = "Omer",
        lastName = "Ozgur",
        gender = "male",
        birthDate = Just $ fromGregorian 1981 4 15,
        deathDate  = Nothing,
        father  =Nothing,
        mother =Nothing,
        children =[],
        tree =Nothing,
        spouse =Nothing
    }


    let tree02 = addChild selin member1 member0 tree01
    let tree03 = addChild ali member1 member0 tree02
    let tree04 = addChild omer member1 member0 tree03
    -- putStrLn $ show $ treeMembers tree04

    let mehmet = FamilyMember {
        firstName = "Mehmet",
        lastName = "Isci",
        gender = "male",
        birthDate = Just $ fromGregorian 1975 11 9,
        deathDate  = Nothing,
        father  =Nothing,
        mother =Nothing,
        children =[],
        tree =Nothing,
        spouse =Nothing
    }

    let ayse = FamilyMember {
        firstName = "Ayse",
        lastName = "Yalcintas Ozgur",
        gender = "female",
        birthDate = Just $ fromGregorian 1979 2 3,
        deathDate  = Nothing,
        father  =Nothing,
        mother =Nothing,
        children =[],
        tree =Nothing,
        spouse =Nothing
    }


    let tree05 = tree04{treeMembers = treeMembers tree04 ++ addSpouse mehmet selin}
    let tree06 = tree05{treeMembers = treeMembers tree05 ++ addSpouse ali ayse}


    let yunus = FamilyMember{
        firstName = "Yunus",
        lastName = "Isci",
        gender = "male",
        birthDate = Just $ fromGregorian 1999 8 20,
        deathDate  = Nothing,
        father  =Nothing,
        mother =Nothing,
        children =[],
        tree =Nothing,
        spouse =Nothing
    }

    let leyla = FamilyMember{
        firstName = "Leyla",
        lastName = "Isci",
        gender = "female",
        birthDate = Just $ fromGregorian 2005 4 2,
        deathDate  = Nothing,
        father  =Nothing,
        mother =Nothing,
        children =[],
        tree =Nothing,
        spouse =Nothing
    }

    let zeynep = FamilyMember{
        firstName = "Zeynep",
        lastName = "Isci",
        gender = "female",
        birthDate = Just $ fromGregorian 1996 9 9,
        deathDate  = Nothing,
        father  =Nothing,
        mother =Nothing,
        children =[],
        tree =Nothing,
        spouse =Nothing
    }

    let tree07 = addChild yunus selin mehmet tree06
    let tree08 = addChild leyla selin mehmet tree07
    let tree09 = addChild zeynep selin mehmet tree08


    -- bilal = FamilyMember("Bilal", "Ozgur", "male", date(1998, 8, 10))
    -- suleiman = FamilyMember("Suleiman", "Ozgur", "male", date(1999, 8, 20))

    let bilal = FamilyMember{
        firstName = "Bilal",
        lastName = "Ozgur",
        gender = "male",
        birthDate = Just $ fromGregorian 1998 8 10,
        deathDate  = Nothing,
        father  =Nothing,
        mother =Nothing,
        children =[],
        tree =Nothing,
        spouse =Nothing
    }
    let suleiman = FamilyMember{
        firstName = "Suleiman",
        lastName = "Ozgur",
        gender = "male",
        birthDate = Just $ fromGregorian 1999 8 20,
        deathDate  = Nothing,
        father  =Nothing,
        mother =Nothing,
        children =[],
        tree =Nothing,
        spouse =Nothing
    }
    -- burcu = FamilyMember("Burcu", "Ozgur", "female", date(2001, 7, 9))

    let burcu = FamilyMember{
        firstName = "Burcu",
        lastName = "Ozgur",
        gender = "female",
        birthDate = Just $ fromGregorian 2001 7 9,
        deathDate  = Nothing,
        father  =Nothing,
        mother =Nothing,
        children =[],
        tree =Nothing,
        spouse =Nothing
    }
    

    -- leyla suleiman spouse
    let tree10 = tree09{treeMembers=treeMembers tree09 ++ addSpouse leyla suleiman}
    -- zeynep bilal spouse
    let tree11 = tree10{treeMembers=treeMembers tree10 ++ addSpouse zeynep bilal}

-- batuhan = FamilyMember("Batuhan", "Ozgur", "male", date(2021, 5, 5))
--         suleiman.add_child(batuhan)

--         # create children for Bilal and Zeynep couple
--         arif = FamilyMember("Arif", "Ozgur", "male", date(2022, 5, 11))
--         bilal.add_child(arif)

    let batuhan = FamilyMember{
        firstName = "Batuhan",
        lastName = "Ozgur",
        gender = "male",
        birthDate = Just $ fromGregorian 2019 5 5,
        deathDate  = Nothing,
        father  =Nothing,
        mother =Nothing,
        children =[],
        tree =Nothing,
        spouse =Nothing
    }

    let arif = FamilyMember{
        firstName = "Arif",
        lastName = "Ozgur",
        gender = "male",
        birthDate = Just $ fromGregorian 2022 5 11,
        deathDate  = Nothing,
        father  =Nothing,
        mother =Nothing,
        children =[],
        tree =Nothing,
        spouse =Nothing
    }

    let tree12 = addChild batuhan leyla suleiman tree11
    let tree13 = addChild arif zeynep bilal  tree12

    -- Details of batuhan age, isAlive, level in family tree
    putStrLn $ "Details of " ++ firstName batuhan ++ " " ++ lastName batuhan
    -- print $ (diffDays  (fromGregorian 2001 1 1) (fromGregorian 2000 1 1)) `div` 365
    putStrLn $ "age: " ++ show (getAge batuhan)
    putStrLn "is alive: " 
    if isAlive batuhan
        then putStrLn "Yes"
        else putStrLn "No"
    -- putStrLn "level in Family tree: " ++ show (getLevel batuhan)







