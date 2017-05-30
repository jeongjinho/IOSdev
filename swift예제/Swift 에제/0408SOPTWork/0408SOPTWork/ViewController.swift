//
//  ViewController.swift
//  0408SOPTWork
//
//  Created by 진호놀이터 on 2017. 4. 8..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate {

    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.idTextField.delegate = self
        self.pwTextField.delegate = self
        pwTextField.isSecureTextEntry = true
       
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField == idTextField) {
            self.idTextField.resignFirstResponder()
          
        } else {
        
            self.pwTextField.resignFirstResponder()
        }
        
        return true
        }
    
    @IBAction func touchUpInsideSignUp(_ sender: UIButton) {
        //비강제
       // let vc =  storyboard?.instantiateViewController(withIdentifier: "SighUpPage")  as! VC
        
        
       guard let vc = storyboard?.instantiateViewController(withIdentifier: "SighUpPage")  as? VC else { return
        
        }
         Utility().myLog(object: "VC로 이동합니다.\n")
        
       self.navigationController?.pushViewController(vc, animated:false)
        
        idTextField.text = ""
        pwTextField.text = ""
    
        
    }
   
    @IBAction func touchUpInsideLoginButton(_ sender: UIButton) {
        
        if(idTextField.text == UserDefaults.standard.string(forKey:UserDefaultString.ID) && pwTextField.text == UserDefaults.standard.string(forKey:UserDefaultString.PW)){
            
            self.performSegue(withIdentifier: "VC2", sender:self)
            
        } else{
            Utility().myLog(object: "로그인정보가 맞지 않습니다.\n")
            idTextField.becomeFirstResponder()
            DefaultAlert().basicAlert(title:"로그인", inputMessage: "아이디 혹은 비밀번호가 맞지 않습니다.", viewController: self, alertButtonStyle: AlertButtonStyle.OneButtonStyle)
        }
        
        idTextField.text = ""
        pwTextField.text = ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

