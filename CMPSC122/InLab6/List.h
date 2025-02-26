#include <iostream>

using namespace std;

typedef int ElementType; // Now "ElementType" is "int"
                         //can change int to double,char,...

class List {
public:
    List(ElementType *array, int arraySize, int capacity); // Constructor
    List(int maxSize = 1024);  // Constructor

    // Big Three:
    ~List(); // Destructor
    List(const List &orig); // Copy Constructor
    List &operator=(const List &orig); // Assignment operator

    unsigned size() const;
    bool empty() const; // check if empty
    void insert(ElementType item, int pos);
    void erase(int pos); 
    void display(ostream &out) const;
    ElementType get(unsigned pos) const;
    int getCapacity();
    void ExpandCapacity(int sizeToExpand);
    void TryShrink();
private:
    int mySize;      
    int myCapacity;
    ElementType *myArrayPtr; 
};
