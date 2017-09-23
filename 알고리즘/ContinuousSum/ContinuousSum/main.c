//
//  main.c
//  ContinuousSum
//
//  Created by 진호놀이터 on 2017. 7. 26..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

#include <stdio.h>
#define  MAX(a, b) (((a) > (b)) ? (a) : (b))


int main(int argc, const char * argv[]) {
    
    
    int testCase;
    int *arr;
    int *dp;
  
  
    int currentMax = 0;
    scanf("%d",&testCase);
    
     arr = (int *)calloc(testCase+1,sizeof(int));
     dp = (int *)calloc(testCase+1,sizeof(int));
    
    for (int i =0; i<testCase; i++) {
        
        scanf("%d",&arr[i]);
    
    }
    
    
    for (int i = 0; i<testCase; i++) {
        
        if(i != 0){
          
            if( arr[i] + dp[i-1] >= arr[i]){
            
                
                dp[i] = arr[i] + dp[i-1];
               
                currentMax =  MAX(currentMax, dp[i]);
                
            } else{
                dp[i] = arr[i];
                currentMax =  MAX(currentMax, arr[i]);
            
                }
        } else{
            
            dp[0] = arr[0];
            currentMax = dp[0];
        }
    }
    
    printf("%d",currentMax);
    
    return 0;
}

