//
//  main.cpp
//  NHNpretest
//
//  Created by 진호놀이터 on 2017. 9. 20..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//
#include <sstream>
#include <iostream>
#include <string>
#include <vector>
using namespace std;
int main(int argc, const char * argv[]) {
   
   
//    std::string name;
//    vector<int> v;
//   
//    getline (cin,name);
//    istringstream iss(name);
//    
//    do
//    {
//        string subs;
//        int num;
//        iss >> subs;
//        num = atoi(subs.c_str());
//        v.push_back(num);
//        cout << "Substring: " << num << endl;
//    } while (iss);

    
    int arr[9][9] = {0,};
    bool isArr[8][8] = {false,};
    
//    int cycle = 1;
//    cin >> cycle;
//    cin.get();
//    cin.ignore();
    
   
        for (int i = 0; i < 8; i++) {
            
            string line;
            
                getline (cin,line);
                istringstream iss(line);
            for (int j = 0; j < 8; j++) {
                string subs;
                int num;
                iss >> subs;
                num = atoi(subs.c_str());
                arr[i][j] = num;
            }
            
            
            
        
            
    }
    for (int i = 0; i < 9; i++) {
        puts("");  // 줄바꿈
        for (int j = 0; j < 9; j++) {
            printf("%d ", arr[i][j]);
        }
    }
    
    puts("");  // 줄바꿈
    
    int idxI = 0;
    int idxJ = 0;
    int value = arr[idxI][idxJ];
    int nextValue = 0;
    bool isPosible = true;
    isArr[idxI][idxJ] = true;
    
    while (isPosible != false && arr[idxI][idxJ] != 0) {
        if(arr[idxI][idxJ+1] !=0){
            
            nextValue = arr[idxI][idxJ+1];
            idxJ = idxJ +1;
            
        } else if(arr[idxI+1][idxJ] != 0){
            nextValue = arr[idxI+1][idxJ];
            idxI = idxI + 1;
        }else{
            isPosible = false;
            
        }
        switch (value) {
            case 1:
                if(nextValue != 3){
                    
                    isArr[idxI][idxJ] = true;
                    value = nextValue;
                }else{
                    isPosible = false;
                }
                break;
            case 2:
                if(nextValue != 4){
                     isArr[idxI][idxJ] = true;
                    value = nextValue;
                   
                }else{
                    isPosible = false;
                }
                break;
            case 3:
                if(nextValue != 2){
                    isArr[idxI][idxJ] = true;
                    value = nextValue;
                    
                }else{
                    isPosible = false;
                }
                break;
            case 4:
                if(nextValue != 1){
                    isArr[idxI][idxJ] = true;
                    value = nextValue;
                    
                }else{
                    isPosible = false;
                }
                break;
            default:
                break;
        }

    }
    
        for (int i = 0; i < 9; i++) {
            puts("");  // 줄바꿈
            for (int j = 0; j < 9; j++) {
                printf("%d ", isArr[i][j]);
            }
        }
    
    

    
    
    
    
    return 0;
}




