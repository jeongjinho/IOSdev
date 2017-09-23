//
//  main.c
//  Pibonacci
//
//  Created by 진호놀이터 on 2017. 7. 23..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

#include <stdio.h>
int zeroCnt = 0;
int oneCnt = 0;
//int array[100] = {1,1,};

int fibonacci(int n){
    if ( n  == 0){
        zeroCnt++;
        return 0;
    }
    else if(n == 1){
        oneCnt++;
        return 1;
    } else
        return  fibonacci(n-2) + fibonacci(n-1);
    
    
}




int main(int argc, const char * argv[]) {
    // insert code here...
    printf("Hello, World!\n");
    
    
    
    int testCase;
    
    
    scanf("%d",&testCase);
    
    for (int i = 0; i< testCase; i++) {
        
        int inputNum;
        
        scanf("%d",&inputNum);
        
           fibonacci(inputNum);
        
        
            printf("%d %d \n",zeroCnt,oneCnt);
            zeroCnt = 0;
            oneCnt = 0;
     
        
    }
    
    
    
    
    
    return 0;
}
