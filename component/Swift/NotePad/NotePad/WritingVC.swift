//
//  WritingVC.swift
//  NotePad
//
//  Created by 진호놀이터 on 2017. 6. 3..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit
import CoreData
class CoreDelegate {
    var appDelegate: AppDelegate {
    
        let delegate = UIApplication.shared.delegate as! AppDelegate
    
        return delegate
    }
    
    var  context: NSManagedObjectContext {
     let ctx = appDelegate.persistentContainer.viewContext
    
        return ctx
    }
    var fetchRequest : NSFetchRequest<Note> =  {
    
         let fetch: NSFetchRequest<Note> = Note.fetchRequest()
    return fetch
    }()
    
    init() {
   
    }
}

class WritingVC: UIViewController {

    
    @IBOutlet weak var memoTextView: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    let coreDelegate = CoreDelegate()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
        
        
        
        
       
        
    }

    @IBAction func touchUpInsideSaveBtn(_ sender: UIBarButtonItem) {
        
       if(memoTextView.text.characters.count == 0){
        
           DefaultAlert().basicAlert(title:"오류", inputMessage:"dsds" , viewController:self, alertButtonStyle:.TwoButtonStyle) { () in
            }
        }
        
       else {
        
        DefaultAlert().basicAlert(title:"저장", inputMessage:"저장하시겠습까?" , viewController:self, alertButtonStyle:.TwoButtonStyle){ () in
            
            print("확인후 컴프릿")
            let newMemo = NSEntityDescription.insertNewObject(forEntityName:"Note", into: self.coreDelegate.context)
            let date = Date()
            
            newMemo.setValue(self.titleTextField.text, forKey:"title")
            newMemo.setValue(self.memoTextView.text, forKey:"memo")
            newMemo.setValue(date, forKey:"date")
           
            do{
            
            try self.coreDelegate.context.save()
            } catch{
            
                print("에러")
            }
            
            }

        }
        
    }
   
    @IBAction func touchUpInsideCancelBtn(_ sender: UIBarButtonItem) {
        
       
        self.dismiss(animated:true, completion: nil)
        
    }
}
