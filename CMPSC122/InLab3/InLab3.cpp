#include <iostream>

using namespace std;

int* append(int* arrayA, int sizeA, int* arrayB, int sizeB)
{
    int* newArray = new int[sizeA + sizeB];
    
    for (int i = 0; i < sizeA; ++i) {
        newArray[i] = arrayA[i];
    }

    for (int i = 0; i < sizeB; ++i) {
        newArray[sizeA + i] = arrayB[i];
    }

    return newArray;
}

int* merge(int* arrayA, int sizeA, int* arrayB, int sizeB)
{
    int* mergedArray = new int[sizeA + sizeB];
    int i = 0, j = 0, k = 0;

    while (i < sizeA && j < sizeB) {
        if (arrayA[i] < arrayB[j]) {
            mergedArray[k++] = arrayA[i++];
        } else {
            mergedArray[k++] = arrayB[j++];
        }
    }

    while (i < sizeA) {
        mergedArray[k++] = arrayA[i++];
    }

    while (j < sizeB) {
        mergedArray[k++] = arrayB[j++];
    }

    return mergedArray;
}

void print(int* array, int size, const char* label)
{
    cout << label;
    for (int i = 0; i < size; ++i) {
        cout << array[i] << " ";
    }
    cout << endl;
}

int main()
{
    int arrayA[] = {11, 33, 55, 77, 99};
    int arrayB[] = {22, 44, 66, 88};

    print(arrayA, 5, "Sorted array A: ");
    print(arrayB, 4, "Sorted array B: ");

    int* arrayC = append(arrayA, 5, arrayB, 4);
    print(arrayC, 9, "Append B to A:  ");
    delete[] arrayC;

    int* arrayD = merge(arrayA, 5, arrayB, 4);
    print(arrayD, 9, "Merge A to B:   ");
    delete[] arrayD;

#ifdef _WIN32
#if (_MSC_VER <= 1916)
    system("pause");
#endif
#endif

    return 0;
}

/*
Sample Output:
Sorted array A: 11 33 55 77 99 
Sorted array B: 22 44 66 88 
Append B to A:  11 33 55 77 99 22 44 66 88 
Merge A to B:   11 22 33 44 55 66 77 88 99
*/