#include <iostream>

using namespace std;

template <typename T>
class Node {
public:
    T data;
    Node<T>* next;
};

template <typename T>
void insert(Node<T>*& first, int position, T data) {
    if (position < 0)
        return; 

    Node<T>* newNode = new Node<T>;
    newNode->data = data;
    newNode->next = nullptr;

    if (position == 0) {
        newNode->next = first;
        first = newNode;
        return;
    }

    Node<T>* current = first;
    for (int i = 0; i < position - 1 && current != nullptr; ++i) {
        current = current->next;
    }

    if (current == nullptr)
        return;

    newNode->next = current->next;
    current->next = newNode;
}

template <typename T>
void display(Node<T>* first) {
    Node<T>* cur = first;
    while (cur != nullptr) {
        cout << (cur->data) << " ";
        cur = cur->next;
    }
    cout << endl;
}

int main() {
    Node<int>* ifirst = nullptr;
    insert<int>(ifirst, 0, 5);
    insert<int>(ifirst, 0, 6);
    insert<int>(ifirst, 0, 7);
    insert<int>(ifirst, 1, 8);
    insert<int>(ifirst, 4, 100);
    cout << "A Linked List of Integers: " << endl;
    display<int>(ifirst);

    Node<double>* dfirst = nullptr;
    insert<double>(dfirst, 0, 5.4);
    insert<double>(dfirst, 0, 23.4);
    insert<double>(dfirst, 0, 7.253);
    insert<double>(dfirst, 1, 100.45);
    insert<double>(dfirst, 4, 15.84);
    cout << "A Linked List of Doubles: "  << endl;
    display<double>(dfirst);

    return 0;
}

/*
Sample output:
A Linked List of Integers: 
7 8 6 5 100 
A Linked List of Doubles: 
7.253 100.45 23.4 5.4 15.84 
*/