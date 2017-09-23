//
//  main.swift
//  12996Acka
//
//  Created by 진호놀이터 on 2017. 9. 11..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import Foundation




//S를 입력받는다.

var n = readLine()!.components(separatedBy:" ").map({Int($0)})
var one = n[1]!
var two = n[2]!
var three = n[3]!
var dp:[Int] = Array.init(repeating:0, count:n[0]! + 1)

print(dp.count)



func acka(n  : Int, one : Int , two: Int, three: Int ) -> Int{

   
    if(one == 0 && two == 0 && three == 0){

        return 0
        
        
    }
    
    if dp[n] != 0{
        
        return dp[n]
    }
    
 
    
    
    if(one > 0 && two > 0 && three > 0){
        
        dp[n] +=  acka(n:n - 1, one: one - 1, two: two - 1 , three: three - 1) +   (acka(n:n - 1, one: one - 1, two: two - 1 , three: three)) + (acka(n:n - 1, one: one - 1, two: two, three: three - 1)) + (acka(n:n - 1, one: one, two: two - 1 , three: three - 1) ) + (acka(n:n - 1, one: one - 1, two: two, three: three)) + (acka(n:n - 1, one: one, two: two - 1 , three: three)) + (acka(n:n - 1, one: one, two: two , three: three - 1))





    
    }
    if(one > 0 && two  == 0 && three == 0){
     dp[n] +=  (acka(n:n - 1, one: one - 1, two: two , three: three))  + 1
        
    
    }
    if(one  == 0  && two > 0  && three == 0){
     dp[n] +=   (acka(n:n - 1, one: one, two: two - 1 , three: three)) + 1
    }
    if(one == 0 && two == 0 && three > 0){
      dp[n] +=  (acka(n:n - 1, one: one, two: two , three: three - 1)) + 1
    }
    if(one > 0 && two == 0 && three > 0){
        dp[n] += (acka(n:n - 1, one: one - 1, two: two , three: three - 1)) + 1
    }
    if(one > 0 && two > 0 && three == 0){
      dp[n] += (acka(n:n - 1, one: one - 1, two: two - 1, three: three)) + 1
    }
    if(one == 0 && two > 0 && three > 0){
       dp[n] += (acka(n:n - 1, one: one, two: two - 1, three: three - 1)) + 1
    }
    
    return dp[n]
    
    
    
}


 let  result = acka(n:n[0]!, one: one, two: two, three: three)
print(result)
