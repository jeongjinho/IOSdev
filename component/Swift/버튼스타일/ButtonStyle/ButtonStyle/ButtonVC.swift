//
//  ButtonVC.swift
//  ButtonStyle
//
//  Created by 진호놀이터 on 2017. 6. 22..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class ButtonVC: UIViewController {

    @IBOutlet weak var basicButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        let btnVM = ButtonViewModel.init(fontColor: UIColor.orange, text: "안녕", borderColor: UIColor.brown, borderWidth: 3, borderRadius:Float(basicButton.frame.height/2), backgroundColor: .white)
        
        self.basicButton.configureButton(style:.fillStyle, buttonVM: btnVM)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
