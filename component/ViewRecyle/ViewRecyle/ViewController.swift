//
//  ViewController.swift
//  ViewRecyle
//
//  Created by 진호놀이터 on 2017. 10. 13..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    public var cycleView: CustomView = CustomView()
    override func viewDidLoad() {
        super.viewDidLoad()
       
       // setUPFrame()
    
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
       
    
    
    private func setUPFrame(){
        
            cycleView.frame = CGRect(x: 0, y: 50, width: 300, height: 500)
          
            self.view.addSubview(cycleView)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("----------------")
    }
    
    override func viewWillLayoutSubviews() {
    //    print("viewWillLayoutSubviews")
       // print(cycleView.frame)
    }
    override func viewDidLayoutSubviews() {
     //   print("viewDidLayoutSubviews")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

