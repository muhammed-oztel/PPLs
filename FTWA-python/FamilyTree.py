

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

    def search_member(self, fullname):
        """
        Search a member in the tree.

            param: fullname: string
            return: FamilyMember
        """
        splitted= fullname.split(' ')
        first_name, last_name = splitted[0], ' '.join(splitted[1:])
        for member in self.members:
            if member.name == first_name and member.surname == last_name:
                return member 
        return None
