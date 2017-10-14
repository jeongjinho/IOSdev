//
//  PinerLayoutDelegate.swift
//  PinterStyleCollectionView
//
//  Created by 진호놀이터 on 2017. 7. 31..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

@objc public protocol PinterLayoutDelegate {
    
    //이미지의 높이,글의 높이가 필요합니다.
 @objc optional  func collectionView(collectionView: UICollectionView,
                        sizeForSectionFooterViewForSection section: Int) -> CGSize
 @objc optional  func collectionView(collectionView: UICollectionView,
    sizeForSectionHeaderViewForSection section: Int) -> CGSize
    
    
    func collectionView(collectionView: UICollectionView,
                        heightForImageAtIndexPath indexPath: IndexPath,
                        withWidth: CGFloat) -> CGFloat

    func collectionView(collectionView:UICollectionView,heightForAnnotationAtIndexPath indextPath:IndexPath,withWidth:CGFloat) -> CGFloat
    
    
    

}
