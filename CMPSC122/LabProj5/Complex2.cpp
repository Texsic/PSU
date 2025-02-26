#include "Complex2.h"

Complex::Complex(double re, double im) {
    this->re = re;
    this->im = im;
}


Complex Complex::operator+(const Complex & z) const {
    return Complex(this->re + z.re, this->im + z.im);
}


Complex Complex::operator-(const Complex & z) const {
    return Complex(this->re - z.re, this->im - z.im);
}


Complex Complex::operator*(const Complex & z) const {
    double real = (this->re * z.re) - (this->im * z.im);
    double imag = (this->re * z.im) + (this->im * z.re);
    return Complex(real, imag);
}


Complex Complex::operator/(const Complex & z) const {
    if (z.re == 0 && z.im == 0) {
        cout << "DIVIDE BY ZERO ERROR!!!" << endl;

        return Complex();
    }
    double denominator = z.re * z.re + z.im * z.im;
    double real = (this->re * z.re + this->im * z.im) / denominator;
    double imag = (this->im * z.re - this->re * z.im) / denominator;
    return Complex(real, imag);
}

bool Complex::operator==(const Complex & z) const {
    return (this->re == z.re) && (this->im == z.im);
}

bool Complex::operator!=(const Complex & z) const {
    return !(*this == z);
}

ostream & operator<<(ostream & os, const Complex & z) {
    os << "(" << z.re << " + " << z.im << "i)";
    return os;
}

/*
Sample Output:
(7 + 3i) + (1 + -2i) = (8 + 1i)
(7 + 3i) - (1 + -2i) = (6 + 5i)
(7 + 3i) * (1 + -2i) = (13 + -11i)
(7 + 3i) / (1 + -2i) = (0.2 + 3.4i)
(7 + 3i) / (0 + 0i) = DIVIDE BY ZERO ERROR!!!
(7 + 3i) == (7 + 3i) is equal 
(7 + 3i) == (1 + -2i) is not equal
(7 + 3i) != (7 + 3i) is false
(7 + 3i) != (1 + -2i) is true

(7 + 3i) + (7 + 3i) / (1 + -2i) - (1 + -2i) * (7 + 3i) = (-5.8 + 17.4i)

*/