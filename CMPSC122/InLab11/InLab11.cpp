#include <iostream>
#include <string>
#include <queue>
#include <climits>

using namespace std;

typedef int Type;

/////////////////////////////////////////////////////////////////////
// Declaration for the BinNode class
/////////////////////////////////////////////////////////////////////

class BinNode {
public:
    Type data;
    BinNode* left;
    BinNode* right;
};


/////////////////////////////////////////////////////////////////////
// NOTE: Place your 3 functions below here
/////////////////////////////////////////////////////////////////////

int CountLeaves(BinNode* root) {
    if (root == nullptr)
        return 0;
    if (root->left == nullptr && root->right == nullptr)
        return 1;
    return CountLeaves(root->left) + CountLeaves(root->right);
}

int CountSmaller5(BinNode* root) {
    if (root == nullptr)
        return 0;
    int count = 0;
    if (root->data <= 5)
        count = 1;
    return count + CountSmaller5(root->left) + CountSmaller5(root->right);
}

int FindMin(BinNode* root) {
    if (root == nullptr)
        return INT_MIN;
    while (root->left != nullptr)
        root = root->left;
    return root->data;
}

/////////////////////////////////////////////////////////////////////
// Below are functions that I implemented for binary trees
// Used by the testing program
/////////////////////////////////////////////////////////////////////

class NodePrinter {
public:
    BinNode* node;
    int rLeft;
    int rRight;
    int level;
    NodePrinter(BinNode* n, int l, int r, int lv) {
        node = n;
        rLeft = l;
        rRight = r;
        level = lv;
    }
};

void insert(BinNode*& root, Type data) {
    if (root == NULL) {
        root = new BinNode;
        root->data = data;
        root->left = NULL;
        root->right = NULL;
    }
    else if (data > root->data) {
        insert(root->right, data);
    }
    else if (data < root->data) {
        insert(root->left, data);
    }
}

void ShowTree(BinNode* root) {
    if (root == NULL) {
        return;
    }
    NodePrinter initP(root, 0, 79, 0);
    char lineBuffer0[80];
    char lineBuffer1[80];
    char lineBuffer2[80];
    char lineBuffer3[80];
    int curlevel = 0;
    queue<NodePrinter> pQueue;
    pQueue.push(initP);
    while (!pQueue.empty()) {
        for (int i = 0; i < 80; i++) {
            lineBuffer0[i] = ' ';
            lineBuffer1[i] = ' ';
            lineBuffer2[i] = ' ';
            lineBuffer3[i] = ' ';
        }
        while (!pQueue.empty() && pQueue.front().level == curlevel) {
            NodePrinter cur = pQueue.front();
            pQueue.pop();
            int mid = (cur.rLeft + cur.rRight) / 2;
            int lpos = (mid + cur.rLeft) / 2;
            int rpos = (mid + cur.rRight) / 2;
            if (cur.node->data >= 0 && cur.node->data <= 9) {
                lineBuffer0[mid] = cur.node->data + '0';
            }
            else if (cur.node->data >= 10 && cur.node->data <= 99) {
                int ldigit = cur.node->data % 10;
                int rdigit = cur.node->data / 10;
                lineBuffer0[mid] = ldigit + '0';
                lineBuffer0[mid-1] = rdigit + '0';
            }
            else {
                lineBuffer0[mid] = '?';
            }

            //Line 1
            if (cur.node->left != NULL || cur.node->right != NULL) {
                lineBuffer1[mid] = '|';
            }

            //Line 2 & Line 3
            int ln = -1, rn = -1;
            if (cur.node->left != NULL && cur.node->right != NULL) {
                ln = lpos;
                rn = rpos;
                lineBuffer3[ln] = '|';
                lineBuffer3[rn] = '|';
                NodePrinter lp(cur.node->left, cur.rLeft, mid, curlevel + 1);
                NodePrinter rp(cur.node->right, mid, cur.rRight, curlevel + 1);
                pQueue.push(lp);
                pQueue.push(rp);
            }
            else if (cur.node->left != NULL) {
                ln = lpos;
                rn = mid;
                lineBuffer3[ln] = '|';
                NodePrinter lp(cur.node->left, cur.rLeft, mid, curlevel + 1);
                pQueue.push(lp);
            }
            else if (cur.node->right != NULL) {
                ln = mid;
                rn = rpos;
                lineBuffer3[rn] = '|';
                NodePrinter rp(cur.node->right, mid, cur.rRight, curlevel + 1);
                pQueue.push(rp);
            }

            if (ln >= 0) {
                for (int i = ln; i <= rn; i++) {
                    lineBuffer2[i] = '-';
                }
            }
        }
        // Print lines
        for (int i = 0; i < 80; i++) {
            cout << lineBuffer0[i];
        }
        cout << endl;

        for (int i = 0; i < 80; i++) {
            cout << lineBuffer1[i];
        }
        cout << endl;

        for (int i = 0; i < 80; i++) {
            cout << lineBuffer2[i];
        }
        cout << endl;

        for (int i = 0; i < 80; i++) {
            cout << lineBuffer3[i];
        }
        cout << endl;
        curlevel++;
    }

}

