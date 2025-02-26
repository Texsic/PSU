#include <iostream>
#include <list>
#include <cstdlib>

using namespace std;

int Find(list<double> & targetList, double itemToFind) {
    // Find the first index of itemToFind in targetList
    int firstIndex = -1;
    for (auto iter = targetList.begin(); iter != targetList.end(); ++iter) {
        firstIndex++;
        if (*iter == itemToFind) {
            return firstIndex;
        }
    }

    return targetList.size();
}

int Count(list<double> & targetList, double itemToCount) {
    int count = 0;
    for (auto iter = targetList.begin(); iter != targetList.end(); ++iter) {
        if (*iter == itemToCount) {
            count++;
        }
    }
    return count;
}

void Shuffle(list<double>& targetList) {
    for (auto iter = targetList.begin(); iter != targetList.end(); ) {
        auto nextIter = iter;
        ++nextIter;
        if (nextIter == targetList.end()) {
            break; 
        }
        swap(*iter, *nextIter);
        ++iter; 
        ++iter; 
    }
}

///////////////////////////////////////////////////////////////////////////////
// Functions for testing. Do not modify. But adding more test cases is fine.
///////////////////////////////////////////////////////////////////////////////

template <typename T>
void DisplayList(list<T> & targetList) {
    typename list<T>::iterator iter = targetList.begin();
    while (iter != targetList.end()) {
        cout << *iter << " ";
        iter++;
    }
}

template <typename T>
void RunTestCase(list<T>& targetList, int testCaseNumber, T itemToFind) {
    cout << "Test Case #" << testCaseNumber << "." << endl;
    DisplayList<double>(targetList);
    cout << endl;
    int firstIndex = Find(targetList, itemToFind);
    if (firstIndex == targetList.size()) {
        cout << "The item " << itemToFind << " cannot be found in the list." << endl;
    }
    else {
        cout << "The item " << itemToFind << " first appears at index " << firstIndex << endl;
    }

    int itemCount = Count(targetList, itemToFind);

    cout << "The item " << itemToFind << " appears " << itemCount << " times in the list." << endl;

    Shuffle(targetList);

    cout << "The list after shuffling." << endl;

    DisplayList<double>(targetList);

    cout << endl;
    cout << endl;
}

int main() {
    // Test case 1, a double STL list with 8 elements { 5.5, 7.5, 4, 2, 60, 75.5, 4, 3 }
    double darr1[] = { 5.5, 7.5, 4, 2, 60, 75.5, 4, 3 };
    list<double> dlist(darr1, darr1 + 8);
    RunTestCase<double>(dlist, 1, 4);

    double darr2[] = { 1, 3, 2, 1, 5, 0.5, -3, 1, 9, 1 };
    list<double> dlist2(darr2, darr2 + 10);
    RunTestCase<double>(dlist2, 2, 1);

    double darr3[] = { -5, 4, 2.5, 6, 2, 13, 8, 9.9, 20, 26, 14, 3 };
    list<double> dlist3(darr3, darr3 + 12);
    RunTestCase<double>(dlist3, 3, -20);
}

/*
Sample output:
Test Case #1.
5.5 7.5 4 2 60 75.5 4 3 
The item 4 first appears at index 2
The item 4 appears 2 times in the list.
The list after shuffling.
7.5 5.5 2 4 75.5 60 3 4 

Test Case #2.
1 3 2 1 5 0.5 -3 1 9 1 
The item 1 first appears at index 0
The item 1 appears 4 times in the list.
The list after shuffling.
3 1 1 2 0.5 5 1 -3 1 9 

Test Case #3.
-5 4 2.5 6 2 13 8 9.9 20 26 14 3 
The item -20 cannot be found in the list.
The item -20 appears 0 times in the list.
The list after shuffling.
4 -5 6 2.5 13 2 9.9 8 26 20 3 14 

*/