from FamilyMember import FamilyMember


class FamilyTree(object):

    def __init__(self, name):
        self.name = name
        self.members = []
        self.root = None

    def add_member(self, member: FamilyMember):
        self.members.append(member)
        if len(self.members) == 0:
            self.root = member

    def update_member(self, member: FamilyMember):
        for i in range(len(self.members)):
            if self.members[i].name == member.name and self.members[i].surname == member.surname:
                self.members[i] = member
                return
        self.members.append(member)

    def search_member(self, name, surname):
        for i in range(len(self.members)):
            if self.members[i].name == name and self.members[i].surname == surname:
                return self.members[i]
        return None
