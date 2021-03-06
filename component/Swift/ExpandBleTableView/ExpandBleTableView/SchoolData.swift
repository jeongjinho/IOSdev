//
//  SchoolData.swift
//  ExpandBleTableView
//
//  Created by 진호놀이터 on 2017. 6. 6..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import Foundation


public class SchoolData: NSObject{

    
    var schoolName: String?
    var departMents: [DepartMent]?
    var schoolImageName: String?
    
    init(schoolName name: String, schoolImage: String,departMents dpts:[DepartMent]?) {
        self.schoolName = name
        self.schoolImageName = schoolImage
        self.departMents = dpts
    }
}


public class DepartMent: NSObject{

    var departMentName: String?
    var peopleNumber: Int?
    
    init(departMentName dptName: String, peopleNumber peoples:Int) {
        self.departMentName = dptName
        self.peopleNumber = peoples
    }
}
