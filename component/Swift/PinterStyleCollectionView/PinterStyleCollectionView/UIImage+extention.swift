//
//  UIImage+extention.swift
//  PinterStyleCollectionView
//
//  Created by 진호놀이터 on 2017. 7. 31..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit
import AVFoundation



public extension UIImage {
    /**
     Calculates the best height of the image for available width.
     */
    public func height(forWidth width: CGFloat) -> CGFloat {
        let boundingRect = CGRect(
            x: 0,
            y: 0,
            width: width,
            height: CGFloat(MAXFLOAT)
        )
        let rect = AVMakeRect(
            aspectRatio: size,
            insideRect: boundingRect
            
        )
        print(rect.size.height)
        return rect.size.height
    }
}
extension UIFont {
    
    class var defaultFont: UIFont {
        return UIFont(name: "Arial-ItalicMT", size: 11)!
    }
}

public extension String {
    /**
     Calculates the best height of the text for available width and font used.
     */
    public func heightForWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let rect = NSString(string: self).boundingRect(
            with: CGSize(width: width, height: CGFloat(MAXFLOAT)),
            options: .usesLineFragmentOrigin,
            attributes: [NSFontAttributeName: font],
            context: nil
        )
        return ceil(rect.height)
    }
}
