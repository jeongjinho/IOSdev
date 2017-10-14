//
//  pinterLayoutAttributes.swift
//  PinterStyleCollectionView
//
//  Created by 진호놀이터 on 2017. 7. 31..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class pinterLayoutAttributes: UICollectionViewLayoutAttributes {
    
   
    public var imageHeight: CGFloat = 0
    
    override public func copy(with zone: NSZone? = nil) -> Any {
        let copy = super.copy(with: zone) as! pinterLayoutAttributes
        copy.imageHeight = imageHeight
        return copy
    }
    
    override public func isEqual(_ object: Any?) -> Bool {
        if let attributes = object as? pinterLayoutAttributes {
            if attributes.imageHeight == imageHeight {
                return super.isEqual(object)
            }
        }
        return false
    }

    

}
