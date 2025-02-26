#include <iostream>
#include <vector>

using namespace std;

int main() {
    const int days = 12;
    const int startingFund = 1000;
    
    cout << "Please type the 12-day price history of the stock:" << endl;
    
    vector<int> prices(days);
    for (int i = 0; i < days; ++i) {
        cin >> prices[i];
    }
    
    int maxProfit = 0, buyDay = -1, sellDay = -1;
    
    for (int i = 0; i < days - 1; ++i) {
        for (int j = i + 3; j < days; ++j) {
            int sharesBought = startingFund / prices[i];
            int profit = (prices[j] - prices[i]) * sharesBought;
            if (profit > maxProfit) {
                maxProfit = profit;
                buyDay = i + 1; 
                sellDay = j + 1;
            }
        }
    }
    
    cout << "Max Profit: " << maxProfit << "." << endl;
    
    if (maxProfit > 0) {
        cout << "Best Strategy: buy on day " << buyDay << ", sell on day " << sellDay << "." << endl;
    }
    
    return 0;
}

/*
Sample output:
Please type the 12-day price history of the stock:
50 200 100 30 20 25 40 10 5 35 45 20
Max Profit: 3500.
Best Strategy: buy on day 8, sell on day 11.

Please type the 12-day price history of the stock:
50 100 50 40 40 40 40 40 40 40 40 40
Max Profit: 0.
*/