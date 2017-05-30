//
//  ViewController.swift
//  0323work01
//
//  Created by 진호놀이터 on 2017. 3. 28..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    let userID = "yyyqor"
    let userPW = "1234"

    override func viewDidLoad() {
        super.viewDidLoad()
               // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func touchUpInsideLoginButton(_ sender: Any) {
        
        
             guard idTextField.text != nil else { return
        }
        
        
               if idTextField.text?.isEmpty == true  {
            simpleAlert(title: "입력 오류", message: "ID를 입력해주세요.")
            return
            
               } else if (idTextField.text?.characters.count)!<5 || (pwTextField.text?.characters.count)!<5{
                
                
                
                  simpleAlert(title: "입력 오류", message: "형식에 맞지 않습니다..")
                
               } else {
        
                simpleAlert(title: "로그인 진행", message: "로그인 확인이 진행 중 입니다")
        
        }
        
        
        
        
    }
    func simpleAlert(title:String, message msg:String){
       
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title:"확인",style:.default)
      
        let cancelAction = UIAlertAction(title:"취소",style:.cancel)
        
        
      
        alert.addAction(okAction)
        alert.addAction(cancelAction)
       
        present(alert,animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

