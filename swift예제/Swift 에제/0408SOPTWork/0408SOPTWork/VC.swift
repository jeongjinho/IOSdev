//
//  VC.swift
//  0408SOPTWork
//
//  Created by 진호놀이터 on 2017. 4. 8..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class VC: UIViewController, UITextFieldDelegate, UIScrollViewDelegate {

    
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var backgroundScrollView: UIScrollView!
    @IBOutlet weak var signUpButton: UIButton!
    var isShowingKeyboard: Bool = false
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
    }
    
    var isAbleSignUp: Bool?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initializingAtrributes()
        
        self.idTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)),
                            for: UIControlEvents.editingChanged)
        self.pwTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)),
                            for: UIControlEvents.editingChanged)
       self.nameTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)),
                            for: UIControlEvents.editingChanged)
        self.ageTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)),
                            for: UIControlEvents.editingChanged)
        
    }
    /**
     VC의 기본적인 설정을 하는 메서드입니다
     
    **/
    func initializingAtrributes() {
        Utility().myLog(object: "ViewDidLoad에 기본설정이 세팅됩니다.\n")
       
        self.idTextField.delegate = self;
        self.pwTextField.delegate = self;
        self.nameTextField.delegate = self;
        self.ageTextField.delegate = self;
        
        //키보드모드에 대한 노티피케이션
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: Notification.Name.UIKeyboardWillHide, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: Notification.Name.UIKeyboardWillChangeFrame, object: nil)
        
    }
    
    func textFieldDidChange(_ textField: UITextField) {
    
        if((idTextField.text?.characters.count)! >= 5 && (pwTextField.text?.characters.count)! >= 2 && nameTextField.text != "" && (ageTextField.text?.characters.count)! > 1){
             Utility().myLog(object: "색깔이 초록색으로변합니다.\n")
          
            self.signUpButton.backgroundColor = AppColors.GreenColor
                isAbleSignUp = true
            
        } else {
             Utility().myLog(object: "색깔이 회색으로변합니다.\n")
     
            self.signUpButton.backgroundColor = AppColors.GrayColor
                isAbleSignUp = false
        }
    }
    
    func adjustForKeyboard(notification:Notification){
        
        if(notification.name == Notification.Name.UIKeyboardWillChangeFrame && isShowingKeyboard == false){
             Utility().myLog(object: "스크롤이 올라갑니다.\n")
            
               self.backgroundScrollView.setContentOffset(CGPoint(x:0, y:self.backgroundScrollView.contentOffset.y+90), animated:true)
               self.isShowingKeyboard = true
            
        } else if(notification.name == Notification.Name.UIKeyboardWillHide){
             Utility().myLog(object: "스크롤이 제자리로 돌아갑니다.\n")
                self.backgroundScrollView.setContentOffset(CGPoint(x:0, y:0), animated:true)
                self.isShowingKeyboard = false
        }
    
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        view.endEditing(true)
        return true;
    }
    
    @IBAction func touchUpInsideSignButton(_ sender: UIButton) {
        
        if(isAbleSignUp == true){
        
            Utility().myLog(object: "양식이 다릅니다.\n")
            UserDefaults.standard.set(idTextField.text, forKey : UserDefaultString.ID )
            UserDefaults.standard.set(pwTextField.text, forKey : UserDefaultString.PW )
            UserDefaults.standard.set(nameTextField.text, forKey : UserDefaultString.NAME )
            UserDefaults.standard.set(ageTextField.text, forKey : UserDefaultString.AGE )
            
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "VC2")  as? VC2 else { return
                
            }
            
            present(vc, animated: true, completion: { 
                
                self.navigationController?.popViewController(animated: false)
            })
        
        } else {
                Utility().myLog(object: "양식이 다릅니다.\n")
            
                DefaultAlert().basicAlert(title:"양식오류", inputMessage: "양식이 안맞습니다. 다시 한번 확인해주세요!", viewController: self, alertButtonStyle:AlertButtonStyle.OneButtonStyle)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
       
    deinit {
           Utility().myLog(object: "노티피케이션 해제합니다.\n")
       
        NotificationCenter.default.removeObserver(self)
    }

}
