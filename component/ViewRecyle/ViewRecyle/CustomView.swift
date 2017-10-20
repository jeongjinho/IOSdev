//
//  CustomView.swift
//  ViewRecyle
//
//  Created by 진호놀이터 on 2017. 10. 13..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import Foundation
import UIKit


class CustomView: UIView {
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        print("init with coder")
//        self.backgroundColor = UIColor.blue
   //     fatalError("init(coder:) has not been implemented")
    }
    
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        print("init with frame")
          self.backgroundColor = UIColor.blue
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        print("draw")
        self.backgroundColor = UIColor.blue
        
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        print("willmovetoSuperview")
    }
    override func invalidateIntrinsicContentSize() {
        super.invalidateIntrinsicContentSize()
        print("invalidateIntrinsicContentSize")
    }
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        print("didMoveToSuperview")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("awakeFromNib")
         self.backgroundColor = UIColor.blue
    }
    override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toSuperview: newWindow)
        print("WillMoveToWindow")
    }
    override func needsUpdateConstraints() -> Bool {
        super.needsUpdateConstraints()
        print("needsUpdateConstraints")
        return false
    }
    override func didMoveToWindow() {
        super.didMoveToWindow()
        print("didMoveToWindow")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("layoutSubviews")
    }
}
