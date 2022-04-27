from datetime import date


class FamilyMember(object):

    def __init__(self, name=None, surname=None, gender=None, birth_date=None, death_date=None, father=None, mother=None):
        self.name = name
        self.surname = surname
        self.gender = gender
        self.birth_date = birth_date
        self.death_date = death_date
        self.father = father
        self.mother = mother
        self.children = []
        self.tree = None

    def add_child(self, child):
        if not self.death_date:
            self.children.append(child)
        else:
            print("Cannot add child to dead member!")

    def add_spouse(self, spouse):
        self.spouse = spouse
        if spouse.get_age() < 18 and spouse.get_age() != None:
            print("The spouse is under 18 years old!")

    def is_alive(self):
        if self.death_date is None:
            return True
        else:
            return False

    def get_age(self):  # calculate age based on date
        if self.birth_date is None:
            return -1
        elif not self.death_date:
            return (date.today() - self.birth_date).days // 365
        else:
            return (self.death_date - self.birth_date).days // 365

    def get_level(self):    # TODO: ask prof is this should be longest path
        if self.tree is None:  # the member is not in the tree
            return -1

        level = 1
        father = self.father
        while father is not None:
            level += 1
            father = father.father

        return level

    def get_relationship(self, other_member):
        """
        the method returns the relationship of other member to this member (self)
        """
        relationships = []

        # check if the other member is father
        if self.father == other_member:
            relationships.append('baba')

        # check if the other member is mother
        if self.mother == other_member:
            relationships.append('anne')

        # check if the other member is child (boy/girl)
        if other_member in self.children:
            if other_member.gender == 'male':
                relationships.append('ogul')
            elif other_member.gender == 'female':
                relationships.append('kiz')

        # check if the other member is brother/sister
        if other_member in self.father.children:
            # big brother
            if self.get_age() < other_member.get_age() and other_member.gender == 'male':
                relationships.append('abi')
            # big sister
            elif self.get_age() < other_member.get_age() and other_member.gender == 'female':
                relationships.append('abla')
            # little brother
            elif self.get_age() > other_member.get_age() and other_member.gender == 'male':
                relationships.append('erkek kardes')
            # little sister
            elif self.get_age() > other_member.get_age() and other_member.gender == 'female':
                relationships.append('kiz kardes')

        if other_member.father == self.father.father:
            # check for uncle (brother of father)
            if other_member.gender == 'male':
                relationships.append('amca')
            # check for aunt (sister of father)
            elif other_member.gender == 'female':
                relationships.append('teyze')

        if other_member.father == self.mother.father:
            # check for uncle (brother of mother)
            if other_member.gender == 'male':
                relationships.append('dayi')
            # check for aunt (sister of mother)
            elif other_member.gender == 'female':
                relationships.append('hala')

        # yegen
        for sibling in self.father.children:
            if other_member in sibling.children:
                relationships.append('yegen')

        # cousin
        if other_member.father.father == self.father.father or other_member.mother.father == self.mother.father:
            relationships.append('kuzen')

        # sibling-in-law (eniste/yenge)
        if other_member.spouse in self.father.children:
            if other_member.gender == 'male':
                relationships.append('eniste')
            elif other_member.gender == 'female':
                relationships.append('yenge')

        # mother-in-law
        if self.spouse.mother == other_member:
            relationships.append('kayinvalide')

        # father-in-law
        if self.spouse.father == other_member:
            relationships.append('kayinpeder')

        # son-in-law/daughter-in-law
        if other_member.spouse in self.children:
            if other_member.gender == 'male':
                relationships.append('damat')
            elif other_member.gender == 'female':
                relationships.append('gelin')

        if other_member.spouse in self.spouse.father.children:
            # bacanak
            if self.gender == 'male' and other_member.gender == 'male':
                relationships.append('bacanak')
            # elti
            elif self.gender == 'female' and other_member.gender == 'female':
                relationships.append('elti')

        if self.gender == 'male' and other_member in self.spouse.father.children and other_member.gender == 'female':
            relationships.append('baldiz')

        if other_member.gender == 'male' and other_member in self.spouse.father.children:
            relationships.append('kayinbirader')

        return relationships

    def set_tree(self, tree):
        self.tree = tree
