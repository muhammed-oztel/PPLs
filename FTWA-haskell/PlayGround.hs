import Data.List
import Data.Maybe
import Data.Time.Calendar
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
    putStrLn $ show tree01
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

    