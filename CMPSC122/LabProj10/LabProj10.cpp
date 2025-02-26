#include <iostream>
#include "timer.h"
using namespace std;

int countPaths(int north, int east) {
  
    if (north == 0 || east == 0)
        return 1;

    return countPaths(north - 1, east) + countPaths(north, east - 1);
}

int main() {
    char choice;
    do {
        int north, east;
        cout << "How many points north of A is B? ";
        cin >> north;
        cout << "How many points east of A is B? ";
        cin >> east;

        Timer t;
        t.start();

        int paths = countPaths(north, east);

        t.stop();
        t.show();

        cout << "There are " << paths << " northeast paths between A and B." << endl;

        cout << "Enter y or Y to continue the next example or any other letter to exit: ";
        cin >> choice;
    } while (choice == 'y' || choice == 'Y');

    return 0;
}

/*
Sample Output:
How many points north of A is B? 2
How many points east of A is B? 3
  Process Timer
  -------------------------------
  Elapsed Time: 0.001s
There are 10 northeast paths between A and B.
Enter y or Y to continue the next example or any other letter to exit: y
How many points north of A is B? 12
How many points east of A is B? 14
  Process Timer
  -------------------------------
  Elapsed Time: 0.040388s
There are 9657700 northeast paths between A and B.
Enter y or Y to continue the next example or any other letter to exit: y
How many points north of A is B? 16
How many points east of A is B? 16
  Process Timer
  -------------------------------
  Elapsed Time: 2.79283s
There are 601080390 northeast paths between A and B.
Enter y or Y to continue the next example or any other letter to exit: n
*/