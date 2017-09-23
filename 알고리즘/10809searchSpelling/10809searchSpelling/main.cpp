//
//  main.cpp
//  10809searchSpelling
//
//  Created by 진호놀이터 on 2017. 9. 22..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

#include <iostream>
#include <string>
#include <cstring>
using namespace std;
int main(int argc, const char * argv[]) {
    // insert code here...
    string alphaBet = "";
    cin >> alphaBet;
    int spelling[27];
    
    for (int i  = 0; i<26;i++) {
        
        spelling[i] = -1;
        
    }
    
    
    char myArray[alphaBet.size()+1];
    strcpy(myArray, alphaBet.c_str());
    
    
    
    for (int j = 0; j<=alphaBet.size();j++) {
        
        int temp = myArray[j] - 97;
        
        if(spelling[temp] == -1){
            spelling[temp] = j;
        }
    }
    
    for (int i  = 0; i< 26 ;i++) {
        
        cout << spelling[i] << endl;
        
    }
    
    
    
    
    return 0;
}
