from PrettyPrinter import PrettyPrinter
from FamilyTree import FamilyTree
from FamilyMember import FamilyMember


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
                    choice = input("\nEnter your choice: \n")
                    if choice == "1":
                        self.print_tree()
                    elif choice == "2":
                        name, surname = input(
                            "Enter the name & surname of the person: ").split(" ")
                        options = input(
                            "Enter the options (gender, bday, dday, father, mother) (N to skip): \n")
                        if options != "N":
                            options = options.split(" ")
                            fm = FamilyMember(
                                name=name, surname=surname, gender=options[1], birth_date=options[2], death_date=options[3], father=options[4], mother=options[5])
                            self.tree.add_member(fm)
                        else:
                            self.tree.add_member(FamilyMember(
                                name=name, surname=surname))
                    elif choice == "3":
                        status = self.search_person().is_alive()
                        if status:
                            print("The person is alive!")
                        else:
                            print("The person is dead!")
                    elif choice == "4":
                        print(self.search_person().get_age())
                    elif choice == "5":
                        print(self.search_person().get_level())
                    elif choice == "6":
                        person1 = self.search_person()
                        person2 = self.search_person()
                        print(person1.get_relationship(person2)[0])
                    elif choice == "7":
                        self.print_tree()
                    elif choice == "8":
                        break

            elif choice == "2":
                print("Goodbye!")
                break

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

    def create_tree(self, name):
        self.tree = FamilyTree(name)

    def print_tree(self):
        node_count = len(self.tree.members)
        flag = [True] * node_count
        self.pretty_printer.printNTree(self.tree.root, flag, 0, True)

    def search_person(self):
        name, surname = input(
            "Enter the name & surname of the person: ").split(" ")
        person = self.tree.search_member(name, surname)
        return person
