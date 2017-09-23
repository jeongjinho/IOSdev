//
//  main.c
//  palindrome
//
//  Created by 진호놀이터 on 2017. 8. 2..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

#include <stdio.h>
#define  EQUAL(a, b) (((a) = (b)) ? (1) : (0))
int arr[100000];
int pelinFlag = 0;
int dp[10001][10001];

int  palindrome(int s,int e);


int main(int argc, const char * argv[]) {

     int number,number2, cnt;
     int s,e,flag;
    
    for(int i=0; i<100000; i++)
        arr[i] = -1;
    
    for(int i=0; i<1000; i++){
    
        for (int j =0; j<1000;j++) {
            
            dp[i][j] = -1;
        }
    }
        
    
    
   
    scanf("%d",&number);
    
    for (int i = 0; i<number;i++) {
        scanf("%d",&number2);
        arr[i] = number2;
    }
    
   
    scanf("%d",&cnt);
   
    for (int j = 0 ;j<cnt; j++) {
        scanf("%d" "%d",&s,&e);
        
        flag = palindrome(s, e);
        printf("있냐없냐?%d",flag);
        
    }
    
    
    

    return 0;
}
int  palindrome(int s,int e){
    
    
    if(s == e || s>e ){
    
        return  pelinFlag = 1;
    
    }
     if (arr[s] == arr[e]) {
        return pelinFlag = 1;
    }
    
    if (arr[s] != arr[e]) {
        return pelinFlag = 0;
    }
    
    
    if(dp[s][e] != -1){
        
        
        return dp[s][e];
    }
    
    
    dp[s][e] = palindrome(arr[s+1], arr[e-1]);
    
    
    
    
    
    return pelinFlag;
}
