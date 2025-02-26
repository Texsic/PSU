
/******************************************************************************
 CMPSC122 LabProj12: Project Algorithm Analysis
 ******************************************************************************/

#include <iostream>
#include <iomanip>
#include <cstring>
#include <cstdlib>
#include <fstream>
#include "timer.h"
#include "MaxSubList.h"

const int FROM_SIZE = 500;
const int MUL = 2;

using namespace std;

void Ouput_CSV_File(string filename, Timer* T, int loop);

int main()
{
    int* Result, * Vec;
    Timer* T, Prepare;
    int loop;

    cout << "Please enter the number of loops: ";
    cin >> loop;

    Prepare.start();
    int Size = FROM_SIZE;      

    T = new Timer[loop];
    Result = new int[loop];
    cout << setprecision(4) << fixed << endl;
    cout << string(28, '=') << " Algorithm Red " << string(28, '=') << endl << endl;
    for (int i = 0; i < loop; i++)
    {
        Vec = new int[Size];
        srand((unsigned)time(NULL));

        for (int j = 0; j < Size; j++)
            Vec[j] = rand() % 101 - 50;

        Result[i] = 0;
        Prepare.stop();
        cout << "Preparation Time: " << Prepare.get_elapsedtime() << "s" << endl;

        T[i].start();
        //Result[i] = MaxSublistSum_Blue(Vec, Size);
        //Result[i] = MaxSublistSum_Green(Vec, Size);
        Result[i] = MaxSublistSum_Red(Vec, Size);
        T[i].stop();

        cout << '[' << setw(2) << i << ']' << setw(50) << "Maximum contiguous subsequence sum (array size = "
            << setw(9) << Size << "): " << setw(6) << Result[i] << endl;
        cout << "Elapsed Time: " << T[i].get_elapsedtime() << 's' << endl;
        cout << string(72, '-') << endl;

        Size = MUL * Size;
        delete[] Vec;
    }
    cout << endl << endl;

    Ouput_CSV_File("Result(Red).csv", T, loop);
}


void Ouput_CSV_File(string filename, Timer* T, int loop)
{
    ofstream csvOutFile(filename);

    if (!csvOutFile)
    {
        cerr << "Failed to open output file: " << filename << endl;
        exit(EXIT_FAILURE);
    }
    int Size = FROM_SIZE;
    csvOutFile << "\"Array Size\",\"Run Time (s)\"" << endl;
    for (int i = 0; i < loop; i++)
    {
        csvOutFile << Size << "," << T[i].get_elapsedtime() << endl;
        Size = MUL * Size;
    }
    csvOutFile.close();
}

