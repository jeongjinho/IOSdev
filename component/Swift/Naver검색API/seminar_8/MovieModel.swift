//
//  MovieModel.swift
//  seminar_8
//
//  Created by 하태경 on 2017. 6. 3..
//  Copyright © 2017년 addcampus. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper


class MovieModel : NetwokrModel{

//    var delegate : NetworkCallback
//    
//    init(delegate:NetworkCallback) {
//        
//        self.delegate = delegate
//    }
    
    func getMoveView(title: String)  {
        
        let header: HTTPHeaders = [
        
            "X-Naver-Client-Id" : "0VyoY3ja1rhPE833pgHu",
            "X-Naver-Client-Secret" : "6oVtNUIDzX"
        
        ]
        
        let body = [
        
            "query" : title,
            "display" : 50
        
        ] as [String : Any]
        
        Alamofire.request(naverAPI, method: .get, parameters:body, encoding: URLEncoding.queryString, headers: header).responseObject {
            
           ( response:DataResponse<NaverMovieVO>) in
            
            switch response.result {
            
            
            
            case .success:
                
                guard let message = response.result.value else{
                
                    self.networkFailed()
                return
                }
                
                if let  movies = message.items{
                
                self.view.networkResult(resultData:movies, code: "move-1")
                }
            
            case .failure(let err) :
                
                self.view.networkFailed()
                print(err)
            }
            
        }
        
    }

    


}
