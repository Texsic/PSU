#include "Time.h"
#include <string>
#include <iostream>
using namespace std;

void Time::Set(unsigned hours, unsigned minutes, char am_pm)
{
    if (hours >= 1 && hours <= 12 && minutes >= 0 && minutes <= 59 &&
        (am_pm == 'A' || am_pm == 'P'))
    {
        myHours = hours;
        myMinutes = minutes;
        myAMorPM = am_pm;
    }
    else
        cerr << "*** Can't set these values ***\n";
}

void Time::Display()
{
    string minStr = (myMinutes < 10) ? "0" + to_string(myMinutes) : to_string(myMinutes);
    cout << myHours << ':' << minStr << ' ' << myAMorPM << ".M." << endl;
}

unsigned Time::getHours() {
    return myHours;
}

unsigned Time::getMinutes() {
    return myMinutes;
}

char Time::getAMorPM() {
    return myAMorPM;
}

void Time::Forward(int minutes)
{
    int totalMinutes = myMinutes + minutes;
    myMinutes = totalMinutes % 60;
    int hoursAdded = totalMinutes / 60;
    int nowHours = myHours + hoursAdded;
    int FlipAmPm = ((nowHours / 12) - (myHours / 12)) % 2;
    if (FlipAmPm == 1) {
        if (myAMorPM == 'A') {
            myAMorPM = 'P';
        }
        else {
            myAMorPM = 'A';
        }
    }
    myHours = nowHours % 12;
    if (myHours == 0) {
        myHours = 12;
    }
}

Time::Time() {
    myHours = 12;
    myMinutes = 0;
    myAMorPM = 'A';
}

Time::Time(unsigned hours, unsigned minutes, char am_pm) {
    if (hours >= 1 && hours <= 12 && minutes >= 0 && minutes <= 59 &&
        (am_pm == 'A' || am_pm == 'P'))
    {
        myHours = hours;
        myMinutes = minutes;
        myAMorPM = am_pm;
    }
    else
    {
        cerr << "*** Can't set these values ***\n";
        Time(); // Set to 12:00AM
    }
}

// Overloaded + operator
Time Time::operator+(int minutes) const {
    Time result = *this;  // Make a copy of the current object
    result.Forward(minutes); // Forward the time by the specified minutes
    return result;  // Return the new Time object
}

// Overloaded += operator
Time& Time::operator+=(int minutes) {
    this->Forward(minutes); // Forward the time by the specified minutes
    return *this;  // Return a reference to the modified Time object
}

// Overloaded = operator
Time& Time::operator=(const string& timeStr) {
    if (timeStr.length() != 5) {
        cerr << "*** Invalid time string format ***\n";
        return *this;
    }

    unsigned hours = stoi(timeStr.substr(0, 2));
    unsigned minutes = stoi(timeStr.substr(2, 2));
    char am_pm = timeStr[4];

    if ((hours >= 1 && hours <= 12) && (minutes >= 0 && minutes <= 59) &&
        (am_pm == 'A' || am_pm == 'P'))
    {
        myHours = hours;
        myMinutes = minutes;
        myAMorPM = am_pm;
    }
    else {
        cerr << "*** Invalid time string format ***\n";
    }

    return *this;
}

/*
Sample Output:
Time object nowTime is now 11:30 P.M.

Forward 20 Minutes.
Time object nowTime is now 11:50 P.M.

Forward 20 Minutes.
Time object nowTime is now 12:10 A.M.

Forward 500 Minutes.
Time object nowTime is now 8:30 A.M.

Forward 330 Minutes.
Time object nowTime is now 2:00 P.M.

Create a testTime object, which forwards nowTime by 30 Minutes. (Testing the + operator.)
Time object testTime is now 2:30 P.M.

Time object nowTime is now 2:00 P.M.

nowTime should NOT be changed from the + operator.

Assigning string "0840A" to nowTime.
Time object nowTime is now 8:40 A.M.

Assigning string "1200P" to nowTime.
Time object nowTime is now 12:00 P.M.
*/