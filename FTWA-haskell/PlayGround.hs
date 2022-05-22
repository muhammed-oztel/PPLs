import Data.List
import Data.Maybe
import Data.Time.Calendar
import Data.Time.Clock
import Data.Time
import Data.Time.Format
import Control.Exception
import Relations
import FamilyMember 
import FamilyTree
import Data.Tree 
import PrettyPrint
import System.Exit


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
        father  = Just "Ahmet Ozgur",
        mother = Just "Hilal Demirtas Ozgur",
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
        father  = Nothing,
        mother = Nothing,
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
        mother =Just "Selin Ozgur",
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
        mother =Just "Selin Ozgur",
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
        mother =Just "Selin Ozgur",
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


-- allRelations = [is_father, is_mother, is_son, is_daughter, is_little_brother, is_big_brother, is_little_sister, is_big_sister, 
--                 is_amca, is_hala, is_dayi, is_teyze, is_yegen, is_cousin, is_eniste, is_yenge, is_mother_law, is_father_law, 
--                 is_son_law, is_daughter_law, is_bacanak, is_elti, is_baldiz, is_kayinbirader]



addPerson :: FamilyTree -> IO ()
addPerson ft = do
    -- ask is this person is placeholder
    putStrLn "Is this person a placeholder? (y/n)"
    isPlaceholder <- getLine
    if isPlaceholder == "y"
        then do
            let placeholder = FamilyMember{firstName = "placeholder", lastName = "placeholder",
                    gender = "",
                    birthDate = Nothing,
                    deathDate  = Nothing,
                    father  = Nothing,
                    mother = Nothing,
                    children =[],
                    tree =Nothing,
                    spouse =Nothing
             }
            displayMenu ft{treeMembers=placeholder:(treeMembers ft)}
    else do
        putStrLn "Enter first name:"
        firstName <- getLine
        putStrLn "Enter last name:"
        lastName <- getLine
        putStrLn "Enter Gender:"
        inputGender <- getLine
        putStrLn "Enter Year of birth (YYYY):"
        inputYear <- getLine
        putStrLn "Enter Month of birth (MM):"
        inputMonth <- getLine
        putStrLn "Enter Month of birth (DD):"
        inputDay <- getLine
        let dob = fromGregorian (read inputYear) (read inputMonth) (read inputDay)
        if dob > (fromGregorian 2022 05 22) then do
            putStrLn "ERROR: Invalid date"
            displayMenu ft
        else do
            let newMember = FamilyMember{firstName = firstName, lastName = lastName,
                        gender = inputGender,
                        birthDate = Just dob,
                        deathDate  = Nothing,
                        father  = Nothing,
                        mother = Nothing,
                        children =[],
                        tree =Nothing,
                        spouse =Nothing
            }
            displayMenu ft{treeMembers= newMember : (treeMembers ft)}

addChild :: FamilyTree -> IO ()
addChild ft = do
    putStrLn "Enter full name of child:"
    childName <- getLine
    putStrLn "Enter full name of mother:"
    motherName <- getLine
    putStrLn "Enter full name of father:"
    fatherName <- getLine
    let memChild = fromJust (get_family_member childName (treeMembers ft))
    let memMother = fromJust (get_family_member motherName (treeMembers ft))
    let memFather = fromJust (get_family_member fatherName (treeMembers ft))
    let removedMembers = remove memChild (remove memMother (remove memFather (treeMembers ft)))
    let newChild = memChild{mother=Just motherName, father=Just fatherName}
    let newMother =memMother{children=childName:children memMother}
    let newFather =memFather{children=childName:children memFather}
    displayMenu ft{treeMembers=newChild:newMother:newFather:removedMembers}

addSpouse :: FamilyTree -> IO ()
addSpouse ft = do
    putStrLn "Enter full name of first spouse:"
    firstSpouseName <- getLine
    putStrLn "Enter full name of second spouse:"
    secondSpouseName <- getLine
    let memFirstSpouse = fromJust (get_family_member firstSpouseName (treeMembers ft))
    let memSecondSpouse = fromJust (get_family_member secondSpouseName (treeMembers ft))
    if (getAge memFirstSpouse < 18 ) then do 
        putStrLn $ "WARNING!!! " ++ (firstSpouseName) ++ " is under 18 years old." 
    else putStr ""
    if( getAge memSecondSpouse < 18) then do 
        putStrLn $ "WARNING!!! " ++ (secondSpouseName) ++ " is under 18 years old." 
    else putStr ""

    let removedMembers = remove memFirstSpouse (remove memSecondSpouse (treeMembers ft))
    displayMenu ft{treeMembers=memFirstSpouse{spouse=Just secondSpouseName}:memSecondSpouse{spouse=Just firstSpouseName}:removedMembers}


