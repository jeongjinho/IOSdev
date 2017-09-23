//
//  TasteModel.swift
//  NaverTasteAPI
//
//  Created by 진호놀이터 on 2017. 7. 27..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit
import ObjectMapper
import Alamofire
import AlamofireObjectMapper
class TasteNM: NSObject {
    
     let naverSearchURL = "https://openapi.naver.com/v1/search/local.json"
    var completeHanlder:  (([itemVO]) -> Void)!
    
    func getTasteStoreInfo(keyword:String,completeHandler: (([itemVO]) -> Void)){
    
        
        let header: HTTPHeaders = [
            
            "X-Naver-Client-Id" : "nIL6wOC5nCIyU4tkEEBx",
            "X-Naver-Client-Secret" : "DTwCMel8sc"
            
        ]
        
        let body = [
            
            "query" : keyword,
            "display" : 50
            
            ] as [String : Any]
        
        Alamofire.request(naverSearchURL, method: .get, parameters:body, encoding: URLEncoding.queryString, headers: header).responseObject {
            
            ( response:DataResponse<NaverSearchVO>) in
            
            switch response.result {
                
                
                
            case .success:
                
                guard let message = response.result.value else{
                    
               //     self.networkFailed()
                    return
                }
                
                if let  movies = message.items{
                    
                 //   self.view.networkResult(resultData:movies, code: "move-1")
                }
                
            case .failure(let err) :
                
               // self.view.networkFailed()
                print(err)
            }
            
        }
        
    }
    
    

}

class itemVO:Mappable{
    
    var title: String?
    var image: String?
    var director : String?
    var actor :String?
    var userRating: String?
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        title <- map["title"]
        image <- map["image"]
        director <- map["director"]
        actor <- map["actor"]
        userRating <- map["userRating"]
        
    }
    
}



class NaverSearchVO: Mappable {
    
    var display  :Int?
    var items: [itemVO]?
    
    
    required init?(map: Map) {
        
        
    }
    
    
    func mapping(map: Map) {
        
        display <- map["display"]
        items <- map["items"]
    }
    
    
}



