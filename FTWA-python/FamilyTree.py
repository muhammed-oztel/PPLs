

class FamilyTree(object):

    def __init__(self, name):
        """
        Initialize the tree.

            param: name: string
            return: None
        """
        self.name = name    # string
        self.members = []   # list of FamilyMember
        self.root = None    # FamilyMember

    def add_member(self, member):
        """
        Add a member to the tree.

            param: member: FamilyMember
            return: None
        """
        if len(self.members) == 0:
            self.root = member
        
        member.set_tree(self)
        self.members.append(member)

    def update_member(self, member):
        """
        Update a member in the tree.
            
            param: member: FamilyMember
            return: None
        """
        for i in range(len(self.members)):
            if self.members[i].name == member.name and self.members[i].surname == member.surname:
                self.members[i] = member
                return
        
        member.set_tree(self)
        self.members.append(member)

    def search_member(self, name, surname):
        """
        Search a member in the tree.

            param: name: string
            param: surname: string
            return: FamilyMember
        """
        for i in range(len(self.members)):
            if self.members[i].name == name and self.members[i].surname == surname:
                return self.members[i]
        
        return None
