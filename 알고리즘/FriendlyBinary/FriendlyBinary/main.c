//
//  main.c
//  FriendlyBinary
//
//  Created by 진호놀이터 on 2017. 8. 7..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

#include <stdio.h>
long friendlyBianry(int number);

long dp[91];
int main(int argc, const char * argv[]) {
    // insert code here...
    int input;
    
    
    
    for(int i=0; i<91; i++){
    
        dp[i] = -1;
    }
    
    
    
    scanf("%d",&input);
    
    long result = friendlyBianry(input);
    
   
    printf("%ld",result);
    return 0;
}


long friendlyBianry(int number){

    if(number == 0) return 0;
    if(number == 1) return 1;
    
    if(dp[number] != -1){
    
    
        return  dp[number];
    
    }else{
    
        dp[number] = friendlyBianry(number-2) + friendlyBianry(number-1);
        
        return dp[number];
    
    }

    
    

}
