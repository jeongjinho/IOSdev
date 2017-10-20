//
//  main.swift
//  1717Set
//
//  Created by 진호놀이터 on 2017. 10. 16..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import Foundation
struct UnionSet{
    fileprivate var unionSetArray = [Int]()
    public init(num:Int){
        
        unionSetArray = Array(0...num)
        
    }
    
    public mutating func union(x:Int , y:Int){
        
        let px = find(x: x)
        let py = find(x: y)
        
        unionSetArray[py] = px
        
    }
    public mutating func find(x:Int) -> Int{
        
        
        if(x == unionSetArray[x]){
            
            return x
            
        }else{
            
            unionSetArray[x] = find(x:unionSetArray[x])
            
            
            return unionSetArray[x]
            
        }
    }
    
    
    public mutating func getParent(x:Int , y:Int)->String{
        
        if unionSetArray[x] == unionSetArray[y] {
            return "YES"
        }else{
            
            return "NO"
        }
        
        
    }
    
    
}


var input = readLine()!.characters.split(separator: " ").map({ Int(String($0))!})

var maximum =  input[0]
let arr = Array(0...maximum)
var unionSet = UnionSet(num: maximum)


var cycle = input[1]


var cmd : [Int]!
for _ in 0...cycle-1{

     cmd = readLine()!.characters.split(separator: " ").map({ Int(String($0))!})
    
    if(cmd[0] == 0){
        
        unionSet.union(x: cmd[1], y: cmd[2])
        
    }else{
        
   let st  =   unionSet.getParent(x:cmd[1], y: cmd[2])
        print(st)
    }
}

//var cycleArray = readLine()!.characters.split(separator: " ").map({ Int(String($0))!})





