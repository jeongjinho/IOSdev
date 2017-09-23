//
//  ViewController.swift
//  NaverTasteAPI
//
//  Created by 진호놀이터 on 2017. 7. 27..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var items : [itemVO]?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        TasteNM().getTasteStoreInfo(keyword:"떡볶이") { (item) in
            print("-----------------------")
            print(item);
            
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

