#include <iostream>
using namespace std;

// makeChange function prototype 
void makeChange(int, int &, int &, int &, int &, int &);

/************************* Main Program **************************/
int main()
{
    int cents, dollars, quarters, dimes, nickels, pennies;
    cout << "How much change to make (in cents): ";
    cin >> cents;
    makeChange(cents, dollars, quarters, dimes, nickels, pennies);
    cout << "Your change is:" << endl
         << dollars << " dollar(s)" << endl
         << quarters << " quarter(s)" << endl
         << dimes << " dime(s)" << endl
         << nickels << " nickel(s)" << endl
         << pennies << " pennie(s)" << endl;

#ifdef _WIN32			// _WIN32 is used by Visual C++
#if (_MSC_VER <= 1916)	// check if it Visual Studio 2017 or earlier
  system("pause");
#endif
#endif
    return 0;
}
/*************************** End of Main *************************/

void makeChange(int amount, int &dollars, int &quarters, int &dimes, int &nickels, int &pennies)
{
    dollars = amount / 100; 
    amount %= 100;

    quarters = amount / 25;  
    amount %= 25;

    dimes = amount / 10;
    amount %= 10;

    nickels = amount / 5;
    amount %= 5;

    pennies = amount;
}

/*
Sample Output:
How much change to make (in cents): 1292
Your change is:
12 dollar(s)
3 quarter(s)
1 dime(s)
1 nickel(s)
2 pennie(s)
*/