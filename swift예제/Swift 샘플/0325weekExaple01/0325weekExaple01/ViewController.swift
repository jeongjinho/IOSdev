//
//  ViewController.swift
//  0325weekExaple01
//
//  Created by 진호놀이터 on 2017. 3. 25..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var partTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    
    var name : String?
    var age  : String?
    var part : String?
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);

        print("뷰나온다")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("뷰나왔다")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("로드된다.")
    }

//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        print("레이아웃바뀐다")
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        print("사라질거야")
//    }
//    
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated);
//        print("사라졌다")
//    }

    
    
    @IBAction func touchUpInsideInputButton(_ sender: Any) {
        
        
        
        if let name  = nameTextField.text, let part = partTextField.text ,let age = ageTextField.text{
        
            if name == "" || part == "" || age == ""{
            
                simpleAlert(title: "입력창오류", message: "오류입니다")
            
            }
            
            
            simpleAlert(title: "안녕하세요", message: "안녕하세요 제이름은\(name)입니다. 파트는 \(part) 나이는\(age)")
        
        }
     
        
    }
    
   
    
    func simpleAlert(title:String,message:String){
        
        let alert = UIAlertController (title:title, message:message, preferredStyle:.alert)
        
        let okAction = UIAlertAction (title:"확인", style:.default)
        
        
        alert.addAction(okAction)
        
        //present(alert,animated:true)
        self.present(alert, animated:true, completion:nil)
        
    
    
}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

