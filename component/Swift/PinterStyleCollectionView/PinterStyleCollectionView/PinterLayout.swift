//
//  PinterLayout.swift
//  PinterStyleCollectionView
//
//  Created by 진호놀이터 on 2017. 7. 31..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class PinterLayout: UICollectionViewLayout {

    public var pintercollectionView:UICollectionView!
    public var delegate: PinterLayoutDelegate!
    /**
     Number of columns.
     */
    public var numberOfColumns: Int = 1
    /**
     Cell padding.
     */
    public var cellPadding: CGFloat = 20
    
    
    private var cache = [UICollectionViewLayoutAttributes]()
    private var contentHeight: CGFloat = 10
    private var contentWidth: CGFloat {
        get {
            let bounds = pintercollectionView.bounds
            let insets = pintercollectionView.contentInset
            return bounds.width - insets.left - insets.right
        }
    }
    
    override public var collectionViewContentSize: CGSize {
        get {
            return CGSize(
                width: contentWidth,
                height: contentHeight
            )
        }
    }
    
    
    override public class var layoutAttributesClass: AnyClass {
        return pinterLayoutAttributes.self
    }

        //변수에 컬렉션뷰의 섹션값을 가져의 값을 가져온다. (vc에서의 델리게이트구현한 값)
    private var numberOfSections: Int {
        return pintercollectionView.numberOfSections
    }
    // 섹션안에 값도 가져오는데 마찬가지로
    private func numberOfItems(inSection section: Int) -> Int {
        return pintercollectionView.numberOfItems(inSection: section)
    }
    override public func invalidateLayout() {
        cache.removeAll()
        contentHeight = 0
        
        super.invalidateLayout()
    }
    
    override public func prepare() {
        //케시에 아무것도 없다는 것이다. 그렇다면 아직 재사용할게 없다는것 !
        if cache.isEmpty {
            let collumnWidth = contentWidth / CGFloat(numberOfColumns)
            let cellWidth = collumnWidth - (cellPadding * 2)
            
            var xOffsets = [CGFloat]()
            
            for collumn in 0..<numberOfColumns {
                xOffsets.append(CGFloat(collumn) * collumnWidth)
            }
            
            for section in 0..<numberOfSections {
                let numberOfItems = self.numberOfItems(inSection: section)
                
                
                var yOffsets = [CGFloat](
                    repeating: contentHeight,
                    count: numberOfColumns
                )
                
                for item in 0..<numberOfItems {
                    let indexPath = IndexPath(item: item, section: section)
                    
                    let column = yOffsets.index(of: yOffsets.min() ?? 0) ?? 0
                    
                    let imageHeight = delegate.collectionView(
                        collectionView: pintercollectionView,
                        heightForImageAtIndexPath: indexPath,
                        withWidth: cellWidth
                    )
                    let annotationHeight = delegate.collectionView(
                        collectionView: pintercollectionView,
                        heightForAnnotationAtIndexPath: indexPath,
                        withWidth: cellWidth
                    )
                    let cellHeight = cellPadding + imageHeight + annotationHeight + cellPadding
                    
                    let frame = CGRect(
                        x: xOffsets[column],
                        y: yOffsets[column],
                        width: collumnWidth,
                        height: cellHeight
                    )
                    
                    let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
                    let attributes = pinterLayoutAttributes(
                        forCellWith: indexPath
                    )
                    attributes.frame = insetFrame
                    attributes.imageHeight = imageHeight
                    cache.append(attributes)
                    
                    contentHeight = max(contentHeight, frame.maxY)
                    yOffsets[column] = yOffsets[column] + cellHeight
                }
                
            }
        }
    }
    
    override public func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        
        for attributes in cache {
            // if attributes.frame.intersects(rect) {
            layoutAttributes.append(attributes)
            // }
        }
        
        return layoutAttributes
    }
}


