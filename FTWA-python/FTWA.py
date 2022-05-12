from PrettyPrinter import PrettyPrinter
from FamilyTree import FamilyTree
from FamilyMember import FamilyMember
import datetime


class FamilyTreeWarehouseApplication(object):

    def __init__(self):
        self.tree = FamilyTree('tree0')
        self.pretty_printer = PrettyPrinter()
        self.init_app()

    def init_app(self):
        print("Welcome to the Family Tree Warehouse!")

        while True:
            self.print_tree_menu()
            choice = input("\nEnter your choice: \n")

            if choice == '1': # Add a person
                self.add_person_prompt()

            elif choice == '2': # Add a spouse
                member_0_fullname = input('Enter the name & surname of the person you want to add a spouse to: ')
                member_1_fullname = input('Enter the name & surname of the person you want to add as a spouse: ')
                member_0 = self.tree.search_member(member_0_fullname)
                member_1 = self.tree.search_member(member_1_fullname)
                if member_0 is not None and member_1 is not None:
                    member_0.add_spouse(member_1)

            elif choice == '3': # Add a child
                member_0_fullname = input('Enter the name & surname of the person you want to add a child to: ')
                member_1_fullname = input('Enter the name & surname of the person you want to add as a child: ')
                member_0 = self.tree.search_member(member_0_fullname)
                member_1 = self.tree.search_member(member_1_fullname)
                if member_0 is not None and member_1 is not None:
                    member_0.add_child(member_1)

            elif choice == '4': # Print a person's details
                member_fullname = input('Enter the name & surname of the person you want to print: ')
                member = self.tree.search_member(member_fullname)
                if member is not None:
                    print(f"\ndetails of {member.name}:")
                    print("age: ", member.get_age())
                    print("is alive: ", member.is_alive())
                    print("level in family tree: ", member.get_level())

            elif choice == '5': # Set a person's death date
                member_fullname = input('Enter the name & surname of the person you want to set a death date for: ')
                ddeath = input('Enter the death date (YYYY/MM/DD): ')
                member = self.tree.search_member(member_fullname)
                if member is not None:
                    date = ddeath.split("/")
                    death_date = datetime.date(int(date[0]), int(date[1]), int(date[2]))
                    member.set_death_date(death_date)

            elif choice == '6': # Get a person's relationship with another person
                member_0_fullname = input('Enter the name & surname of the person you want to get the relationship of: ')
                member_1_fullname = input('Enter the name & surname of the person you want to get the relationship with: ')
                member_0 = self.tree.search_member(member_0_fullname)
                member_1 = self.tree.search_member(member_1_fullname)
                if member_0 is not None and member_1 is not None:
                    self.get_relationship(member_1, member_0)

            elif choice == '7': # Update a person's details
                member_fullname = input('Enter the name & surname of the person you want to update: ')
                attribute = input('Enter the attribute you want to update: ')
                member = self.tree.search_member(member_fullname)

                if attribute == 'name':
                    new_name = input('Enter the new name: ')
                    member.name = new_name
                
                elif attribute == 'surname':
                    new_surname = input('Enter the new surname: ')
                    member.surname = new_surname
                
                elif attribute == 'dob':
                    new_dob = input('Enter the new date of birth (YYYY/MM/DD): ')
                    date = new_dob.split("/")
                    new_birth_date = datetime.date(int(date[0]), int(date[1]), int(date[2]))
                    member.birth_date = new_birth_date
                
                elif attribute == 'gender':
                    new_gender = input('Enter the new gender: ')
                    member.gender = new_gender

            elif choice == '8':
                self.print_tree()

            elif choice == '9':
                print("\nGoodbye!")
                break

    def print_tree_menu(self):
        print(""" 
        ------------------- Tree Menu -------------------
        1. Add a person
        2. Add a spouse
        3. Add a child
        4. Print a person's details
        5. Set a person's death date
        6. Get a person's relationship with another person
        7. Update a person's details
        8. Print the tree
        9. Exit
        """)

    def print_tree(self):
        node_count = len(self.tree.members)
        flag = [True] * node_count
        self.pretty_printer.printNTree(self.tree.root, flag, 0, True)

    def add_person_prompt(self):
        is_placeholder = input("Is this a placeholder? (y/n): ")
        if is_placeholder == "y":
            member = FamilyMember('placeholder', 'placeholder')
        else:
            member_info = input("Enter the name,surname,gender,dob (YYYY/MM/DD) of the person you want to add: ")
            name, surname, gender, dob = member_info.split(',')
            date = dob.split("/")
            birth_date = datetime.date(int(date[0]), int(date[1]), int(date[2]))
            member = FamilyMember(name=name, surname=surname, gender=gender, birth_date=birth_date)
        self.tree.add_member(member)
        return member

    def get_relationship(self, self_member, query_member):
        print(f"relationship of {query_member.name} to {self_member.name}:")
        for relations in self_member.get_relationship(query_member):
            print(relations)
        print()
