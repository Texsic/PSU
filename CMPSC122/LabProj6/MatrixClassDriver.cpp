#include <iostream>
#include "myMatrix.h"

using namespace std;

int main() {
	// Test creating a matrix using the default constructor
	myMatrix mat1;
	cout << "The following shows a matrix created using the default constructor: " << endl << endl;
	cout << mat1 << endl << endl;

	// Test creating a matrix using the second constructor
	int sourceArrayA[] = {
		2, 3, 4, 5, 6,
		3, 4, 5, 6, 2,
		1, 3, 5, 7, 9,
		2, 4, 6, 8, 10
	};
	myMatrix matA(4, 5, sourceArrayA);
	cout << "The following shows a matrix created using the second constructor: " << endl << endl;
	cout << matA << endl << endl;

	// Test concatenating a matrix
	int sourceArrayB[] = {
	   0, 1,
	   1, 0,
	   1, 1,
	   0, 0,
	};
	myMatrix matB(4, 2, sourceArrayB);
	cout << "Trying to concatenate two matrices. Matrix A: " << endl << endl;
	cout << matA << endl << endl;
	cout << "Matrix B: " << endl << endl;
	cout << matB << endl << endl;

	matA.Concatenate(matB);

	cout << "After concatenating B to the left of A. A becomes: " << endl << endl;
	cout << matA << endl << endl;

	cout << "Testing the copy constructor." << endl;
	cout << "The following shows a Matrix C, created from copying the Matrix B above: " << endl << endl;
	myMatrix matC(matB);
	cout << matC << endl << endl;

	cout << "Now, we make some changes to matrix C. It becomes: " << endl << endl;
	matC.SetEntry(0, 1, 5);
	matC.SetEntry(2, 0, 4);
	cout << matC << endl << endl;

	cout << "We print matrix B in the following. Note if the implementation is correct, changing matrix C should not affact matrix B!" << endl << endl;
	cout << matB << endl << endl;

	cout << "Testing the assignment operator." << endl;
	cout << "The following shows a Matrix D, which is assigned with the Matrix B above: " << endl << endl;
	myMatrix matD;
	matD = matB;
	cout << matD << endl << endl;

	cout << "Now, we make some changes to matrix D. It becomes: " << endl << endl;
	matD.SetEntry(1, 1, 10);
	matD.SetEntry(3, 0, 28);
	cout << matD << endl << endl;

	cout << "We print matrix B in the following. Note if the implementation is correct, changing matrix D should not affact matrix B!" << endl << endl;
	cout << matB << endl << endl;

	cout << "Adding matrix D to matrix B using the += operator." << endl;
	cout << "After this, the matrix B becomes:" << endl;
	matB += matD;
	cout << matB << endl << endl;
}