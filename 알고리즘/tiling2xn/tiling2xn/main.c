//
//  main.c
//  tiling2xn
//
//  Created by 진호놀이터 on 2017. 8. 1..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

#include <stdio.h>

long dp[1000000] = {0,};

long tilingNumber(long number);


int main(int argc, const char * argv[]) {
    // insert code here...
    long result,input = 0;
  
    scanf("%ld",&input);
    result = tilingNumber(input);
    printf("%ld\n",result);
    
    return 0;
}


long tilingNumber(long number){
    if(number == 0) return 0;
    if(number == 1) return 1;
    if(number == 2) return 2;
    if(dp[number] != 0) return  dp[number];
    else{
    
        dp[number] = (tilingNumber(number-2) + tilingNumber(number -1))% 10007;
    
        return  dp[number];
    }

}
