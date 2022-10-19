// Because the server does not accept Go in this problem,
// and I'm bored with Python, which I'm already familiar with,
// so I chose Java instead for learning.

import java.util.*;

class Node {
    Node left, right;
    int data;

    Node(int data) {
        this.data = data;
        left = right = null;
    }
}

class Solution {

    static void levelOrder(Node root) {
        // Write your code here
        Queue<Node> q = new LinkedList<Node>();
        q.add(root);
        while (!q.isEmpty()) {
            Node node = q.remove();
            if (node == null) {
                continue;
            }
            System.out.printf("%d ", node.data);
            q.add(node.left);
            q.add(node.right);
        }
    }

    public static Node insert(Node root, int data) {
        if (root == null) {
            return new Node(data);
        } else {
            Node cur;
            if (data <= root.data) {
                cur = insert(root.left, data);
                root.left = cur;
            } else {
                cur = insert(root.right, data);
                root.right = cur;
            }
            return root;
        }
    }

    public static void main(String args[]) {
        try (Scanner sc = new Scanner(System.in)) {
            int T = sc.nextInt();
            Node root = null;
            while (T-- > 0) {
                int data = sc.nextInt();
                root = insert(root, data);
            }
            levelOrder(root);
        }
    }
}