findRelation :: String -> String -> [FamilyMember]-> IO ()
findRelation name1 self ft = do
    putStrLn $ "The relation of " ++ name1 ++ " to " ++ self ++ " is "
    if (is_father self name1 ft) then putStrLn "Baba" else putStr ""
    if (is_mother self name1 ft) then putStrLn "Anne" else putStr ""
    if (is_son self name1 ft) then putStrLn "Ogul" else putStr ""
    if (is_daughter self name1 ft) then putStrLn "Kiz" else putStr ""
    if (is_little_brother self name1 ft) then putStrLn "Erkek kardes" else putStr ""
    if (is_big_brother self name1 ft) then putStrLn "Abi" else putStr ""
    if (is_little_sister self name1 ft) then putStrLn "Kiz kardes" else putStr ""
    if (is_big_sister self name1 ft) then putStrLn "Abla" else putStr ""
    if (is_amca self name1 ft) then putStrLn "Amca" else putStr ""
    if (is_hala self name1 ft) then putStrLn "Hala" else putStr ""
    if (is_dayi self name1 ft) then putStrLn "Dayi" else putStr ""
    if (is_teyze self name1 ft) then putStrLn "Teyze" else putStr ""
    if (is_yegen self name1 ft) then putStrLn "Yegen" else putStr ""
    if (is_cousin self name1 ft) then putStrLn "Kuzen" else putStr ""
    if (is_eniste self name1 ft) then putStrLn "Eniste" else putStr ""
    if (is_yenge self name1 ft) then putStrLn "Yenge" else putStr ""
    if (is_mother_law self name1 ft) then putStrLn "Kayinvalide" else putStr ""
    if (is_father_law self name1 ft) then putStrLn "Kayinpeder" else putStr ""
    if (is_son_law self name1 ft) then putStrLn "Damat" else putStr ""
    if (is_daughter_law self name1 ft) then putStrLn "Gelin" else putStr ""
    if (is_bacanak self name1 ft) then putStrLn "Bacanak" else putStr ""
    if (is_elti self name1 ft) then putStrLn "Elti" else putStr ""
    if (is_baldiz self name1 ft) then putStrLn "Baldiz" else putStr ""
    if (is_kayinbirader self name1 ft) then putStrLn "Kayinbirader" else putStr ""
    putStrLn "----------------------"

askForRelations :: FamilyTree -> IO ()
askForRelations tree = do
    putStrLn "Enter the name & surname of the person you want to get the relationship of:"
    member1 <- getLine
    putStrLn "Enter the name & surname of the person you want to get the relationship with:"
    member2 <- getLine
    findRelation member1 member2 (treeMembers tree)
    displayMenu tree

printPerson :: FamilyTree -> IO ()
printPerson family_tree = do
    putStrLn "Enter the name & surname of the person you want to get the information of:"
    member <- getLine
    putStrLn $ "The information of " ++ member ++ " is "
    putStrLn $ "Age: " ++ show (getAge (fromJust (get_family_member member (treeMembers family_tree))))
    putStrLn $ "Is Alive: " ++ show ((deathDate (fromJust (get_family_member member (treeMembers family_tree)))) == Nothing)
    putStrLn $ "Level In Tree: " ++ show (getLevelInTree (Just member) family_tree)

setDeathDate :: FamilyTree -> IO ()
setDeathDate family_tree = do
    putStrLn "Enter the name & surname of the person you want to set the death date of:"
    memberName <- getLine
    putStrLn "Enter the death year of the person:"
    deathYear <- getLine
    putStrLn "Enter the death month of the person:"
    deathMonth <- getLine
    putStrLn "Enter the death day of the person:"
    deathDay <- getLine
    let dod = fromGregorian (read deathYear) (read deathMonth) (read deathDay)
    if dod > (fromGregorian 2022 05 22) then do
        putStrLn "ERROR!!! You are trying to set a date in the future."
        displayMenu family_tree
    else do
        let member = fromJust (get_family_member memberName (treeMembers family_tree))
        let newMember = member{deathDate=Just dod}
        let removedMembers = remove member (treeMembers family_tree)
        displayMenu family_tree{treeMembers=newMember:removedMembers}


updatePerson :: FamilyTree -> IO ()
updatePerson ft = do
    putStrLn "What do you want to update?"
    putStrLn "1. Name"
    putStrLn "2. Surname"
    putStrLn "3. Birth date"
    putStrLn "4. Gender"
    putStrLn "Please enter your choice: "
    choice <- getLine

    case choice of 
        "1" -> updateName ft
        "2" -> updateSurname ft
        "3" -> updateBirthDate ft
        "4" -> updateGender ft
        _ -> putStrLn "Invalid choice"
        >> displayMenu ft

