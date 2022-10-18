# Because the server does not accept Go in this problem,
# I chose Python instead.

class Node:
    def __init__(self, data):
        self.data = data
        self.next = None


class Solution:
    def display(self, head):
        current = head
        while current:
            print(current.data, end=' ')
            current = current.next

    # Complete this method
    def insert(self, head, data):
        if head is None:
            return Node(data)
        head.next = self.insert(head.next, data)
        return head


mylist = Solution()
T = int(input())
head = None
for i in range(T):
    data = int(input())
    head = mylist.insert(head, data)
mylist.display(head)
