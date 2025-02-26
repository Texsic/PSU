#include "LabProj3.h"
#include <iostream>
#include <cstring>


int myFind(const char* targetStr, const char* subStr) {
    int targetLen = strlen(targetStr);
    int subLen = strlen(subStr);

    int count = 0;

    for (int i = 0; i <= targetLen - subLen; ++i) {
        if (strncmp(targetStr + i, subStr, subLen) == 0) {
            count++;
        }
    }

    return count;
}


void improveFormat(char* targetStr) {
    int len = strlen(targetStr);

    char improvedStr[len + 1];
    int index = 0;

    bool prevSpace = false;

    for (int i = 0; i < len; ++i) {
        if (targetStr[i] != ' ') {
            improvedStr[index++] = targetStr[i];
            prevSpace = false;
        } else {
  
            if (!prevSpace) {
                improvedStr[index++] = ' ';
                prevSpace = true;
            }
        }
    }

    improvedStr[index] = '\0';

    strcpy(targetStr, improvedStr);
}

/*
Sample:
String "abc" does not appear in string "abbbfd"
String "in" found in string "Begining" at 2locations
String "put" found in string "MyComputer" at 1locations
String "o" found in string "Download" at 2locations
String "ind" does not appear in string "friendship"
The string before improving the format: Ode   to      Joy
The string before format improvement: Ode to Joy

The string before improving the format: Welcome     to  my   class!
The string before format improvement: Welcome to my class!

The string before improving the format: Remove    the redundant blank    spaces in     this string.
The string before format improvement: Remove the redundant blank spaces in this string.

*/