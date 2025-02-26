#include <iostream>
#include "Circle.h"

int main() {
    Point p(3.5, 4.0);
    Circle c(p, 6.0);

    std::cout << "The Circle Area is: " << c.getArea() << std::endl;
  
    c.display();
  
    std::cout << std::endl;

    c.moveCircle(1.0, -1.0);
  
    c.display();
  
    std::cout << std::endl;

    std::cout << "Is the circle at the origin? " << (c.isItOrigin() ? "Yes" : "No") << std::endl;

    std::cout << "The Circle Radius is: " << c.getRadius() << std::endl;
  
    Point center = c.getCenter();
  
    std::cout << "Circle Center: (" << center.x() << ", " << center.y() << ")" << std::endl;

    return 0;
}

/*
Sample output:
The Circle Area is: 113.04
[(3.5, 4), 6]
[(4.5, 3), 6]
Is the circle at the origin? No
The Circle Radius is: 6
Circle Center: (4.5, 3)



*/