#include <iostream>
#include "Point.h"
using namespace std;

int main() {
    Point p0;
    Point p1(7, -3);
    Point p2 = p1;
    p0 = p1;

    cout << "p0.x() = " << p0.x() << "\n";
    cout << "p0.y() = " << p0.y() << "\n";

    cout << "p1 magnitude: " << p1.magnitude() << "\n";
    p1.move(4, 7);
    p2.print();
    cout << "p1 after moving: ";
    p1.print();
    cout << "\n";
}

/*
p0.x() = 7
p0.y() = -3
p1 magnitude: 7.61577
(7, -3)p1 after moving: (11, 4)
*/
