//
//  ViewController2.swift
//  0325weekExaple01
//
//  Created by 진호놀이터 on 2017. 3. 25..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    @IBOutlet weak var currentNumberLable: UILabel!
    var number :Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func touchUpInsidePlusButton(_ sender: Any) {
        
        number+=1
        
        currentNumberLable.text = "\(number)"
        
        
    }
   
    @IBAction func touchUpInsideMinusButton(_ sender: Any) {
        
        number-=1
        
        currentNumberLable.text = "\(number)"
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