/*
Please enter the number of loops: 9

============================ Algorithm Blue ============================

Preparation Time: 0.0010s
[ 0] Maximum contiguous subsequence sum (array size =       500):    781
Elapsed Time: 0.0010s
------------------------------------------------------------------------
Preparation Time: 0.0010s
[ 1] Maximum contiguous subsequence sum (array size =      1000):   1816
Elapsed Time: 0.0010s
------------------------------------------------------------------------
Preparation Time: 0.0012s
[ 2] Maximum contiguous subsequence sum (array size =      2000):   1816
Elapsed Time: 0.0023s
------------------------------------------------------------------------
Preparation Time: 0.0038s
[ 3] Maximum contiguous subsequence sum (array size =      4000):   2034
Elapsed Time: 0.0071s
------------------------------------------------------------------------
Preparation Time: 0.0112s
[ 4] Maximum contiguous subsequence sum (array size =      8000):   2424
Elapsed Time: 0.0297s
------------------------------------------------------------------------
Preparation Time: 0.0415s
[ 5] Maximum contiguous subsequence sum (array size =     16000):   2681
Elapsed Time: 0.1131s
------------------------------------------------------------------------
Preparation Time: 0.1556s
[ 6] Maximum contiguous subsequence sum (array size =     32000):   3423
Elapsed Time: 0.4607s
------------------------------------------------------------------------
Preparation Time: 0.6182s
[ 7] Maximum contiguous subsequence sum (array size =     64000):  13044
Elapsed Time: 1.9054s
------------------------------------------------------------------------
Preparation Time: 2.5274s
[ 8] Maximum contiguous subsequence sum (array size =    128000):  20028
Elapsed Time: 8.0977s
------------------------------------------------------------------------

  Please enter the number of loops: 9

  ============================ Algorithm Green ============================

  Preparation Time: 0.0010s
  [ 0] Maximum contiguous subsequence sum (array size =       500):   1278
  Elapsed Time: 0.0010s
  ------------------------------------------------------------------------
  Preparation Time: 0.0010s
  [ 1] Maximum contiguous subsequence sum (array size =      1000):   1777
  Elapsed Time: 0.0010s
  ------------------------------------------------------------------------
  Preparation Time: 0.0010s
  [ 2] Maximum contiguous subsequence sum (array size =      2000):   1777
  Elapsed Time: 0.0010s
  ------------------------------------------------------------------------
  Preparation Time: 0.0010s
  [ 3] Maximum contiguous subsequence sum (array size =      4000):   3920
  Elapsed Time: 0.0010s
  ------------------------------------------------------------------------
  Preparation Time: 0.0010s
  [ 4] Maximum contiguous subsequence sum (array size =      8000):   4053
  Elapsed Time: 0.0010s
  ------------------------------------------------------------------------
  Preparation Time: 0.0019s
  [ 5] Maximum contiguous subsequence sum (array size =     16000):   4053
  Elapsed Time: 0.0010s
  ------------------------------------------------------------------------
  Preparation Time: 0.0036s
  [ 6] Maximum contiguous subsequence sum (array size =     32000):   5831
  Elapsed Time: 0.0010s
  ------------------------------------------------------------------------
  Preparation Time: 0.0069s
  [ 7] Maximum contiguous subsequence sum (array size =     64000):  11737
  Elapsed Time: 0.0020s
  ------------------------------------------------------------------------
  Preparation Time: 0.0129s
  [ 8] Maximum contiguous subsequence sum (array size =    128000):  11737
  Elapsed Time: 0.0038s
  ------------------------------------------------------------------------


  Please enter the number of loops: 9

  ============================ Algorithm Red ============================

  Preparation Time: 0.0010s
  [ 0] Maximum contiguous subsequence sum (array size =       500):    747
  Elapsed Time: 0.0010s
  ------------------------------------------------------------------------
  Preparation Time: 0.0010s
  [ 1] Maximum contiguous subsequence sum (array size =      1000):    790
  Elapsed Time: 0.0010s
  ------------------------------------------------------------------------
  Preparation Time: 0.0010s
  [ 2] Maximum contiguous subsequence sum (array size =      2000):    824
  Elapsed Time: 0.0010s
  ------------------------------------------------------------------------
  Preparation Time: 0.0010s
  [ 3] Maximum contiguous subsequence sum (array size =      4000):   3367
  Elapsed Time: 0.0010s
  ------------------------------------------------------------------------
  Preparation Time: 0.0010s
  [ 4] Maximum contiguous subsequence sum (array size =      8000):   3971
  Elapsed Time: 0.0010s
  ------------------------------------------------------------------------
  Preparation Time: 0.0013s
  [ 5] Maximum contiguous subsequence sum (array size =     16000):   4825
  Elapsed Time: 0.0010s
  ------------------------------------------------------------------------
  Preparation Time: 0.0025s
  [ 6] Maximum contiguous subsequence sum (array size =     32000):   6315
  Elapsed Time: 0.0010s
  ------------------------------------------------------------------------
  Preparation Time: 0.0043s
  [ 7] Maximum contiguous subsequence sum (array size =     64000):   6315
  Elapsed Time: 0.0010s
  ------------------------------------------------------------------------
  Preparation Time: 0.0078s
  [ 8] Maximum contiguous subsequence sum (array size =    128000):   7676
  Elapsed Time: 0.0010s
  ------------------------------------------------------------------------

Result(Blue).csv:

"Array Size","Run Time (s)"
500,0.001
1000,0.001
2000,0.002336
4000,0.007092
8000,0.029731
16000,0.113116
32000,0.460704
64000,1.90536
128000,8.09772

"Array Size","Run Time (s)"
500,0.001
1000,0.001
2000,0.001
4000,0.001
8000,0.001
16000,0.001
32000,0.001028
64000,0.002036
128000,0.00384

"Array Size","Run Time (s)"
500,0.001
1000,0.001
2000,0.001
4000,0.001
8000,0.001
16000,0.001
32000,0.001
64000,0.001
128000,0.001
256000,0.001
512000,0.001
*/