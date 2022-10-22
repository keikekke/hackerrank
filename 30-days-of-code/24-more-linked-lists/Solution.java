import java.util.*;

class Node {
    int data;
    Node next;

    Node(int d) {
        data = d;
        next = null;
    }

}

class Solution {

    static Node removeDuplicatesInner(Node head, int data) {
        if (head == null) {
            return null;
        } else if (head.data == data) {
            return removeDuplicatesInner(head.next, data);
        }
        head.next = removeDuplicatesInner(head.next, head.data);
        return head;
    }

    public static Node removeDuplicates(Node head) {
        // Write your code here

        // From the constraint that the elements are always non-decreasing,
        // we can just check if the next data equals the current data
        head.next = removeDuplicatesInner(head.next, head.data);
        return head;
    }

    public static Node insert(Node head, int data) {
        Node p = new Node(data);
        if (head == null)
            head = p;
        else if (head.next == null)
            head.next = p;
        else {
            Node start = head;
            while (start.next != null)
                start = start.next;
            start.next = p;

        }
        return head;
    }

    public static void display(Node head) {
        Node start = head;
        while (start != null) {
            System.out.print(start.data + " ");
            start = start.next;
        }
    }

    public static void main(String args[]) {
        try (Scanner sc = new Scanner(System.in)) {
            Node head = null;
            int T = sc.nextInt();
            while (T-- > 0) {
                int ele = sc.nextInt();
                head = insert(head, ele);
            }
            head = removeDuplicates(head);
            display(head);
        }

    }
}