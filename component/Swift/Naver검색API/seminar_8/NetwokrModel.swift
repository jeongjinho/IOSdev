//
//  NetwokrModel.swift
//  seminar_8
//
//  Created by 하태경 on 2017. 6. 3..
//  Copyright © 2017년 addcampus. All rights reserved.
//


class NetwokrModel : NetworkCallback {


    //internal -  앱, 모듈, 프레임워크의 내부구조를 칭할때
    internal let naverAPI = "https://openapi.naver.com/v1/search/movie.json"
    
    var view : NetworkCallback
    
    init(_ view:NetworkCallback){
        self.view = view
    }
    
    
    func gsno(_ value:String?)-> String{
        
        if let value_ = value{
            return value_
        }else{
            return ""
        }
        
    }//func gsno
    
    func gino(_ value:Int?) -> Int{
        
        if let value_ = value{
            return value_
        }else{
            return 0;
        }
        
    }//func gino
    
    func gbno(_ value:Bool?)->Bool{
        if let value_ = value{
            return value_
        }else
        {
            return false
        }
        
    }//func gbno
    
    func gfno(_ value:Float?)->Float{
        if let value_ = value{
            return value_
        }else
        {
            return 0
        }
        
    }
    //func gfno
    
    func networkResult(resultData: Any, code: String) {
        
    }
    func networkFailed() {
        print("Error : Network")
    }
    
    

}
