#ifndef CIRCLE_H
#define CIRCLE_H

#include "Point.h"

class Circle
{
public:
    Circle(Point cp, double r);
    double getArea();
    void moveCircle(double dx, double dy);
    bool isItOrigin();
    double getRadius();
    Point getPoint();
    Point getCenter();
    void display() const;

private:
    Point center;
    double radius;
};

#endif
