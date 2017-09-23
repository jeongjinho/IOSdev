//
//  CircularIndicator.swift
//  CustomIndicate
//
//  Created by 진호놀이터 on 2017. 7. 27..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class CircularIndicator: UIView {
      let circleLayer = CAShapeLayer()
         let smaillCircleLayer = CAShapeLayer()
        let smallView = UIView()
    let bigView = UIView()
    let circleRadius : CGFloat = 20.0
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure(frame: frame)
        
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        
        
    }
    
    func configure(frame:CGRect) {
        let size = frame.size
        self.frame.size = size
        self.addSubview(bigView)
        bigView.frame = CGRect(x: 10, y:10, width: self.frame.size.width - 20, height: self.frame.size.height - 20)
        bigView.center =  self.center
        circleLayer.frame.size = size
        circleLayer.position = self.center
        circleLayer.path = UIBezierPath(ovalIn: bigView.bounds).cgPath
        circleLayer.lineWidth = 4.0
        circleLayer.strokeStart = 0.0
        circleLayer.strokeEnd = 0.5
        circleLayer.lineCap = kCALineCapRound
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = UIColor.orange.cgColor
        bigView.layer.addSublayer(circleLayer)
        
        
        self.addSubview(smallView)
        smallView.frame = CGRect(x: 0, y:0, width: self.frame.size.width - 40, height: self.frame.size.height - 40)
            smallView.center =  self.center
        smaillCircleLayer.frame.size = size
        smaillCircleLayer.position = self.center
      
        print(self.frame);
        smaillCircleLayer.path = UIBezierPath(ovalIn: smallView.bounds).cgPath
        smaillCircleLayer.lineWidth = 3.0
        smaillCircleLayer.strokeStart = 0.0
        smaillCircleLayer.strokeEnd = 0.5
        
        smaillCircleLayer.lineCap = kCALineCapRound
        smaillCircleLayer.fillColor = UIColor.clear.cgColor
        smaillCircleLayer.strokeColor = UIColor.blue.cgColor
        smallView.layer.addSublayer(smaillCircleLayer)
        
        //self.center = view.center
        self.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
        //view.addSubview(circleView)
        animate()
    }
    
    func animate() {
        //     let newTransform = CATransform3DRotate(circleLayer.transform, CGFloat(M_PI_2), 0, 0, 1)
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.fromValue = 0 * CGFloat(M_PI/180)
        rotationAnimation.toValue = 360 * CGFloat(M_PI/180)
        rotationAnimation.duration = Double(1.6)
        rotationAnimation.repeatCount = HUGE
        self.bigView.layer.add(rotationAnimation, forKey: "rotateInner1")
        
        
        let rotationAnimation2 = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation2.fromValue = 360 * CGFloat(M_PI/180)
        rotationAnimation2.toValue =  0 * CGFloat(M_PI/180)
        rotationAnimation2.duration = Double(2.0)
        rotationAnimation2.repeatCount = HUGE
        //self.smaillCircleLayer.add(rotationAnimation2, forKey: "rotateInner2")
        self.smallView.layer.add(rotationAnimation2, forKey: "rotateInner2")

        // circleLayer.transform = newTransform
    }
    
    
}
