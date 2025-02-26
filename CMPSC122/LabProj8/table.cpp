#include <iostream>
#include <queue>
#include <string>
#include <cctype>
#include <unordered_map>

using namespace std;

int main() {
    int num_large_tables, num_small_tables;
    queue<string> large_waiting_line, small_waiting_line;
    unordered_map<string, int> table_status = {{"large", 0}, {"small", 0}};

    cout << "Welcome to the Restaurant Table Management System." << endl;
    cout << "Enter the total number of large tables: ";
    cin >> num_large_tables;
    cout << "Enter the total number of small tables: ";
    cin >> num_small_tables;

    string command, name, original_command;

    while (true) {
        cout << "\nEnter Command: ";
        cin >> command;
        original_command = command;
        for (char &c : command) c = tolower(c);

        if (command == "new") {
            cin >> command;
            for (char &c : command) c = tolower(c);
            cin >> name;

            if (command == "large" && table_status["large"] < num_large_tables) {
                cout << "New customer " << name << " takes an available large table." << endl;
                table_status["large"]++;
            } else if (command == "small" && table_status["small"] < num_small_tables) {
                cout << "New customer " << name << " takes an available small table." << endl;
                table_status["small"]++;
            } else if (command == "small" && table_status["large"] < num_large_tables) {
                cout << "New customer " << name << " takes an available large table." << endl;
                table_status["large"]++;
            } else if (command == "large") {
                large_waiting_line.push(name);
                cout << "New customer " << name << " enters the large waiting line." << endl;
            } else if (command == "small") {
                small_waiting_line.push(name);
                cout << "New customer " << name << " enters the small waiting line." << endl;
            } else {
                cout << "Invalid table size!" << endl;
            }
        } else if (command == "checkout") {
            cin >> command;
            for (char &c : command) c = tolower(c); 
            if (command == "large" && table_status["large"] > 0) {
                table_status["large"]--;
                if (!large_waiting_line.empty()) {
                    cout << "Next customer " << large_waiting_line.front() << " takes an available large table." << endl;
                    large_waiting_line.pop();
                    table_status["large"]++;
                } else if (!small_waiting_line.empty()) {
                    cout << "Next customer " << small_waiting_line.front() << " takes an available large table." << endl;
                    small_waiting_line.pop();
                    table_status["large"]++;
                } else {
                    cout << "New large table seat(s) is available." << endl;
                }
            } else if (command == "small" && table_status["small"] > 0) {
                table_status["small"]--;
                if (!small_waiting_line.empty()) {
                    cout << "Next customer " << small_waiting_line.front() << " takes an available small table." << endl;
                    small_waiting_line.pop();
                    table_status["small"]++;
                } else {
                    cout << "New small table seat(s) is available." << endl;
                }
            } else {
                cout << "No customer occupied any " << command << " table!" << endl;
            }
        } else if (command == "info") {
            cout << "Small tables: " << table_status["small"] << " / " << num_small_tables << endl;
            cout << "Large tables: " << table_status["large"] << " / " << num_large_tables << endl;
            cout << small_waiting_line.size() << " customer(s) waiting for small table." << endl;
            cout << large_waiting_line.size() << " customer(s) waiting for large table." << endl;
        } else {
            cout << "Invalid command!" << endl;
        }
    }
    return 0;
}

/*
Sample output:
Welcome to the Restaurant Table Management System.
Enter the total number of large tables: 2
Enter the total number of small tables: 3

Enter Command: checkout large
No customer occupied any large table!

Enter Command: checkout small
No customer occupied any small table!

Enter Command: new large Edison
New customer Edison takes an available large table.

Enter Command: new large Matt  
New customer Matt takes an available large table.

Enter Command: new large Luke  
New customer Luke enters the large waiting line.

Enter Command: info
Small tables: 0 / 3
Large tables: 2 / 2
0 customer(s) waiting for small table.
1 customer(s) waiting for large table.

Enter Command: checkout large
Next customer Luke takes an available large table.

Enter Command: checkout large
New large table seat(s) is available.

Enter Command: info
Small tables: 0 / 3
Large tables: 1 / 2
0 customer(s) waiting for small table.
0 customer(s) waiting for large table.

Enter Command: checkout large
New large table seat(s) is available.

Enter Command: checkout large
No customer occupied any large table!

Enter Command: new small Andy
New customer Andy takes an available small table.

Enter Command: new small Ken 
New customer Ken takes an available small table.

Enter Command: new small Dan 
New customer Dan takes an available small table.

Enter Command: new small Frank
New customer Frank takes an available large table.

Enter Command: new small Will
New customer Will takes an available large table.

Enter Command: info
Small tables: 3 / 3
Large tables: 2 / 2
0 customer(s) waiting for small table.
0 customer(s) waiting for large table.

Enter Command: new small Smith
New customer Smith enters the small waiting line.

Enter Command: new large Mary
New customer Mary enters the large waiting line.

Enter Command: info
Small tables: 3 / 3
Large tables: 2 / 2
1 customer(s) waiting for small table.
1 customer(s) waiting for large table.

Enter Command: checkout large
Next customer Mary takes an available large table.

Enter Command: testing invalid command
Invalid command!

Enter Command: checkout Large
Next customer Smith takes an available large table.

Enter Command: checkout Small Peter
Invalid command!

Enter Command: 
*/