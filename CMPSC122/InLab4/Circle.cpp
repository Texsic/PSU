#include "Circle.h"
#include <iostream>
#include <cmath>

Circle::Circle(Point cp, double r) : center(cp), radius(r) {}

double Circle::getArea() {
    return 3.14 * radius * radius;
}

void Circle::moveCircle(double dx, double dy) {
    center.move(dx, dy);
}

bool Circle::isItOrigin() {
    return center.x() == 0 && center.y() == 0;
}

double Circle::getRadius() {
    return radius;
}

Point Circle::getCenter() {
    return center;
}

void Circle::display() const {
    std::cout << "[" << "(" << center.x() << ", " << center.y() << "), " << radius << "]";
}
