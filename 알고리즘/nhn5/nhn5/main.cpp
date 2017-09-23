//
//  main.cpp
//  nhn5
//
//  Created by 진호놀이터 on 2017. 9. 23..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

#include <sstream>
#include <iostream>
#include <string>
#include <vector>
#include <deque>
using namespace std;
int main(int argc, const char * argv[]) {
    // insert code here...
      int num;
    int ncnt;
    vector<int> v;
    for (int i = 0; i < 3; i++) {
        
        cin >> num;
         v.push_back(num);
    }
    
    
    cin >> ncnt;
    cin.ignore();
    
   
      vector<vector<string>> conditions(ncnt);
    for (int i = 0; i < ncnt; i++) {
        
        
        string condition;
      
        
        getline (cin,condition);
        istringstream iss(condition);
        
        do
        {
            string subs;
            iss >> subs;
          //  num = atoi(subs.c_str());
            
            conditions[i].push_back(subs);
        cout << "Substring: " << subs.c_str() << endl;
        } while (iss);


    }
    
    
    for (int i  = 0 ; i < v.size(); i++) {
        
        int num = v[i];
        
        if(num == 1){
        
            for (int j = 0; j < conditions.size(); j++) {
                
                
                
                
                if(conditions[j][num+1] )
                
                
            }
        
        
        
        }
        
        
    }
    
    
    
    
   
    for (int i = 0; i < conditions.size(); i++) {
        
        printf("%s",conditions[i][0].c_str());
        printf("%s",conditions[i][1].c_str());
        printf("%s",conditions[i][2].c_str());
        printf("\n");
        
        
    }
    
    
    

    
    
    
    
    
    
    
    
    
    
    return 0;
}
