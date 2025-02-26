#pragma once
#include <iostream>
using namespace std;

class Time {
public:
    // Constructors
    Time();
    Time(unsigned hours, unsigned minutes, char am_pm);

    // Functions to get the values of member
    unsigned getHours();    // Return the hour number
    unsigned getMinutes();  // Return the minute number
    char getAMorPM();       // Return the AM PM value

    // Set, Display as discussed in class
    void Set(unsigned hours, unsigned minutes, char am_pm);  // Set the time
    void Display();  // Display the time

    // A convenient forward function
    void Forward(int minutes);  // Forward the time

    // Overloaded operators
    Time operator+(int minutes) const;
    Time& operator+=(int minutes);
    Time& operator=(const string& timeStr);

private:
    unsigned myHours, myMinutes;
    char myAMorPM;
};
