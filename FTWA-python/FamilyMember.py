from datetime import date


class FamilyMember(object):

    def __init__(self, name=None, surname=None, gender=None, birth_date=None, death_date=None, father=None, mother=None):
        self.name = name                # string
        self.surname = surname          # string
        self.gender = gender            # string
        self.birth_date = birth_date    # datetime.date
        self.death_date = death_date    # datetime.date
        self.father = father            # FamilyMember
        self.mother = mother            # FamilyMember
        self.children = []              # list of FamilyMember
        self.tree = None                # FamilyTree
        self.spouse = None              # FamilyMember

    def add_child(self, child):
        """
        Add a child to the member.

            param: child: FamilyMember
            return: None
        """
        if not self.check_date(child.birth_date, child):
            return

        if self.death_date is None and self.spouse.death_date is None:
            self.children.append(child)
            self.spouse.children.append(child)
            child.set_tree(self.tree)
            self.tree.add_member(child)

            if self.gender == "male":
                child.father = self
                child.mother = self.spouse

            elif self.gender == "female":
                child.mother = self
                child.father = self.spouse

        else:
            print(f"ERROR!!! Cannot add child ({child.name}) to a widow ({self.name}/{self.spouse.name})!")

    def add_spouse(self, spouse):
        """
        Add a spouse to the member.

            param: spouse: FamilyMember
            return: None
        """
        self.spouse = spouse
        spouse.spouse = self

        if self.tree is not None:
            self.spouse.set_tree(self.tree)
            self.tree.add_member(self.spouse)
        else:
            self.tree = spouse.tree
            self.tree.add_member(self)

        if spouse.get_age() < 18 and spouse.get_age() != -1:
            print(f"WARNING!!! The member ({spouse.name}) who is marrying {self.name} is under 18 years old!")
        elif self.get_age() < 18 and self.get_age() != -1:
            print(f"WARNING!!! The member ({self.name}) who is marrying {spouse.name} is under 18 years old!")

    def check_date(self, query_date, query_member=None):
        """
        Check if the date is valid.

            param: query_date: date
            return: boolean
        """
        if query_date is None and query_member.name == 'placeholder':
            return True

        elif (date.today() - query_date).days < 0:
            print(f"ERROR!!! birth / death date ({query_date}) of member ({query_member.name}) is in the future!")
            return False

        else:
            return True

    def is_alive(self):
        """
        Check if the member is alive.

            return: boolean
        """
        if self.death_date is None:
            return True
        else:
            return False

    def get_age(self):
        """
        Get the age of the member.

            return: int
        """
        if self.birth_date is None:
            return -1
        elif not self.death_date:
            return (date.today() - self.birth_date).days // 365
        else:
            return (self.death_date - self.birth_date).days // 365

    def get_level(self):
        """
        Get the level of the member.

            return: int
        """
        if self.tree is None:
            return -1

        father_level = 1
        father = self.father
        while father is not None:
            father_level += 1
            father = father.father
        
        mother_level = 1
        mother = self.mother
        while mother is not None:
            mother_level += 1
            mother = mother.mother

        return max(father_level, mother_level)

    def get_relationship(self, other_member):
        """
        the method returns the relationship of other member to this member (self)

            param: other_member: FamilyMember
            return: list of string
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
        if self.father is not None and other_member in self.father.children:
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

        if self.father is not None and self.father.father is not None and other_member.father == self.father.father:
            # check for uncle (brother of father)
            if other_member.gender == 'male':
                relationships.append('amca')
            # check for aunt (sister of father)
            elif other_member.gender == 'female':
                relationships.append('teyze')

        if self.mother is not None and self.mother.father is not None and other_member.father == self.mother.father:
            # check for uncle (brother of mother)
            if other_member.gender == 'male':
                relationships.append('dayi')
            # check for aunt (sister of mother)
            elif other_member.gender == 'female':
                relationships.append('hala')

        # yegen
        if self.father is not None:
            for sibling in self.father.children:
                if other_member in sibling.children:
                    relationships.append('yegen')

        # cousin
        if other_member.father is not None and other_member.father.father is not None and self.father is not None \
           and self.father.father is not None and other_member.mother is not None and other_member.mother.father \
           is not None and self.mother is not None and self.mother.father is not None:
            
            if other_member.father.father == self.father.father or other_member.mother.father == self.mother.father:
                relationships.append('kuzen')

        # sibling-in-law (eniste/yenge)
        if self.father is not None and other_member.spouse in self.father.children:
            # eniste
            if other_member.gender == 'male':
                relationships.append('eniste')
            # yenge
            elif other_member.gender == 'female':
                relationships.append('yenge')

        # mother-in-law
        if self.spouse is not None and self.spouse.mother == other_member:
            relationships.append('kayinvalide')

        # father-in-law
        if self.spouse is not None and self.spouse.father == other_member:
            relationships.append('kayinpeder')

        # son-in-law/daughter-in-law
        if other_member.spouse in self.children:
            if other_member.gender == 'male':
                relationships.append('damat')
            elif other_member.gender == 'female':
                relationships.append('gelin')

        if self.spouse is not None and self.spouse.father is not None and other_member.spouse is not None and \
           other_member.spouse in self.spouse.father.children:
            # bacanak
            if self.gender == 'male' and other_member.gender == 'male':
                relationships.append('bacanak')
            # elti
            elif self.gender == 'female' and other_member.gender == 'female':
                relationships.append('elti')

        # baldiz is the other member who is the sister of sombody's wife
        if self.spouse is not None and self.spouse.father is not None and self.gender == 'male' and other_member in self.spouse.father.children and other_member.gender == 'female':
            relationships.append('baldiz')

        # kayinbirader is the other member who is the brother of somebody's wife
        if self.spouse is not None and self.spouse.father is not None and other_member.gender == 'male' and other_member in self.spouse.father.children:
            relationships.append('kayinbirader')

        return relationships

    def set_tree(self, tree):
        """
        set tree of the current member

            param: tree: FamilyTree
            return: None
        """
        self.tree = tree

    def set_death_date(self, death_date):
        """
        set death date of the current member
            
                param: death_date: date
                return: None
        """
        if self.check_date(death_date, self):
            self.death_date = death_date
