////
////  main.swift
////  DigitSum
////
////  Created by 진호놀이터 on 2017. 9. 14..
////  Copyright © 2017년 진호놀이터. All rights reserved.
////
//
//
import Foundation
//
//func solution(_ n:Int) -> Int
//{
//    
//     let answer:Int = Array(String(n).characters).map({Int(String($0))!}).reduce(0, +)
//    
//   print(answer)
//    return answer
//}
//
//func solution2(_ arr:[Int]) -> Bool {
//    var answer = true
//    let length = arr.count
//    
//    let sortArray = arr.sorted()
//    if(length != sortArray.last){
//        
//        return false
//    }else{
//    
//        for idx in 1...length{
//            
//            if(idx != sortArray[idx - 1]){
//                return false
//            }
//            
//        }
//    }
//   
//    print(sortArray)
//    
//    return true
//}
//let bol: Bool = solution2([4, 1, 3])
//print(bol)
//
//
//
//func solution3 ( _ v: [[Int]]) -> [Int]{
//    var ans = [Int]()
//   // typealias Axis = (x:Int,y:Int)
//    var xArray: [Int] = []
//    var yArray: [Int] = []
//    for (_,array) in v.enumerated() {
//        
//        if(xArray.contains(array[0])){
//            let exitIndex = xArray.index(of:array[0])
//            xArray.remove(at:exitIndex!)
//            
//        }else{
//            xArray += [array[0]]
//        }
//        
//        if(yArray.contains(array[1])){
//            let exitIndex = yArray.index(of:array[1])
//            yArray.remove(at:exitIndex!)
//            
//        }else{
//            yArray += [array[1]]
//        }
//    }
//    ans = xArray
//    ans += yArray
//     return ans
//}
//
//
//solution3([[1,4],[3,4],[3,10]])
//
//
//
//
//
//
//
//func solution4(_ board:[[Int]]) -> Int
//{
//    var answer:Int = 0
//    var maxArray: [Int]  = []
//    for array in board {
//       var max = 0
//        var maxlength = 0
//        var width = 0
//        for value in array{
//            // 한줄에 최대 길이 구하기
//            if(value == 1 ){
//                max += 1
//                if(max > maxlength){
//                    maxlength = max
//                }
//            }else{
//                max = 0
//            }//최대길이 끝
//        }
//        maxArray += [maxlength]
//        if(maxlength >= width){
//        
//            wi
//        }
//    }
//    var width = 0
//    
//    for i in maxArray{
//    
//        width = i
//        for idx in 0...i{
//        
//            
//        
//        }
//    
//    }
//    
//    print(maxArray)
//    
//    
//    return answer
//}
//
//solution4([[0,0,1,1],[1,1,1,1]])
//
//




func solution(_ dartResult:String) -> Int {
    
    let strArray = Array(dartResult.characters)
    var result:[Int]  = []
    for  digit in strArray {
    
        
        
        if let num =  Int(String(digit)) {
            
                result.append(num)
            
            
        }else{
            let lastNum = result.last!
            let lastIndex = result.index(of: lastNum)
            switch digit {
            case "S":
                result[lastIndex] = lastNum
            case "D":
                result[lastIndex] = lastNum * lastNum
            case "T":
                result[lastIndex] = lastNum * lastNum * lastNum
            case "#":
                result[lastIndex] = lastNum * 2

            case "*":
                result[lastIndex] =  -lastNum


            default:
                break
            }
        
        }
       
       
        
    
    }
     var last = result.reduce(0, +)
    print(last)
    return 0
}


solution("1S2D*3T")


