#include <iostream>
#include "timer.h"
using namespace std;

long long countPaths(int north, int east) {
    long long dp[north + 1][east + 1];

    for (int i = 0; i <= north; ++i)
        dp[i][0] = 1;
    for (int j = 0; j <= east; ++j)
        dp[0][j] = 1;

    for (int i = 1; i <= north; ++i) {
        for (int j = 1; j <= east; ++j) {
            dp[i][j] = dp[i - 1][j] + dp[i][j - 1];
        }
    }

    return dp[north][east];
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

        long long paths = countPaths(north, east);

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
  Elapsed Time: 0.001s
There are 9657700 northeast paths between A and B.
Enter y or Y to continue the next example or any other letter to exit: y
How many points north of A is B? 16
How many points east of A is B? 16
  Process Timer
  -------------------------------
  Elapsed Time: 0.001s
There are 601080390 northeast paths between A and B.
Enter y or Y to continue the next example or any other letter to exit: n
*/