//
//  ViewAtt.swift
//  DynamicTableView
//
//  Created by 진호놀이터 on 2017. 7. 10..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class ViewAtt: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let frame = CGRect(x: 0, y:self.frame.size.height - 2, width:self.frame.size.width, height:2)
        let underView = UIView.init(frame: frame)
        underView.backgroundColor = .blue
        self.addSubview(underView)
        
    }


}
