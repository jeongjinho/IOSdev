//
//  main.cpp
//  1316groupWord
//
//  Created by 진호놀이터 on 2017. 9. 22..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//
#include <cstdio>
#include <iostream>
using namespace std;
int main(int argc, const char * argv[]) {
    // insert code here...
    
    int cycle;
    string k = "";
    cin >> cycle ;
    int groupCnt = cycle;
    for (int i= 0; i < cycle; i++) {
        
        int alphabet[26] = {0,};
        cin >> k;
        for (int j = 0; j< k.size() ; j++) {
            
            if(alphabet[k[j] - 97] == 0 ){
            
                alphabet[k[j] - 97] = 1;
                
            }else if(k[j] != k[j - 1]){
            
                groupCnt -= 1;
                break;
            }
        }
    
    }
    
    printf("%d",groupCnt);
    
    return 0;
}
