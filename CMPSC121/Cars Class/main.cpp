#include <iostream>
#include <string>

using namespace std;

class Car {
private:
    string make;
    string model;
    int year;

public:
    Car(const string &mk, const string &mdl, int yr) :make(mk), model(mdl), year(yr) {
        
    }

    string getMake() const { return make; }
    string getModel() const { return model; }
    int getYear() const { return year; }

    void setMake(const string &mk) { make = mk; }
    void setModel(const string &mdl) { model = mdl; }
    void setYear(int yr) { year = yr; }

    void displayInfo() const {
        cout << "Make: " << make << "\nModel: " << model << "\nYear: " << year << endl;
    }
};

class Audi : public Car {
public: 
    Audi (const string mdl, int yr) : Car("Audi", mdl, yr) {
        
    }
};

int main() {
    Car exampleCar("Mercedes", "c63", 2015);
    exampleCar.displayInfo();
    cout << endl;
    Audi exampleAudi("I8", 2020);
    exampleAudi.displayInfo();
    
    return 0;
}