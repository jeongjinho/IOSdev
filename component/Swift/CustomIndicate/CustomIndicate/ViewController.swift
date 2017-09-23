//
//  ViewController.swift
//  CustomIndicate
//
//  Created by 진호놀이터 on 2017. 7. 27..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class ViewController: UIViewController,CAAnimationDelegate {

    let size = CGSize(width: 50.0, height: 50.0)
    let circleView = UIView()
    var spinnerView: CircularIndicator?
    let circleLayer = CAShapeLayer()
    let progressIndicatorView = CircularIndicator(frame:CGRect.zero)
    
    override func viewDidAppear(_ animated: Bool) {
        
            super.viewDidAppear(animated)
        
    //    circleView.frame.size = size
        
   //     circleLayer.frame.size = size
   //     circleLayer.position = circleView.center
   //     circleLayer.path = UIBezierPath(ovalIn: circleView.frame).cgPath
   //     circleLayer.lineWidth = 6.0
   //     circleLayer.strokeStart = 0.0
  //      circleLayer.strokeEnd = 0.2
  //      circleLayer.lineCap = kCALineCapRound
  //      circleLayer.fillColor = UIColor.clear.cgColor
  //      circleLayer.strokeColor = UIColor.orange.cgColor
  //      circleView.layer.addSublayer(circleLayer)
//     circleView.center = view.center
   //     circleView.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
  //      view.addSubview(circleView)
  //      animate()
    }
    
   
    func animate() {
   //     let newTransform = CATransform3DRotate(circleLayer.transform, CGFloat(M_PI_2), 0, 0, 1)
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.fromValue = 0 * CGFloat(M_PI/180)
        rotationAnimation.toValue = 360 * CGFloat(M_PI/180)
        rotationAnimation.duration = Double(1.6)
        rotationAnimation.repeatCount = HUGE
        self.circleLayer.add(rotationAnimation, forKey: "rotateInner")
       // circleLayer.transform = newTransform
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
       // view.addSubview(circleView)
    }
    @IBAction func touchUpInsideBtn(_ sender: UIButton) {
            let frames = CGRect(x: 0, y: 0, width: 60, height: 60)
            spinnerView = CircularIndicator(frame: frames)
            spinnerView?.center = view.center
            self.view.addSubview(spinnerView!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

