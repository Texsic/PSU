#include <iostream>
#include <cstdlib>
#include <ctime>

using namespace std;

void playerMove(int &items, int &prevMove);
void computerMove(int &items, int &prevMove);

int main() {
    int items;
    char startingPlayer;
    int prevMove = 0;
    
    srand(time(0));
    
    cout << "Would you like to go first (y for yes and other input for no)? ";
    cin >> startingPlayer;
    
    cout << "Enter the initial number of items: ";
    cin >> items;
    cout << endl;
    
    while (items < 2) {
        cout << "Invalid number of items. Please enter a number greater than 1:\n";
        cin >> items;
    }
    
    bool playerMoveFlag = (startingPlayer == 'y' || startingPlayer == 'Y');
    
    while (items > 0) {
        if (playerMoveFlag) {
            playerMove(items, prevMove);
        } else {
            computerMove(items, prevMove);
        }
        playerMoveFlag = !playerMoveFlag;
    }
    
    if (playerMoveFlag) {
        cout << "Computer wins." << endl;
    } else {
        cout << "You win. Congratulations!" << endl;
    }
    
    return 0;
}

void playerMove(int &items, int &prevMove) {
    int maxRemovable = prevMove == 0 ? items - 1 : 2 * prevMove;
    int removeCount;
    
    cout << "It is your turn. Enter the number of items to remove (1-" << maxRemovable << "): ";
    cin >> removeCount;
    
    while (removeCount < 1 || removeCount > maxRemovable || removeCount > items) {
        cout << "Invalid move. Enter the number of items to remove (1-" << maxRemovable << "): ";
        cin >> removeCount;
    }
    items -= removeCount;
    
    cout << "Move accepted. The number of items remains: " << items << endl << endl;
    prevMove = removeCount;
}


void computerMove(int &items, int &prevMove) {
    int maxRemovable = prevMove == 0 ? items - 1 : 2 * prevMove;
    int removeCount;
    
    if (items <= maxRemovable) {
        removeCount = items;
    } else {
        removeCount = rand() % maxRemovable + 1;
    }
    items -= removeCount;
    
    cout << "It is the computer's turn. The computer removes " << removeCount << " items." << endl;
    cout << "The number of items remains: " << items << endl << endl;
    prevMove = removeCount;
}

/*
Sample run:
Would you like to go first (y for yes and other input for no)? y
Enter the initial number of items: 15

It is your turn. Enter the number of items to remove (1-14): 2
Move accepted. The number of items remains: 13

It is the computer's turn. The computer removes 4 items.
The number of items remains: 9

It is your turn. Enter the number of items to remove (1-8): 10
Invalid move. Enter the number of items to remove (1-8): 1
Move accepted. The number of items remains: 8

It is the computer's turn. The computer removes 1 items.
The number of items remains: 7

It is your turn. Enter the number of items to remove (1-2): 2
Move accepted. The number of items remains: 5

It is the computer's turn. The computer removes 3 items.
The number of items remains: 2

It is your turn. Enter the number of items to remove (1-6): 2
Move accepted. The number of items remains: 0
You win. Congratulations!
*/