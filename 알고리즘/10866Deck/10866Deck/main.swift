//
//  main.swift
//  10866Deck
//
//  Created by 진호놀이터 on 2017. 9. 12..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import Foundation
public struct Deque<T> {
    
    fileprivate var dequeArray = [T]()
    public var size:Int { return dequeArray.count}
    public var isEmpty:Bool {return dequeArray.isEmpty}
    public var front: T {
        if  dequeArray.first != nil{
            return dequeArray.first!
        }
        return -1 as! T
    }
    
    public var back: T {
        if dequeArray.last != nil{
            
            return dequeArray.last!
        }
        return -1 as! T
    }
    
    public mutating func push_front(input: T){
    
        dequeArray.insert(input, at: 0)
        
    }
    public mutating func push_back(input: T){
        dequeArray.append(input)
    }
    
    public mutating func pop_front() -> T{
        
        if dequeArray.first != nil{
            
            return dequeArray.removeFirst()
        }
        return -1 as! T
    }
    public mutating func pop_back() -> T{
        if dequeArray.last != nil {
            return dequeArray.removeLast()
        }
        return -1 as! T
    }

}

let  cycle = readLine()!.components(separatedBy: " ").map({Int($0)!})
var  deque = Deque<Int>()


for  _ in 1...cycle[0]{
    
    let command = readLine()!.components(separatedBy: " ").map({String($0)})
    var output: Int? = nil
    switch command[0]! {
    
    case "push_front":
        
        deque.push_front(input:Int(command[1]!)!)
    case "push_back":
        
        deque.push_back(input:Int(command[1]!)!)
    case "pop_front":
        
        output = deque.pop_front()
    case "pop_back":
    
       output = deque.pop_back()
        
    case "front":
        
        output = deque.front
        
    case "back":
        
        output = deque.back
        
    case "size":
        
        output = deque.size
        
    case "empty":
        
        output = deque.isEmpty ? 1 : 0

    default :
            output = -1
        
    }
    
    if let outNumber = output{
        
        print(outNumber)
        
    }

}



