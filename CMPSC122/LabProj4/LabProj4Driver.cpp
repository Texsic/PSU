// driver for cmpsc122 Lab 4 for complex number

#include "Complex.h"
#include <iostream>
using namespace std;

int main() {
   Complex c1(-3,8), c2(-15,-20), c3(5), c4;

   cout << "c1 = ";  c1.print(true); cout << endl;
   cout << "c2 = ";  c2.print(); cout << endl;
   cout << "c3 = ";  c3.print(); cout << endl;
   cout << "c4 = ";  c4.print(true); cout << endl << endl;

 
   c3 = c1.add(c2);  
   cout << "c3 = ";  c1.print(true);  cout << " + ";  c2.print(true);
   cout << " = ";  c3.print();  cout << endl << endl;

   c3 = c1.subtract(c2);
   cout << "c3 = ";  c1.print(true);  cout << " - ";  c2.print(true);
   cout << " = ";  c3.print();  cout << endl << endl;

   c3 = c1.multiply(c2);
   cout << "c3 = ";  c1.print(true);  cout << " x ";  c2.print(true);
   cout << " = ";  c3.print();  cout << endl << endl;

   c3 = c1.divide(c2);
   cout << "c3 = ";  c1.print(true);  cout << " / ";  c2.print(true);
   cout << " = ";  c3.print();  cout << endl << endl;

   c3 = c1.divide(c4);
   cout << "c3 = ";  c1.print(true);  cout << " / ";  c4.print(true);
   cout << " = undefine" << endl << endl;

   double modulus_c1 = c1.modulus();
   cout << "Modulus of c1 = " << modulus_c1 << endl << endl;

   bool is_equal = c1.equal(c2);
   cout << "c1 = ";  c1.print(); cout << endl;
   cout << "c2 = ";  c2.print(); cout << endl;
   cout << "c1 " << (is_equal ? "is" : "is not") << " equal to c2";
   cout << endl << endl;

   c2 = c1;
   is_equal = c1.equal(c2);
   cout << "c1 = ";  c1.print(); cout << endl;
   cout << "c2 = ";  c2.print(); cout << endl;
   cout << "c1 " << (is_equal ? "is" : "is not") << " equal to c2";
   cout << endl << endl;
   return 0;
}


/*
Your sample run output MUST be as shown below:

c3 = 5 + 0i
c4 = (0 + 0i)

c3 = (-3 + 8i) + (-15 - 20i) = -18 - 12i

c3 = (-3 + 8i) - (-15 - 20i) = 12 + 28i

c3 = (-3 + 8i) x (-15 - 20i) = 205 - 60i

c3 = (-3 + 8i) / (-15 - 20i) = -0.184 - 0.288i

DIVIDE BY ZERO ERROR!!!
c3 = (-3 + 8i) / (0 + 0i) = undefine

Modulus of c1 = 8.544

c1 = -3 + 8i
c2 = -15 - 20i
c1 is not equal to c2

c1 = -3 + 8i
c2 = -3 + 8i
c1 is equal to c2
*/