void DeleteTree(BinNode * &root)
{
    if (root == nullptr)
        return;

    DeleteTree(root->left);
    DeleteTree(root->right);

    if (root->left != nullptr && root->left->left == nullptr && root->left->right == nullptr)
    {
        delete root->left;
        root->left = nullptr;
    }
    if (root->right != nullptr && root->right->left == nullptr && root->right->right == nullptr)
    {
        delete root->right;
        root->right = nullptr;
    }
}

void inorder(BinNode* root) {
    if (root == NULL) {
        return;
    }
    inorder(root->left);
    cout << root->data << " ";
    inorder(root->right);
}

void postorder(BinNode* root) {
    if (root == NULL) {
        return;
    }
    postorder(root->left);
    postorder(root->right);
    cout << root->data << " ";
}

/////////////////////////////////////////////////////////////////////
// Below is the main function for the testing program
/////////////////////////////////////////////////////////////////////

int main() {
    cout << "Inserting 4,10,8,5,2,7,3,1,9 to empty BST." << endl;
    BinNode* root = NULL; // Empty BST
    insert(root, 4);
    insert(root, 10);
    insert(root, 8);
    insert(root, 5);
    insert(root, 2);
    insert(root, 7);
    insert(root, 3);
    insert(root, 1);
    insert(root, 9);

    cout << "Inorder Traversal: ";
    inorder(root);
    cout << endl;
    cout << "Postorder Traversal: ";
    postorder(root);
    cout << endl;
    cout << endl;

    ShowTree(root);

    // Uncomment the following to test your function
    cout << "Total Number of leaves: " << CountLeaves(root) << endl;

    // Uncomment the following to test your function
    cout << "Total Number of Nodes with Value <= 5: " << CountSmaller5(root) << endl;

    // Uncomment the following to test your function
    cout << "Smallest Value in BST: " << FindMin(root) << endl;


    DeleteTree(root);
    // Additional tests
    cout << "============================================================" << endl;
    cout << "Reset tree" << endl;
    cout << "Test for empty tree:" << endl;
    root = NULL; // Empty BST
    cout << "Total Number of leaves: " << CountLeaves(root) << endl;
    cout << "Total Number of Nodes with Value <= 5: " << CountSmaller5(root) << endl;
    cout << "Smallest Value in BST: " << FindMin(root) << endl;

    cout << "============================================================" << endl;
    cout << "Insert one node with data = 10" << endl;
    cout << "Test for tree with one node:" << endl;
    insert(root, 10);
    cout << "Total Number of leaves: " << CountLeaves(root) << endl;
    cout << "Total Number of Nodes with Value <= 5: " << CountSmaller5(root) << endl;
    cout << "Smallest Value in BST: " << FindMin(root) << endl;

    cout << "============================================================" << endl;
    cout << "Insert one node with data = 4" << endl;
    cout << "Test for tree with two nodes:" << endl;
    insert(root, 4);
    cout << "Total Number of leaves: " << CountLeaves(root) << endl;
    cout << "Total Number of Nodes with Value <= 5: " << CountSmaller5(root) << endl;
    cout << "Smallest Value in BST: " << FindMin(root) << endl;

    DeleteTree(root);
  
}

/*
Sample Output:
Inserting 4,10,8,5,2,7,3,1,9 to empty BST.
Inorder Traversal: 1 2 3 4 5 7 8 9 10 
Postorder Traversal: 1 3 2 7 5 9 8 10 4 

                                       4                                        
                                       |                                        
                   -----------------------------------------                    
                   |                                       |                    
                   2                                      10                    
                   |                                       |                    
         ---------------------                   -----------                    
         |                   |                   |                              
         1                   3                   8                              
                                                 |                              
                                            -----------                         
                                            |         |                         
                                            5         9                         
                                            |                                   
                                            ---                                 
                                              |                                 
                                              7                                 



Total Number of leaves: 4
Total Number of Nodes with Value <= 5: 5
Smallest Value in BST: 1
============================================================
Reset tree
Test for empty tree:
Total Number of leaves: 0
Total Number of Nodes with Value <= 5: 0
Smallest Value in BST: -2147483648
============================================================
Insert one node with data = 10
Test for tree with one node:
Total Number of leaves: 1
Total Number of Nodes with Value <= 5: 0
Smallest Value in BST: 10
============================================================
Insert one node with data = 4
Test for tree with two nodes:
Total Number of leaves: 1
Total Number of Nodes with Value <= 5: 1
Smallest Value in BST: 4

*/