#include "Complex.h"
#include <iostream>
#include <cmath>
#include <iomanip>

// default constructor: parameters are real and imaginary parts respectively
Complex::Complex(double re, double im)
{
    this->re = re;
    this->im = im;
}

Complex Complex::add(const Complex &z)
{
    Complex c;
    c.re = re + z.re;
    c.im = im + z.im;
    return c;
}


Complex Complex::subtract(const Complex &z)
{
    Complex c;
    c.re = re - z.re;
    c.im = im - z.im;
    return c;
}


Complex Complex::multiply(const Complex &z)
{
    Complex c;
    c.re = (re * z.re) - (im * z.im);
    c.im = (re * z.im) + (im * z.re);
    return c;
}


Complex Complex::divide(const Complex &z)
{
    Complex c;
    double denominator = z.re * z.re + z.im * z.im;
    c.re = (re * z.re + im * z.im) / denominator;
    c.im = (im * z.re - re * z.im) / denominator;
    return c;
}


bool Complex::equal(const Complex &z)
{
    return (re == z.re) && (im == z.im);
}

double Complex::modulus()
{
    return sqrt(re * re + im * im);
}


void Complex::print(bool is_parenthesis)
{
    std::cout << std::fixed << std::setprecision(2);
    if (is_parenthesis)
        std::cout << "(" << re << " + " << im << "i)";
    else {
        if (im >= 0)
            std::cout << re << " + " << im << "i";
        else
            std::cout << re << " - " << -im << "i";
    }
}

/*
Sample output:
c1 = (-3.00 + 8.00i)
c2 = -15.00 - 20.00i
c3 = 5.00 + 0.00i
c4 = (0.00 + 0.00i)

c3 = (-3.00 + 8.00i) + (-15.00 + -20.00i) = -18.00 - 12.00i

c3 = (-3.00 + 8.00i) - (-15.00 + -20.00i) = 12.00 + 28.00i

c3 = (-3.00 + 8.00i) x (-15.00 + -20.00i) = 205.00 - 60.00i

c3 = (-3.00 + 8.00i) / (-15.00 + -20.00i) = -0.18 - 0.29i

c3 = (-3.00 + 8.00i) / (0.00 + 0.00i) = undefine

Modulus of c1 = 8.54

c1 = -3.00 + 8.00i
c2 = -15.00 - 20.00i
c1 is not equal to c2

c1 = -3.00 + 8.00i
c2 = -3.00 + 8.00i
c1 is equal to c2



*/