

class PrettyPrinter(object):
    def __init__(self):
        pass

    def printNTree(self, x, flag, depth, isLast):
        # Condition when node is None
        if x == None:
            return

        # Loop to print the depths of the
        # current node
        for i in range(1, depth):
            # Condition when the depth
            # is exploring
            if flag[i]:
                print("| ", "", "", "", end="")

            # Otherwise print
            # the blank spaces
            else:
                print(" ", "", "", "", end="")

        # Condition when the current
        # node is the root node
        if depth == 0:
            if x.spouse is not None:
                print(x.name + " " + x.surname + " & " +
                      x.spouse.name + " " + x.spouse.surname)
            else:
                print(x.name + " " + x.surname)

        # Condition when the node is
        # the last node of
        # the exploring depth
        elif isLast:
            print("+---", x.n)
            # No more childrens turn it
            # to the non-exploring depth
            flag[depth] = False
        else:
            print("+---", x.n)

        it = 0
        for i in x.root:
            it += 1

            # Recursive call for the
            # children nodes
            self.printNTree(i, flag, depth + 1, it == (len(x.children) - 1))
        flag[depth] = True
