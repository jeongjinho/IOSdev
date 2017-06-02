//
//  Message+CoreDataProperties.swift
//  fbMessanger
//
//  Created by 진호놀이터 on 2017. 6. 2..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import Foundation
import CoreData


extension Message {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Message> {
        return NSFetchRequest<Message>(entityName: "Message")
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var text: String?
    @NSManaged public var friend: Friend?

}
