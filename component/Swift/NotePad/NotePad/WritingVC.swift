//
//  WritingVC.swift
//  NotePad
//
//  Created by 진호놀이터 on 2017. 6. 3..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit
import CoreData
class WritingVC: CoreDataVC {

    
    @IBOutlet weak var memoTextView: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
   // let coreDelegate = CoreDelegate()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func touchUpInsideSaveBtn(_ sender: UIBarButtonItem) {
        
       if(memoTextView.text == "" || titleTextField.text == ""){
        
           DefaultAlert().basicAlert(title:"형식오류", inputMessage:"빈칸을 채워주세요", viewController:self, alertButtonStyle: .OneButtonStyle, complete:nil)
       } else{
        DefaultAlert().basicAlert(title:"저장", inputMessage:"저장하시겠습니까?" , viewController:self, alertButtonStyle:.TwoButtonStyle){ () in
            
            let newMemo = self.coreDelegate.insertNewData(entityName: "Note") as! Note
            let date = Date()
            newMemo.setValue(self.titleTextField.text, forKey:"title")
            newMemo.setValue(self.memoTextView.text, forKey:"memo")
            newMemo.setValue(date, forKey:"date")
            self.coreDelegate.saveCoreDB()

        }
        
    }
}
    @IBAction func touchUpInsideCancelBtn(_ sender: UIBarButtonItem) {
        
        self.dismiss(animated:true, completion: nil)
        
    }
}
