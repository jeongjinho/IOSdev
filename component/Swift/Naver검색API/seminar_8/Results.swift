//
//  Results.swift
//  seminar_8
//
//  Created by 진호놀이터 on 2017. 6. 3..
//  Copyright © 2017년 addcampus. All rights reserved.
//

import Foundation
import ObjectMapper


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



class NaverMovieVO: Mappable {

    var display  :Int?
    var items: [itemVO]?


    required init?(map: Map) {
        
        
    }
    
    
     func mapping(map: Map) {
        
        display <- map["display"]
        items <- map["items"]
    }
    

}



