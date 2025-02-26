#include <iostream>
#include <cstring>

// You need to create LabProj3.h and write the prototypes of the two functions in it
#include "LabProj3.h"

using namespace std;


// functions to test your program, DO NOT modify
void testFind(const char* targetStr, const char* subStr)
{
	int res = myFind(targetStr, subStr);
	if (res <= 0) {
		cout << "String " << "\"" << subStr << "\"" << " does not appear in string "
			<< "\"" << targetStr << "\"" << endl;
	}
	else {
		cout << "String " << "\"" << subStr << "\"" << " found in string "
			<< "\"" << targetStr << "\"" << " at " << res << "locations" << endl;
	}
}

// functions to test your program, DO NOT modify
void testImproveFormat(char* targetStr)
{
	cout << "The string before improving the format: " << targetStr << endl;
	improveFormat(targetStr);
	cout << "The string before format improvement: " << targetStr << endl;
	cout << endl;
}


int main()
{
	testFind("abbbfd", "abc");
	testFind("Begining", "in");
	testFind("MyComputer", "put");
	testFind("Download", "o");
	testFind("friendship", "ind");

	char str1[] = "Ode     to            Joy";
	testImproveFormat(str1);

	char str2[] = "Welcome   to   my    class!";
	testImproveFormat(str2);

	char str3[] = "Remove  the redundant blank    spaces   in this          string.";
	testImproveFormat(str3);
}

