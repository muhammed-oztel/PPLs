from FamilyTree import FamilyTree
from FamilyMember import FamilyMember
from PrettyPrinter import PrettyPrinter
from datetime import date
from pprint import pprint


class PlayGround(object):
    def __init__(self):
        self.family_tree = FamilyTree("tree0")
        self.pretty_printer = PrettyPrinter()
        self.init_test()

    def init_test(self):
        # create root couple <male>
        ahmet = FamilyMember("Ahmet", "Ozgur", "male", date(1956, 11, 20))
        self.family_tree.add_member(ahmet)

        # create root couple <female>
        hilal = FamilyMember("Hilal", "Demirtas Ozgur", "female", date(1957, 5, 20))

        # set created couple <ahmet, hilal> as spouses
        ahmet.add_spouse(hilal)

        # update a member <change DOB>
        hilal_updated = FamilyMember("Hilal", "Demirtas Ozgur", "female", date(1957, 9, 20))
        hilal_updated.spouse = hilal.spouse
        hilal_updated.spouse.spouse = hilal_updated
        hilal_updated.tree = hilal.tree
        self.family_tree.update_member(hilal_updated)

        # create and add children for ahmet and hilal couple
        selin = FamilyMember("Selin", "Ozgur", "female", date(1979, 1, 20))
        ali = FamilyMember("Ali", "Ozgur", "male", date(1977, 8, 15))
        omer = FamilyMember("Omer", "Ozgur", "male", date(1981, 4, 15))

        # placeholder member
        placeholder = FamilyMember("placeholder", "placeholder")

        ahmet.add_child(selin)
        ahmet.add_child(ali)
        ahmet.add_child(omer)
        ahmet.add_child(placeholder)

        # create damat for ahmet and hilal couple
        mehmet = FamilyMember("Mehmet", "Isci", "male", date(1975, 11, 9))
        mehmet.add_spouse(selin)

        # create gelin for ahmet and hilal couple
        ayse = FamilyMember("Ayse", "Yalcintas Ozgur", "female", date(1979, 2, 3))
        ayse.add_spouse(ali)

        # create children for mehmet and selin couple
        yunus = FamilyMember("Yunus", "Isci", "male", date(1999, 8, 20))
        leyla = FamilyMember("Leyla", "Isci", "female", date(2005, 4, 2)) # <18 member
        zeynep = FamilyMember("Zeynep", "Isci", "female", date(1996, 9, 9))

        mehmet.add_child(yunus)
        mehmet.add_child(leyla)
        mehmet.add_child(zeynep)

        # create children for ali and ayse couple
        bilal = FamilyMember("Bilal", "Ozgur", "male", date(1999, 8, 20))
        suleiman = FamilyMember("Suleiman", "Ozgur", "male", date(1999, 8, 20))
        burcu = FamilyMember("Burcu", "Ozgur", "female", date(2001, 7, 9))

        ali.add_child(bilal)
        ali.add_child(suleiman)
        ali.add_child(burcu)

        # create new spouses <Leyla, Suleiman> and <Zeynep, Bilal>
        leyla.add_spouse(suleiman)
        zeynep.add_spouse(bilal)

        # create children for Leyla and Suleiman couple
        batuhan = FamilyMember("Batuhan", "Ozgur", "male", date(2021, 5, 5))
        suleiman.add_child(batuhan)

        # create children for Bilal and Zeynep couple
        arif = FamilyMember("Arif", "Ozgur", "male", date(2022, 5, 11))
        bilal.add_child(arif)

        # a member dies and we check if we can add a child to him/her
        elraen = FamilyMember("Elraen", "Isci", "male", date(2022, 4, 1))
        mehmet.set_death_date(date(2021, 5, 9))
        mehmet.add_child(elraen)

        # a member borns/dies in the future and we check if dates are realistic
        jahrein = FamilyMember("Jahrein", "X", "male", date(2024, 4, 9))
        suleiman.add_child(jahrein)
        suleiman.set_death_date(date(2026, 11, 12))

        # print details of a member
        query_member = batuhan
        print(f"\ndetails of {query_member.name}:")
        print("age: ", query_member.get_age())
        print("is alive: ", query_member.is_alive())
        print("level in family tree: ", query_member.get_level())
        print()

        # print relationships
        query_member = ahmet
        print(f"relationship of {query_member.name} with {selin.name}:")
        for relations in suleiman.get_relationship(selin):
            print(relations)

        # pretty print the tree
        print('\nHierarchy of the tree:\n')
        self.print_tree()

    def print_tree(self):
        node_count = len(self.family_tree.members)
        flag = [True] * node_count
        self.pretty_printer.printNTree(self.family_tree.root, flag, 0, True)


if __name__ == "__main__":
    playground = PlayGround()
