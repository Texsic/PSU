#include <iostream>
#include <iomanip>
#include "myMatrix.h"

using namespace std;

///////////////////////////////////////////////////////////////////////////////
// Functions that are already implemented by myself. Do not modify.
///////////////////////////////////////////////////////////////////////////////

void myMatrix::PrintMatrix(ostream& out) {
    int index = 0;
    for (unsigned i = 0; i < this->height; i++) {
        for (unsigned j = 0; j < this->width; j++) {
            out << setw(6) << this->myArrayPtr[index];
            index++;
        }
        out << endl;
    }
}

ostream& operator<<(ostream& out, myMatrix& matrix){
    matrix.PrintMatrix(out);
    return out;
}

unsigned myMatrix::GetHeight() {
    return this->height;
}

unsigned myMatrix::GetWidth() {
    return this->width;
}


void myMatrix::SetEntry(unsigned i, unsigned j, int valueToSet) {
    this->myArrayPtr[(i * this->width) + j] = valueToSet;
}


///////////////////////////////////////////////////////////////////////////////
// Implement required member functions below
///////////////////////////////////////////////////////////////////////////////

myMatrix::myMatrix() : height(1), width(1) {
    myArrayPtr = new int[1];
    myArrayPtr[0] = 0;
}

myMatrix::myMatrix(unsigned heightVal, unsigned widthVal, int* sourceArray) : height(heightVal), width(widthVal) {
    unsigned size = heightVal * widthVal;
    myArrayPtr = new int[size];
    for (unsigned i = 0; i < size; ++i) {
        myArrayPtr[i] = sourceArray[i];
    }
}

void myMatrix::Concatenate(myMatrix& matrixToConcatenate) {
    unsigned newWidth = this->width + matrixToConcatenate.width;
    unsigned newSize = this->height * newWidth;
    int* newArray = new int[newSize];

    for (unsigned i = 0; i < this->height; ++i) {
        for (unsigned j = 0; j < this->width; ++j) {
            newArray[i * newWidth + j] = this->myArrayPtr[i * this->width + j];
        }
        for (unsigned j = 0; j < matrixToConcatenate.width; ++j) {
            newArray[i * newWidth + this->width + j] = matrixToConcatenate.myArrayPtr[i * matrixToConcatenate.width + j];
        }
    }

    delete[] this->myArrayPtr;
    this->myArrayPtr = newArray;
    this->width = newWidth;
}

///////////////////////////////////////////////////////////////////////////////
// Implement the overloading function for += below
///////////////////////////////////////////////////////////////////////////////

myMatrix& myMatrix::operator+=(const myMatrix& rhs) {
    if (this->height != rhs.height || this->width != rhs.width) {
        throw invalid_argument("Matrices should have the same dimension to add.");
    }

    for (unsigned i = 0; i < this->height; ++i) {
        for (unsigned j = 0; j < this->width; ++j) {
            this->myArrayPtr[i * this->width + j] += rhs.myArrayPtr[i * rhs.width + j];
        }
    }

    return *this;
}

///////////////////////////////////////////////////////////////////////////////
// Implement the "big three" below
///////////////////////////////////////////////////////////////////////////////

myMatrix::myMatrix(const myMatrix& other) {
    height = other.height;
    width = other.width;
    unsigned size = height * width;
    myArrayPtr = new int[size];
    for (unsigned i = 0; i < size; ++i) {
        myArrayPtr[i] = other.myArrayPtr[i];
    }
}

myMatrix::~myMatrix() {
    delete[] myArrayPtr;
}

myMatrix& myMatrix::operator=(const myMatrix& other) {
    if (this != &other) {
        delete[] myArrayPtr;
        height = other.height;
        width = other.width;
        unsigned size = height * width;
        myArrayPtr = new int[size];
        for (unsigned i = 0; i < size; ++i) {
            myArrayPtr[i] = other.myArrayPtr[i];
        }
    }
    return *this;
}

/*
Sample Output:
The following shows a matrix created using the default constructor: 

     0


The following shows a matrix created using the second constructor: 

     2     3     4     5     6
     3     4     5     6     2
     1     3     5     7     9
     2     4     6     8    10


Trying to concatenate two matrices. Matrix A: 

     2     3     4     5     6
     3     4     5     6     2
     1     3     5     7     9
     2     4     6     8    10


Matrix B: 

     0     1
     1     0
     1     1
     0     0


After concatenating B to the left of A. A becomes: 

     2     3     4     5     6     0     1
     3     4     5     6     2     1     0
     1     3     5     7     9     1     1
     2     4     6     8    10     0     0


Testing the copy constructor.
The following shows a Matrix C, created from copying the Matrix B above: 

     0     1
     1     0
     1     1
     0     0


Now, we make some changes to matrix C. It becomes: 

     0     5
     1     0
     4     1
     0     0


We print matrix B in the following. Note if the implementation is correct, changing matrix C should not affact matrix B!

     0     1
     1     0
     1     1
     0     0


Testing the assignment operator.
The following shows a Matrix D, which is assigned with the Matrix B above: 

     0     1
     1     0
     1     1
     0     0


Now, we make some changes to matrix D. It becomes: 

     0     1
     1    10
     1     1
    28     0


We print matrix B in the following. Note if the implementation is correct, changing matrix D should not affact matrix B!

     0     1
     1     0
     1     1
     0     0


Adding matrix D to matrix B using the += operator.
After this, the matrix B becomes:
     0     2
     2    10
     2     2
    28     0

*/