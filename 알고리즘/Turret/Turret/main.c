//
//  main.c
//  Turret
//
//  Created by 진호놀이터 on 2017. 7. 18..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

#include <stdio.h>
#include <math.h>



typedef struct PointInfo{

    double x;
    double y;
    double distance;

}PointInfo;
int turretDistance(PointInfo firstPoint,  PointInfo secondPoint){

    if(firstPoint.x == secondPoint.x && firstPoint.y == secondPoint.y && firstPoint.distance == secondPoint.distance){
    //  완전같을때
    
        return -1;
    
    } else if(firstPoint.x == secondPoint.x && firstPoint.y == secondPoint.y){
        //  좌표는 같은데 거리가 다를떄
    
        return  0;
    } else {
    
      
        double distance = sqrt(pow(secondPoint.x + fabs(firstPoint.x),2.0) + pow(secondPoint.y + fabs(firstPoint.y),2.0));
        
       
      
        double contactPoint = distance - secondPoint.distance;
        if(contactPoint == firstPoint.distance){
        // 좌표가 다른데 범위가 마주칠때
                     return  1;
        
        }else if(contactPoint < firstPoint.distance){
            // 좌표가 다른데 범위가 중첩될때

  
            return 2;
        } else {
            // 좌표가 다른데 범위도 다를때
        
        
            return 0;
        }
        
        
    }

}



int main(int argc, const char * argv[]) {
    // insert code here...
    printf("Hello, World!\n");
    
    int testCase;
    
   // scanf("%d",testCase);
    
    
    int pointNum;
 
    PointInfo first;
    PointInfo second;
    first.x = 0;
    first.y = 0;
    first.distance = 13;
    second.x = 40;
    second.y = 0;
    second.distance = 37;
    
   pointNum   =  turretDistance(first, second);
    
    printf("포인트갯수는 : %d\n",pointNum);
    
    
    return 0;
}



