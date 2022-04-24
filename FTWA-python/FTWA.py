from PrettyPrinter import PrettyPrinter
from FamilyTree import FamilyTree


class FamilyTreeWarehouseApplication(object):

    def __init__(self):
        self.trees = []
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
        1. Print the tree
        2. Add a person
        3. 
        4. Return to main menu
        """)

    def create_tree(self, name):
        self.trees.append(FamilyTree(name))
