//
//  main.c
//  RGBAlgorithm
//
//  Created by 진호놀이터 on 2017. 7. 24..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

#include <stdio.h>
#include <math.h>

#define  MIN(a, b) (((a) < (b)) ? (a) : (b))
#define  MAX(a, b) (((a) > (b)) ? (a) : (b))
#define  MIN_THIRD(a,b,c) ((a)<(b)) ?  (((a)<(c)) ? (a) : (c)) : (((b)<(c)) ? (b) : (c))


int main(int argc, const char * argv[]) {
    // insert code here...
    
    
    
    int testCase = 0;
    int minRed = 0;
    int minGreen = 0;
    int minBlue = 0;
    scanf("%d",&testCase);
    int array[testCase][3];
    for(int i = 0; i<testCase;i++){
    
       
        
        scanf("%d",&array[i][0]);
        scanf("%d",&array[i][1]);
        scanf("%d",&array[i][2]);
        if(i == 0){
            
            minRed = array[i][0];
            minGreen = array[i][1];
            minBlue = array[i][2];
        } else if(i !=0){
         int tempRed = minRed;
            minRed = MIN(minBlue, minGreen) + array[i][0];
            int tempGreen = minGreen;
            minGreen = MIN(tempRed, minBlue) + array[i][1];
            minBlue = MIN(tempGreen, tempRed) + array[i][2];
        
        }
       
    }
    
    
    
   
    int minValue =  MIN_THIRD(minRed, minGreen, minBlue);
    printf("%d",minValue);
    
    return 0;
}
