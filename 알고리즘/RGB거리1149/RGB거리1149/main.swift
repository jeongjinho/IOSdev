//
//  main.swift
//  RGB거리1149
//
//  Created by 진호놀이터 on 2017. 11. 6..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import Foundation

let MIN = {(compare1:Int,compare2:Int) -> Int in
     if(compare1 > compare2){
        return compare1
     }else{
       return compare2
    }
}
enum Color {
    case R
    case G
    case B
}

var input = readLine()!.split(separator: " ").map( {Int(String($0))})
var cycle = input[0]!
var minR:Int
var minG:Int
var minB:Int

var array = Array(repeatElement(Array(repeatElement(0, count:3)), count:cycle))
var dp = Array(repeatElement(Array(repeatElement(0, count:3)), count:cycle))
for index in 0..<cycle {
    
    let homeScore = readLine()!.split(separator: " ").map({Int(String($0))})
    var red = homeScore[0]!
    var green = homeScore[1]!
    var blue = homeScore[2]!
    
    array[index][0] = red
    array[index][1] = green
    array[index][2] = blue
    
    if(index == 0){
        
        
        dp[0][0] = array[0][0]
        dp[0][1] = array[0][1]
        dp[0][2] = array[0][2]
    }
}


for index  in 1..<cycle{
    
    dp[index][0] = MIN(dp[index-1][1], dp[index-1][2]) + array[index][0]
    dp[index][1] = MIN(dp[index-1][0], dp[index-1][2]) + array[index][1]
    dp[index][2] = MIN(dp[index-1][0], dp[index-1][1]) + array[index][2]
    
    
}

var mins = MIN(dp[cycle-1][0], dp[cycle-1][1])
var min = MIN(min, dp[cycle-1][2])








