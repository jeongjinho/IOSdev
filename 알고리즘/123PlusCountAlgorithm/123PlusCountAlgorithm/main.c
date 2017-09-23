//
//  main.c
//  123PlusCountAlgorithm
//
//  Created by 진호놀이터 on 2017. 7. 27..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

#include <stdio.h>

int arr[100000];
int testCaseArray[100000];
int getCnt(int num);
int main(int argc, const char * argv[]) {
    
    int testCase;
    int num;
    int total;
    for(int i=0; i<100000; i++)
        arr[i] = -1;
    scanf("%d",&testCase);
    
    for (int i = 0; i<testCase; i++) {
    scanf("%d",&testCaseArray[i]);
   
    }
    for (int j=0; j<testCase; j++) {
       
       total = getCnt(testCaseArray[j]);
        printf("%d\n",total);

    }
    
    
    return 0;
}
int getCnt(int num){
   
    //baseCase
    if(num==1){
    return 1;
    }
    if(num==2){
     return 2;
    }
    if(num==3){
    return 4;
    }
    if(arr[num] > -1){
    return arr[num];
    
    }
    
    arr[num] = getCnt(num-1) + getCnt(num-2) + getCnt(num-3);
    return arr[num];
}



