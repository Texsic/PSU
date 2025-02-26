#ifndef POINT_H
#define POINT_H

class Point {
public:
    Point();
    Point(double x, double y);
    double x() const;
    double y() const;

    double magnitude() const;
    void move(double dx, double dy);
    void print() const;

private:
    double _x, _y;
};

#endif
