from PrettyPrinter import PrettyPrinter
from FamilyTree import FamilyTree
from FamilyMember import FamilyMember
import datetime


class FamilyTreeWarehouseApplication(object):

    def __init__(self):
        self.tree = None
        self.pretty_printer = PrettyPrinter()

        self.init_app()

    def init_app(self):
        print("Welcome to the Family Tree Warehouse!\n")
        while True:
            self.print_main_menu()
            choice = input("\nEnter your choice: \n")
            if choice == "1":
                name = input("Enter the name of the tree: ")
                self.create_tree(name)
                while True:
                    self.print_tree_menu()
                    choice2 = input("\nEnter your choice: \n")
                    if choice2 == "1":  # Add a person
                        self.add_person_menu()
                    elif choice2 == "2":  # Update a person
                        # TODO: implemantation needed, ask for add spouse option as well
                        while True:
                            self.print_update_person_menu()
                            choice3 = input("\nEnter your choice: \n")
                            if choice3 != "8":
                                person = self.search_person()
                                if person is not None:
                                    if choice3 == "1":  # Add a spouse
                                        spouse = self.add_person_menu()
                                        flag = False
                                        while not flag:
                                            date = self.get_date()
                                            flag = self.check_date(date)
                                        spouse.birth_date = date
                                        person.add_spouse(spouse)
                                    elif choice3 == "2":  # Add child
                                        child = self.add_person_menu()
                                        person.add_child(child)
                                    elif choice3 == "3":  # Add gender
                                        person.gender = input(
                                            "Enter a gender: ")
                                    elif choice3 == "4":  # Add birth date
                                        flag = False
                                        while not flag:
                                            date = self.get_date()
                                            flag = self.check_date(date)
                                        person.birth_date = date
                                    elif choice3 == "5":  # Add death date
                                        flag = False
                                        while not flag:
                                            date = self.get_date()
                                            flag = self.check_date(date)
                                        person.death_date = date
                                    elif choice3 == "6":  # Add father
                                        father = self.add_person_menu()
                                        person.father = father
                                    elif choice3 == "7":  # Add mother
                                        mother = self.add_person_menu()
                                        person.mother = mother
                            elif choice3 == "8":
                                break
                            else:
                                print("Invalid choice!")

                    # Get a person's status (dead or alive)
                    elif choice2 == "3":
                        status = self.search_person().is_alive()
                        if status:
                            print("The person is alive!")
                        else:
                            print("The person is dead!")
                    elif choice2 == "4":  # Get a person's age
                        print(self.search_person().get_age())
                    elif choice2 == "5":  # Get a person's level
                        print(self.search_person().get_level())
                    elif choice2 == "6":  # Get a person's relationship with another person
                        person1 = self.search_person()
                        person2 = self.search_person()
                        print(person1.get_relationship(person2))
                    elif choice2 == "7":  # Print the tree
                        self.print_tree()
                    elif choice2 == "8":  # Return to main menu
                        break
                    else:
                        print("Invalid choice!")

            elif choice == "2":
                print("Goodbye!")
                break
            else:
                print("Invalid choice!")

    def print_main_menu(self):
        print("""
        1. Create a new family tree
        2. Quit
        """)

    def print_tree_menu(self):
        print("""
        1. Add a person
        2. Update a person
        3. Get a person's status (dead or alive)
        4. Get a person's age
        5. Get a person's level
        6. Get a person's relationship with another person
        7. Print the tree
        8. Return to main menu
        """)

    def print_update_person_menu(self):
        # spouse, child, gender, bday, dday, father, mother
        print("""
        1. Add a spouse
        2. Add a child
        3. Add gender
        4. Add birth date
        5. Add death date
        6. Add father
        7. Add mother
        8. Return to  tree menu
        """)

    def create_tree(self, name):
        self.tree = FamilyTree(name)

    def print_tree(self):
        node_count = len(self.tree.members)
        flag = [True] * node_count
        self.pretty_printer.printNTree(self.tree.root, flag, 0, True)

    def search_person(self):
        while True:
            try:
                name, surname = input(
                    "Enter the name & surname of the person you want to search / modify: ").split(" ")
                break
            except:
                print("Invalid name!")
        person = self.tree.search_member(name, surname)
        return person

    def add_person_menu(self) -> FamilyMember:
        while True:
            try:
                name, surname, gender = input(
                    "Enter the name & surname of the person you want to add: ").split(" ")
                break
            except:
                print("Invalid name!")
        options = input(
            "Enter the options (bday, dday, father, mother) (N to skip): \n")
        if options.lower() != "n":
            options = options.split(" ")
            fm = FamilyMember(name=name, surname=surname,
                              birth_date=options[0], death_date=options[1], father=options[2], mother=options[3])
            self.tree.add_member(fm)
        else:
            fm = FamilyMember(name=name, surname=surname, gender=gender)
            self.tree.add_member(fm)
        return fm

    def get_date(self):
        date = input("Enter a date (DD/MM/YYYY):").split("/")
        try:
            date_object = datetime.date(
                int(date[2]), int(date[1]), int(date[1]))
            return date_object
        except:
            print("Invalid date!")
            return False

    def check_date(self, date):
        try:
            if (datetime.date.today() - date).days < 0:
                print("Cannot add birth / death date in the future!")
                return False
            else:
                return True
        except:
            return False
