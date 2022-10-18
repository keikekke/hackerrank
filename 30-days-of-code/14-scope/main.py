# Because the server does not accept Go in this problem,
# I chose Python instead.

class Difference:
    def __init__(self, a):
        self.__elements = a

    # Add your code here
    def computeDifference(self):
        self.maximumDifference = 0
        for e1 in self.__elements:
            for e2 in self.__elements:
                diff = abs(e1 - e2)
                if diff > self.maximumDifference:
                    self.maximumDifference = diff

# End of Difference class


_ = input()
a = [int(e) for e in input().split(' ')]

d = Difference(a)
d.computeDifference()

print(d.maximumDifference)
