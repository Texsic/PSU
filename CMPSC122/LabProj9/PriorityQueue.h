#ifndef PRIORITYQUEUE_H
#define PRIORITYQUEUE_H

#include <iostream>
#include <stdexcept>

using namespace std;

template<typename T>
class PriorityQueue {
private:
    struct Node {
        T data;
        int priority;
        Node() : data(T()), priority(0) {}
        Node(const T& item, int priorityVal) : data(item), priority(priorityVal) {}
    };

    Node* array;
    int capacity;
    int size;

    void expandCapacity() {
        int newCapacity = capacity * 1.5;
        Node* newArray = new Node[newCapacity];
        for (int i = 0; i < size; ++i) {
            newArray[i] = array[i];
        }
        delete[] array;
        array = newArray;
        capacity = newCapacity;
    }

    int findItemIndex(const T& item) {
        for (int i = 0; i < size; ++i) {
            if (array[i].data == item) {
                return i;
            }
        }
        return -1;
    }

public:
    PriorityQueue(int initialCapacity = 1024) : capacity(initialCapacity), size(0) {
        array = new Node[capacity];
    }

    ~PriorityQueue() {
        delete[] array;
    }

    bool IsEmpty() const {
        return size == 0;
    }

    void Insert(const T& item, int priorityVal) {
        if (findItemIndex(item) != -1) {
            cerr << "***Error: Trying to insert duplicated item." << endl;
            return;
        }

        if (size == capacity) {
            expandCapacity();
        }

        array[size++] = Node(item, priorityVal);
    }

    void ChangePriority(const T& item, int priorityVal) {
        int index = findItemIndex(item);
        if (index == -1) {
            cerr << "***Error: Item not found." << endl;
            return;
        }

        array[index].priority = priorityVal;
    }

    T Pull() {
        if (IsEmpty()) {
            throw out_of_range("PriorityQueue is empty");
        }

        int highestPriorityIndex = 0;
        for (int i = 1; i < size; ++i) {
            if (array[i].priority > array[highestPriorityIndex].priority) {
                highestPriorityIndex = i;
            }
        }

        T item = array[highestPriorityIndex].data;

        for (int i = highestPriorityIndex; i < size - 1; ++i) {
            array[i] = array[i + 1];
        }

        --size;

        return item;
    }

    T Peek() const {
        if (IsEmpty()) {
            throw out_of_range("PriorityQueue is empty");
        }

        int highestPriorityIndex = 0;
        for (int i = 1; i < size; ++i) {
            if (array[i].priority > array[highestPriorityIndex].priority) {
                highestPriorityIndex = i;
            }
        }

        return array[highestPriorityIndex].data;
    }
};

#endif

/*
Sample output:
Successfully created an empty priority queue for strings.
Insert string "Homework Due Today" to the priority queue with priority value 20.
Insert string "Play Games" to the priority queue with priority value 3.
Insert string "Prepare Dinner" to the priority queue with priority value 30.
Insert string "Exam" to the priority queue with priority value 70.
Insert string "Workout" to the priority queue with priority value 15.
Insert string "Homework Due Today" to the priority queue with priority value 45.
***Error: Trying to insert duplicated item.
Current item with the highest priority: Exam
Removing the highest priority item...
Current item with the highest priority: Prepare Dinner
Change the priority of item "Homework Due Today" to 50.
Current item with the highest priority: Homework Due Today
Removing the two highest priority item...
Current item with the highest priority: Workout
*/