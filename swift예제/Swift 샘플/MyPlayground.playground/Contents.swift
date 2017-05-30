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

class Charater{
    var id : String
    var level : Int = 1 {
    
        didSet{
        
            print("\(level)로 레벨업 했습니다.")
        }
    }

    var hp : Int = 0
    var mp : Int = 0
    
    init(id : String) {
        self.id = id
    }
    
}
 
protocol damagable {
    var from: String
    var to: String
    func slash()
}
protocol hited {
    var from: String
    var to: String
    func hited(damage : Int)
}
class Worrier : Charater,damagable{
  
    var strength :Int = 50
    
    var power : Int{
    
    
        get{
        
            return self.strength * self.level
        
        }
    
    }
    func slash() -> Int {
        print("\(self.power)의 데미지를 입힙니다.")
     return self.strength
        
    }
   
    
    func hited(damage: Int) {
        
        print("\(damage)만큼 데미지를 입었습니다.")
    }

}


 var jinho : Worrier = Worrier(id: "zino")
var sang : Worrier = Worrier(id: "sa")
print("\(jinho.level)")


jinho.slash()






