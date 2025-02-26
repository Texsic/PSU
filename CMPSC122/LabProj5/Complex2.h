#ifndef COMPLEX2_H
#define COMPLEX2_H

#include <iostream>
using namespace std;

class Complex {
public:
    Complex(double re = 0.0, double im = 0.0); 
    Complex operator+(const Complex & z) const;
    Complex operator-(const Complex & z) const;
    Complex operator*(const Complex & z) const;
    Complex operator/(const Complex & z) const;
    bool operator==(const Complex & z) const;
    bool operator!=(const Complex & z) const; 
    friend ostream & operator<<(ostream & os, const Complex & z);

private:
    double re;
    double im;
};

#endif
