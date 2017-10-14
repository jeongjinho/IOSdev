//
//  PinterCell.swift
//  PinterStyleCollectionView
//
//  Created by 진호놀이터 on 2017. 7. 31..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class PinterCell: UICollectionViewCell {
    
   
    @IBOutlet weak var imageViewHeightLayoutConstraint: NSLayoutConstraint!
    @IBOutlet weak var pinterLbl: UILabel!
    @IBOutlet weak var pinerImgView: UIImageView!
    fileprivate var imageHeight: CGFloat!

    
    
   
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        if let attributes = layoutAttributes as? pinterLayoutAttributes {
            //change image view height by changing its constraint
            imageViewHeightLayoutConstraint.constant = attributes.imageHeight
        }
    }
}
