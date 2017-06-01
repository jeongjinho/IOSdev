//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// 미니 알피지 게임을 만들어보자

// 일단 게임은 머드게임 

// 전사 마법사가 싸운다 

// 전사클래스 - 야만인 bitable protocol
//         - 펜서 pesible protocol
// 마법사클래스
//         - 네크로멘서
//         - 엘레멘탈마스터

//class Charater{
//    var id : String
//    var level : Int = 1 {
//    
//        didSet{
//        
//            print("\(level)로 레벨업 했습니다.")
//        }
//    }
//
//    var hp : Int = 0
//    var mp : Int = 0
//    
//    init(id : String) {
//        self.id = id
//    }
//    
//}
// 
//protocol damagable {
//    var from: String
//    var to: String
//    func slash()
//}
//protocol hited {
//    var from: String
//    var to: String
//    func hited(damage : Int)
//}
//class Worrier : Charater,damagable{
//  
//    var strength :Int = 50
//    
//    var power : Int{
//    
//    
//        get{
//        
//            return self.strength * self.level
//        
//        }
//    
//    }
//    func slash() -> Int {
//        print("\(self.power)의 데미지를 입힙니다.")
//     return self.strength
//        
//    }
//   
//    
//    func hited(damage: Int) {
//        
//        print("\(damage)만큼 데미지를 입었습니다.")
//    }
//
//}
//




//
// var jinho : Worrier = Worrier(id: "zino")
//var sang : Worrier = Worrier(id: "sa")
//print("\(jinho.level)")
//
//
//jinho.slash()








//  Swift   intialize  활용
//struct BodyInfo{
//    
//    var height: Float = 5.0
//    var weight: Float = 5.0
//    
//    init(height: Float , weight: Float) {
//        
//        self.height = height
//        self.weight = weight
//    }
//    
//
//}
//
//
//
//class Person {
//
//
//    var body : BodyInfo?
//    var name : String?
//    var obesity: BodyInfo {
//    
//        get{
//            
//            let obe = body?.height/body?.weight
//
//            return obe
//        }
//    
//    
//    }
//    
//    init() {
//        
//    }
//    
//    init(name: String , body:BodyInfo) {
//        
//        self.name = name
//        self.body = body
//    }
//    
//    
//    
//    init(name:String) {
//        
//       self.name = name
//
//}
//
//}
//var man1 = Person()
//
//man1.name = "진호"
//print("man1의 이름은 : \(man1.name)")




struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0),
                  size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
// Prints "square.origin is now at (10.0, 10.0)"








































