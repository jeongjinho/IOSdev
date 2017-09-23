//
//  main.c
//  2156wine
//
//  Created by 진호놀이터 on 2017. 8. 7..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

#include <stdio.h>
#define  MAX_THIRD(a,b,c) ((a)>(b))?  (((a) >(c)) ? (a) : (c)) : (((b)>(c)) ?  (b):(c))

int  dp[100000];
int  arr[10000];

int wineSum(int number);
int main(int argc, const char * argv[]) {
    // insert code here...
    
    for(int i=0; i<100000; i++){
        
        dp[i] = -1;
    }
    
    
    int result = 0;
    int cnt = 0;
    
    scanf("%d",&cnt);
    
    
    for (int i = 0; i<cnt; i++) {
        
        scanf("%d",&arr[i]);
        
    }
    
    
    result = wineSum(cnt);
    printf("%d",result);
    return 0;
}


int wineSum(int n){
    if(n == 1) return arr[n-1];
    if(n == 2) return arr[n-1] + arr[n-2];
    
    if(dp[n] != -1){
    
        return dp[n];
    
    }
    
    dp[n] = MAX_THIRD(wineSum(n-1)+wineSum(n-2), wineSum(n-3)+wineSum(n-2), wineSum(n-3)+wineSum(n-1));


    
    
    return dp[n];
    
}