printTree :: FamilyTree -> IO ()
printTree ft = do
    putStrLn "Enter the name & surname of the person you want to print the tree of:"
    memberName <- getLine
    let member = fromJust (get_family_member memberName (treeMembers ft))
    putStrLn $ "The tree of " ++ memberName ++ " is"
    putStrLn $  drawTree $ createNodes member ft
    displayMenu ft

displayMenu :: FamilyTree -> IO ()
displayMenu ft = do
    putStrLn "------------------- Tree Menu -------------------"
    putStrLn "1. Add a person"
    putStrLn "2. Add a spouse"
    putStrLn "3. Add a child"
    putStrLn "4. Print a person's details"
    putStrLn "5. Set a person's death date"
    putStrLn "6. Get a person's relationship with another person"
    putStrLn "7. Update a person's details"
    putStrLn "8. Print the tree"
    putStrLn "9. Exit"
    putStrLn "-----------------------------------------------"
    putStrLn "Enter your choice:"
    choice <- getLine
    case choice of
        "1" -> addPerson ft
        "2" -> addSpouse ft
        "3" -> addChild ft
        "4" -> printPerson ft
        "5" -> setDeathDate ft
        "6" -> askForRelations ft
        "7" -> updatePerson ft
        "8" -> printTree ft
        "9" -> exit
        _ -> putStrLn "Invalid choice"
        >> displayMenu ft

exit :: IO ()
exit = do
    die ("Exiting...")
    


main::IO()
main = do
    putStrLn "Welcome to the Family Tree Warehouse!"
    
    displayMenu ozgurTree


updateName :: FamilyTree -> IO ()
updateName ft = do
    putStrLn "Enter the person to update:"
    personName <- getLine
    putStrLn "Enter the new name:"
    newName <- getLine
    let member = get_family_member personName (treeMembers ft)
    if isNothing member
        then putStrLn "Member not found"
    else do
        let newMember = (fromJust member){firstName=newName}
        let updatedFather = updateFather ft personName (fullName newMember) (father newMember)
        let updatedMother = updateMother updatedFather personName (fullName newMember) (mother newMember)
        let updatedSpouse = updateSpouse updatedMother personName (fullName newMember) (spouse newMember)
        let updatedChildren = updateChildren updatedSpouse personName (fullName newMember) (children newMember)
        let updatedTreeMembers = remove (fromJust (get_family_member personName (treeMembers updatedChildren))) (treeMembers updatedChildren)
        let updatedNew = updatedChildren{treeMembers=newMember:updatedTreeMembers}
        putStrLn "Updated tree"
        displayMenu updatedNew


updateSurname :: FamilyTree -> IO ()
updateSurname ft = do
    putStrLn "Enter the person to update:"
    personName <- getLine
    putStrLn "Enter the new surname:"
    newSurname <- getLine
    let member = get_family_member personName (treeMembers ft)
    if isNothing member
        then putStrLn "Member not found"
    else do
        let newMember = (fromJust member){lastName=newSurname}
        let updatedFather = updateFather ft personName (fullName newMember) (father newMember)
        let updatedMother = updateMother updatedFather personName (fullName newMember) (mother newMember)
        let updatedSpouse = updateSpouse updatedMother personName (fullName newMember) (spouse newMember)
        let updatedChildren = updateChildren updatedSpouse personName (fullName newMember) (children newMember)
        let updatedTreeMembers = remove (fromJust (get_family_member personName (treeMembers updatedChildren))) (treeMembers updatedChildren)
        let updatedNew = updatedChildren{treeMembers=newMember:updatedTreeMembers}
        putStrLn "Updated tree"
        displayMenu updatedNew

updateBirthDate :: FamilyTree -> IO ()
updateBirthDate ft = do
    putStrLn "Enter the person to update birth date:"
    personName <- getLine
    let member = fromJust (get_family_member personName (treeMembers ft))
    putStrLn "Enter the birth year:"
    birthYear <- getLine
    putStrLn "Enter the birth month:"
    birthMonth <- getLine
    putStrLn "Enter the birth day:"
    birthDay <- getLine
    let bd = fromGregorian (read birthYear) (read birthMonth) (read birthDay)
    let newMember = member{birthDate=(Just bd)}
    let removedMember = remove member (treeMembers ft)
    displayMenu ft{treeMembers=newMember:removedMember}

updateGender :: FamilyTree -> IO ()
updateGender ft = do
    putStrLn "Enter the person to update the gender:"
    personName <- getLine
    let member = fromJust (get_family_member personName (treeMembers ft))
    putStrLn "Enter the new gender:"
    newGender <- getLine
    let newMember = member{gender=newGender}
    let removedMember = remove member (treeMembers ft)
    displayMenu ft{treeMembers=newMember:removedMember}

