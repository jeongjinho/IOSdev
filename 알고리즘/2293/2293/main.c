//
//  main.c
//  2293
//
//  Created by 진호놀이터 on 2017. 8. 9..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

#include <stdio.h>

#define  MAX(a, b) (((a) > (b)) ? (a) : (b))
int arr[300];
int scade(int);
int dp[100000] = {};
int sum;
int max = 0;
int main(int argc, const char * argv[]) {
    
    for (int i =0; i<100000; i++) {
        dp[i] = -1;
    }
    
    
    int cnt;
    int input;
    int maxSum;
    scanf("%d",&cnt);
   
 
    arr[0] = -1;
    for (int i = 1; i<=cnt; i++) {
        scanf("%d",&input);
       
        arr[i] = input;
        
    }
  
    
    maxSum = scade(cnt);
    
    return 0;
}


int scade(int cnt){

    
    if(cnt <0){
    
        return 0;
    }
    

    max =  scade(cnt-1) + scade(cnt-3),scade(cnt-2) + scade(cnt-3);
    
    sum = arr[cnt] + max;
    printf("%d",sum);
    return sum;
  

   


}
