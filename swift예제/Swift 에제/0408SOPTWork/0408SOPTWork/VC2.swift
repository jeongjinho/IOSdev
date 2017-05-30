//
//  VC2.swift
//  0408SOPTWork
//
//  Created by 진호놀이터 on 2017. 4. 8..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class VC2: UIViewController {
    
//  var textString :String?
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var pwLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        idLabel.text = UserDefaults.standard.string(forKey:UserDefaultString.ID)
        pwLabel.text = UserDefaults.standard.string(forKey: UserDefaultString.PW)
        nameLabel.text = UserDefaults.standard.string(forKey: UserDefaultString.NAME)
        ageLabel.text = UserDefaults.standard.string(forKey: UserDefaultString.AGE)
    
    }
    
    @IBAction func touchUpInsideBackButton(_ sender: UIButton) {
        
      DefaultAlert().basicAlert(title: "로그아웃", inputMessage: "로그아웃을 하시겠습니까?", viewController: self, alertButtonStyle:AlertButtonStyle.TwoButtonStyle)
        //로그아웃시 모두 지우기
//        for key in UserDefaults.standard.dictionaryRepresentation().keys {
//            UserDefaults.standard.removeObject(forKey:key.description)
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
