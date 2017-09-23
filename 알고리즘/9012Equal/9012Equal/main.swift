//
//  main.swift
//  9012Equal
//
//  Created by 진호놀이터 on 2017. 9. 9..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import Foundation
public struct Stack<T> {
    fileprivate var stackArray: [T] = []
    public var size:Int{ return stackArray.count}
    public var top: T? { return stackArray.last}
    public var isEmpty: Bool{return stackArray.isEmpty}
    public mutating func push(_ input:T){ return stackArray.append(input)}
    public mutating func pop() -> T?{return stackArray.popLast()}
    public mutating func clear(){self.stackArray = [T]()}
    
}

let T = readLine()!.components(separatedBy: " " ).map({Int($0)})[0]!

for _ in 0..<T{
var stack = Stack<String>()
var isVPS: String = "YES"
let caseArray = String(readLine()!.components(separatedBy: " ")[0])!.characters.map({String($0)})
    for equal in caseArray{
        if(equal == "("){ stack.push(equal)}
        else if(equal == ")"){
            if(stack.isEmpty){
                isVPS = "NO"
                break
            }else{
              var _ = stack.pop()
            }
        }
    }
    
    if(!stack.isEmpty){isVPS = "NO"}
    print(isVPS)
    
}


