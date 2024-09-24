// Developed by Diluk Chamika
// This C++ code will show you how to display the Padovan Sequence upto user input number of terms

#include <iostream>
#include <vector>
using namespace std;

// Function to generate and display Padovan Sequence up to n terms
void generatePadovan(int n) {
    vector<int> padovan(n);

    // Default base cases
    padovan[0] = 1;
    padovan[1] = 1;
    padovan[2] = 1;

    // Generate Padovan sequence for n terms
    for (int i = 3; i < n; i++) {
        padovan[i] = padovan[i - 2] + padovan[i - 3];
    }

    // Output the sequence
    for (int i = 0; i < n; i++) {
        cout << padovan[i];
        if (i < n - 1) {
            cout << ", ";
        }
    }
    cout << endl;
}

// The main function
int main() {
    int n;
    cout << "Enter the number of terms: ";  // Display the message to user
    cin >> n;  //Get the input from user

    if (n >= 3) {
        generatePadovan(n);  // Calling the function
    } else {
        cout << "The number of terms should be at least 3." << endl;  // Display warning message if user enter number less than 3
    }

    return 0;
}
