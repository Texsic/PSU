#include <iostream>
#include <fstream>
#include <sstream>
#include <string>

using namespace std;

struct TreeNode {
    string studentName;
    float averageGrade;
    int numCourses;
    TreeNode *left;
    TreeNode *right;
};

void Insert(TreeNode *&root, string studentName, float grade);
void PrintTree(TreeNode *root, ofstream &out);

void Insert(TreeNode *&root, string studentName, float grade) {
    if (root == nullptr) {
        root = new TreeNode;
        root->studentName = studentName;
        root->averageGrade = grade;
        root->numCourses = 1;
        root->left = nullptr;
        root->right = nullptr;
    } else if (studentName < root->studentName) {
        Insert(root->left, studentName, grade);
    } else if (studentName > root->studentName) {
        Insert(root->right, studentName, grade);
    } else {
        root->averageGrade = (root->averageGrade * root->numCourses + grade) / (root->numCourses + 1);
        root->numCourses++;
    }
}

void PrintTree(TreeNode *root, ofstream &out) {
    if (root != nullptr) {
        PrintTree(root->left, out);
        out << root->studentName << " " << root->averageGrade << endl;
        PrintTree(root->right, out);
    }
}

int main() {
    string inputFileName, outputFileName;

    cout << "Please type the text file name: ";
    cin >> inputFileName;
    cout << "Please give the output text file name: ";
    cin >> outputFileName;

    ifstream inputFile(inputFileName);
    if (!inputFile.is_open()) {
        cout << "Error: Unable to open input file." << endl;
        return 1;
    }

    ofstream outputFile(outputFileName);
    if (!outputFile.is_open()) {
        cout << "Error: Unable to open output file." << endl;
        return 1;
    }

    TreeNode *root = nullptr;

    string line;
    while (getline(inputFile, line)) {
        stringstream ss(line);
        string studentName, course;
        float grade;
        ss >> studentName >> course >> grade;
      
        Insert(root, studentName, grade);
    }

    PrintTree(root, outputFile);

    inputFile.close();
    outputFile.close();

    cout << "You are done! You can open the file \"" << outputFileName << "\" to check." << endl;

    return 0;
}


/*
Sample run:
Please type the text file name: input.txt
Please give the output text file name: results.txt
You are done! You can open the file "results.txt" to check.

results.txt output:
Alex 70
Ben 75
Bob 70
Bruce 85
Carte 75
Charles 90
Eddy 35
Luke 85
Mike 80
Patric 30
Peter 95
Pique 55
*/