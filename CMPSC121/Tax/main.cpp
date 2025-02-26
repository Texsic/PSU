#include <iostream>
using namespace std;
int main() {
double price = 4.35;
int intPrice = 100 * price;
// Should be 100 * 4.35 = 435
cout << intPrice << endl;
// Display 434! <- rounding error
return 0;
}