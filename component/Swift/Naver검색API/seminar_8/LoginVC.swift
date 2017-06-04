//
//  LoginVC.swift
//  seminar_8
//
//  Created by 하태경 on 2017. 6. 2..
//  Copyright © 2017년 addcampus. All rights reserved.
//

import Foundation

import UIKit

class LoginVC : UIViewController,UITextFieldDelegate,UIGestureRecognizerDelegate{
    
    
    
    @IBOutlet var idTxt: UITextField!
    @IBOutlet var pwTxt: UITextField!
    @IBOutlet var loginBtn: UIButton!
    @IBOutlet var sopt_logo: UIImageView!
   
    let ud = UserDefaults.standard
    
    let accountSequence = 150621
    let userID = "ios"
    let userPW = "1234"
   
    var check = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.idTxt.delegate = self
        self.pwTxt.delegate = self
        let tap = UITapGestureRecognizer(target: self, action:#selector(hanldeTap(_:)))
        
        tap.delegate = self
        self.view.addGestureRecognizer(tap)
    }
    
    func hanldeTap(_ sender:UITapGestureRecognizer){
    
        print("tap")
        self.idTxt.resignFirstResponder()
        self.pwTxt.resignFirstResponder()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
  
        registerForKeyboardNotifications()
    }
    override func viewWillDisappear(_ animated: Bool) {
        
       unregisterForKeyboardNotifications()
    }
    

    @IBAction func loginBtn(_ sender: Any) {
        guard let id = idTxt.text, let pw = pwTxt.text else {
            return
        }
        
        if id.isEmpty {
        
        simplerAlert(title: "오류", message: "ID를 입력해주세요")
        
        }
        else if pw.isEmpty{
            simplerAlert(title: "오류", message: "PW를 입력해주세요")
        }
        else if isValid(){
        //스토리보드 객체 생성
        let main_storyboard = UIStoryboard(name: "Main", bundle: nil)
         //메인 뷰컨트롤러 접근
            guard let main = main_storyboard.instantiateViewController(withIdentifier: "MainVC") as? MainVC else{return}
        
            ud.set(id, forKey: "id")
            ud.set(accountSequence, forKey: "accountSequence")
            
            present(main, animated: true)
        }
        else{
            simplerAlert(title: "오류", message: "존재하지 않는 ID거나 비밀번호가 일치하지 않습니다")
        }
    }//loginBtn
    
    
    
    func isValid() -> Bool {
        
        if idTxt.text == userID {
            if pwTxt.text == userPW {
                return true
            } else {
                return false
            }
        }
        
        else {
            return false
        }
    }
    
    
    //키보드 높이에 따른 뷰 조절
    func keyboardWillShow(notification: NSNotification) {
        
        
        if check {
            if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                
                
                let keyboard_height = keyboardSize.height
                
                loginBtn.frame.origin.y -= keyboard_height
                idTxt.frame.origin.y -= keyboard_height
                pwTxt.frame.origin.y -= keyboard_height
                sopt_logo.isHidden = true
                view.layoutIfNeeded()
                check = false
            }//if let keyboardSize
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.idTxt.resignFirstResponder()
        self.pwTxt.resignFirstResponder()
        return true
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        
        if (touch.view?.isDescendant(of: idTxt))! || (touch.view?.isDescendant(of: pwTxt))! {
            
            return false
        }
        return true
    }
    
    func keyboardWillHide(notification: NSNotification) {
        
        
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                let keyboard_height = keyboardSize.height
            loginBtn.frame.origin.y += keyboard_height
            idTxt.frame.origin.y += keyboard_height
            pwTxt.frame.origin.y += keyboard_height
            sopt_logo.isHidden = false
            view.layoutIfNeeded()
            check = true
        }
        
    }
    
    
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillHide), name: .UIKeyboardWillHide, object: nil)
    }
    
    func unregisterForKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name:.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name:.UIKeyboardWillHide, object: nil)
    }
    
    
}
