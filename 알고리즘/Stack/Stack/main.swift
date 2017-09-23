//
//  main.swift
//  Stack
//
//  Created by 진호놀이터 on 2017. 9. 7..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import Foundation





public struct Stack<T>{

    fileprivate var array = [T]()

    
    public var size: Int{
    
    
        return array.count
    
    }
    
    public var top: T?{
    
    
        return array.last
    }
    
    public var isEmpty: Bool {
    
        return array.isEmpty
    }
    
    public mutating func push(_ element: T){
    
    
        array.append(element)
    }

    
    public mutating func pop() -> T?{
    
        return  array.popLast()
        
    }
}


//typealias Command = (command: String, input: String?)
var cycleArray = readLine()!.characters.split(separator: " ").map({ Int(String($0))!})
var cycle = cycleArray[0]

var stack = Stack<Int>()

var cmd : [String]!
for _ in 0...cycle-1  {

 
  cmd = readLine()!.characters.split(separator: " ").map({String($0)})
    
    
    
  //  var cmdSet: Command = Command(cmd[0],cmd[1])
    var result: Int?
    
    switch cmd[0]{
    
        case "push" :
            stack.push(Int(cmd[1])!)
        case "pop" :
            result = stack.pop()
        case "empty" :
            result = stack.isEmpty ? 1 : 0
        case "size" :
            result = stack.size
        case "top" :
            result = stack.top
        default :
            result = -1
    }
    
    if let outNumber = result{
    
        print(outNumber)
    
    }else if(stack.isEmpty == true){
        
        print(-1)
    }
    
    
    
}






