#include <iostream>
#include <iomanip>
#include <algorithm>

using namespace std;

int* allocateArray(int size) {
    return new int[size];
}

void inputTestScores(int* scores, int size) {
    for (int i = 0; i < size; ++i) {
        do {
            cout << "Enter test score " << i + 1 << ": ";
            cin >> scores[i];

            if (scores[i] < 0) {
                cout << "Invalid input: negative value. Please try again.\n";
            }
        } while (scores[i] < 0);
    }
}

void sortScores(int* scores, int size) {
    sort(scores, scores + size);
}

double calculateAverage(int* scores, int size) {
    int sum = 0;
    for (int i = 0; i < size; ++i) {
        sum += scores[i];
    }
    return static_cast<double>(sum) / size;
}

void dropLowestScore(int* scores, int& size) {
    int minIndex = 0;
    for (int i = 1; i < size; ++i) {
        if (scores[i] < scores[minIndex]) {
            minIndex = i;
        }
    }

    for (int i = minIndex; i < size - 1; ++i) {
        scores[i] = scores[i + 1];
    }

    --size;
}

int main() {
    int numScores;

    do {
        cout << "Please enter the number of test scores: ";
        cin >> numScores;

        if (numScores <= 0) {
            cout << "Invalid input. Please try again.\n";
        }
    } while (numScores <= 0);

    int* testScores = allocateArray(numScores);

    inputTestScores(testScores, numScores);

    sortScores(testScores, numScores);

    cout << "\nSorted test scores:\n===================\n";
    for (int i = 0; i < numScores; ++i) {
        cout << testScores[i] << "\n";
    }
    cout << fixed << setprecision(2);
    cout << "\nThe average score: " << calculateAverage(testScores, numScores) << "\n";
    cout << endl;
    dropLowestScore(testScores, numScores);

    cout << "\nSorted test scores (lowest dropped):\n====================================\n";
    for (int i = 0; i < numScores; ++i) {
        cout << testScores[i] << "\n";
    }

    cout << "\nAverage test score after dropping lowest score: "
         << calculateAverage(testScores, numScores) << "\n";

    delete[] testScores;

    return 0;
}

/*
Sample Output:
Please enter the number of test scores: 0
Invalid input. Please try again.
Please enter the number of test scores: 6
Enter test score 1: 69
Enter test score 2: 93
Enter test score 3: -78
Invalid input: negative value. Please try again.
Enter test score 3: 75
Enter test score 4: 96
Enter test score 5: 91
Enter test score 6: 88

Sorted test scores:
===================
69
75
88
91
93
96

The average score: 85.33


Sorted test scores (lowest dropped):
====================================
75
88
91
93
96

Average test score after dropping lowest score: 88.60
*/