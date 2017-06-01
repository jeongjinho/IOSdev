//
//  ViewController3.swift
//  0325weekExaple01
//
//  Created by 진호놀이터 on 2017. 3. 25..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {
    @IBOutlet weak var currentImageVIew: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    @IBAction func touchUpInsideRightButton(_ sender: Any) {
    }
  
    @IBAction func touchUpInsideIUpButton(_ sender: Any) {
        
        currentImageVIew.frame.origin.x = currentImageVIew.frame.origin.x
        currentImageVIew.frame.origin.y-=5.0
    }

    @IBAction func touchUpInsideDownButton(_ sender: Any) {
        currentImageVIew.frame.origin.x = currentImageVIew.frame.origin.x
        currentImageVIew.frame.origin.y+=5.0
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
