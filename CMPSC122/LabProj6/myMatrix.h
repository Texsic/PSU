#pragma once

#include <iostream>

using namespace std;

class myMatrix {
public:
    myMatrix();

    myMatrix(unsigned heightVal, unsigned widthVal, int* sourceArray);

    void Concatenate(myMatrix& matrixToConcatenate);

    myMatrix& operator+=(const myMatrix& rhs);

    myMatrix(const myMatrix& other);

    ~myMatrix();

    myMatrix& operator=(const myMatrix& other);

    unsigned GetHeight();
    unsigned GetWidth();
    void PrintMatrix(ostream& out);
    void SetEntry(unsigned i, unsigned j, int valueToSet);

private:
    unsigned height;
    unsigned width;
    int* myArrayPtr;
};

ostream& operator<<(ostream& out, myMatrix& matrix);
