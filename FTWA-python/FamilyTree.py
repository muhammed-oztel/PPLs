

class FamilyTree(object):

    def __init__(self, name):
        self.name = name
        self.members = []

    def add_member(self, member):
        self.members.append(member)

    def update_member(self, member):
        for i in range(len(self.members)):
            if self.members[i].name == member.name and self.members[i].surname == member.surname:
                self.members[i] = member
                return
        self.members.append(member)
