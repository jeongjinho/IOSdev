//
//  main.cpp
//  Today
//
//  Created by 진호놀이터 on 2017. 9. 21..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

#include <sstream>
#include <iostream>
#include <string>
#include <vector>
using namespace std;
int main(int argc, const char * argv[]) {
    vector<vector<int>> v(100000);
    
    int max = 0;
    int min = 0;
    int count;
    cin >> count;
   
//    string nums;
//
//        getline (cin,nums);
//        istringstream iss(nums);
//    
//    int i = 0;
//        do
//        {
//            string subs;
//           
//            int num;
//            iss >> subs;
//            num = atoi(subs.c_str());
//            v[i].push_back(num);
//            i++;
//            count = i;
//            
//        } while (iss);
    
    
    for (int i = 0; i < count; i++) {
        string temp ;
        int num;
        cin >> temp;
        num = atoi(temp.c_str());
        v[i].push_back(num);
        
    }
    
  
    
    for (int i = 0; i < count ;i++) {
        
        int num = v[i][0];
        if(num/10 < 1){
        
            v[i].push_back(num);
            v[i].push_back(num);
            
        }else{
        
            v[i].push_back(num/10);
            v[i].push_back(num%10);
        }
    }
    
    
    for (int i = count - 1; i >= 0; i--) {
        
        for (int j = 0; j < i; j++) {
            vector<int> temp;
            
            if(v[j][1] < v[j+1][1]){
            
                v[j].swap(v[j+1]);
            } else if(v[j][1] == v[j+1][1]){
                
                if(v[j][2] < v[j+1][2]){
                
                     v[j].swap(v[j+1]);
                }
            
            }
        }
    }
    
    string concat = "";
    
    for(int i = 0; i < count; i++) {
        
        concat += to_string(v[i][0]);
    }
    
    cout << concat << endl;
    
    
    for (int i = count - 1; i >= 0; i--) {
        
        for (int j = 0; j < i; j++) {
            vector<int> temp;
            
            if(v[j][1] > v[j+1][1]){
                
                v[j].swap(v[j+1]);
            } else if(v[j][1] == v[j+1][1]){
                
                if(v[j][2] > v[j+1][2]){
                    
                    v[j].swap(v[j+1]);
                }
                
            }
        }
    }

     concat = "";
    
    for(int i = 0; i < count; i++) {
        
        concat += to_string(v[i][0]);
    }
    
    cout << concat << endl;


    return 0;
}
