//
//  main.swift
//  StackSequence
//
//  Created by 진호놀이터 on 2017. 9. 8..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import Foundation





public struct Stack<T>{
    
    
    fileprivate var stackArray = [T]()
    
    public var size: Int{
        
        return stackArray.count
        
    }
    
    public var top: T{
        
        if stackArray.last == nil {
            return 0 as! T
        }else {
        
            return stackArray.last!
        
        }
        
        
        
    }
    public var isEmpty: Bool{
        
        return stackArray.isEmpty
    }
    
    
    public mutating func push(_ input: T){
        
        stackArray.append(input)
        
    }
    
    public mutating func pop() -> T?{
        
        return  stackArray.popLast()
        
    }
    
}


var cycleNumber = readLine()!.components(separatedBy: " ").map({ Int($0)})[0]!
var numArray:[Int] = []
var flagArray:[String] = []
var stack = Stack<Int>()
var currentIndex: Int = 0
var flag = 0
for i in 0..<cycleNumber{
    let sequenceNumber =  readLine()!.components(separatedBy: " ").map({ Int($0)})[0]!
    
    numArray += [sequenceNumber]
    
}

  //  print(numArray)
    

for i in 0...cycleNumber - 1{
    
    if stack.isEmpty {
    
        stack.push(i+1)
        flagArray.append("+")
        currentIndex = stack.top
    }
    //print(numArray[i])
    //print(stack.top)
    if(stack.top > numArray[i] || numArray[i] > cycleNumber){
    
        flag = 1
        break
    
    }
    
    
   else if(stack.top != numArray[i]){
    
        while currentIndex < numArray[i]{
            currentIndex += 1
            stack.push(currentIndex)
             flagArray.append("+")
        }
    
    }
    
    if(stack.top == numArray[i]){
        
      var _ = stack.pop()
         flagArray.append("-")
    }
    
   
    
}


if(flag == 1){
    
    print("NO")
} else {

    for i in flagArray{
        
        print(i)
        
    }

}




    
//    if(stack.top == sequenceNumber){
//        
//    var _  =  stack.pop()
//        flagArray.append("-")
//    }else if( currentIndex < sequenceNumber && sequenceNumber <=
//        cycleNumber){
//        
//        while(currentIndex < sequenceNumber){
//            currentIndex += 1
//            stack.push(currentIndex)
//             flagArray.append("+")
//        }
//        
//     var _ =  stack.pop()
//        flagArray.append("-")
//        
//    }else{
//        print("NO")
//        flag = 1
//        break
//    }

























