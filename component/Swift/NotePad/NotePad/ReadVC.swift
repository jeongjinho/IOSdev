//
//  ReadVC.swift
//  NotePad
//
//  Created by 진호놀이터 on 2017. 6. 4..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class ReadVC: CoreDataVC {

    var seletedIndexpath: IndexPath? = nil
    // let coreDelegate = CoreDelegate()
    @IBOutlet weak var dateLabel: UILabel!
    var note: Note = Note()
    @IBOutlet weak var noteTextView: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.titleLabel.text = note.title
        self.noteTextView.text = note.memo
        
        let noteDate = note.date
       
        let optString = Utility.dateString(date:noteDate! as Date, inputFomat: "yy/MM/dd hh:mm:ss a")
        
        let dateString = Utility.genderOptString(string:optString)
        self.dateLabel.text = dateString
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    @IBAction func touchUpInsideEditBtn(_ sender: UIBarButtonItem) {
        
       let alert = UIAlertController(title:"편집", message:"편집할 항목을 선택해 주세요", preferredStyle: .actionSheet)
        
        let defaultAction = UIAlertAction(title:"돌아가기", style:.default, handler: nil)
        let modifyAction = UIAlertAction(title:"수정", style:.default){
        (UIAlertAction) in
            
            self.note.setValue(self.noteTextView.text, forKey:"memo")
            self.note.setValue(self.titleLabel.text, forKey:"title")
            do{
            
                try self.note.managedObjectContext?.save()
            } catch{
                Utility().myLog(object: "에러")
            
            }
        
        }
        let deleteAction = UIAlertAction(title: "삭제", style: .destructive) { (UIAlertAction) in
            
         self.coreDelegate.context.delete(self.note)
         self.coreDelegate.appDelegate.saveContext()
         self.navigationController?.popViewController(animated: true)
            
        }
        
        alert.addAction(deleteAction)
        alert.addAction(modifyAction)
        alert.addAction(defaultAction)
        self.present(alert, animated:true, completion: nil)
        
    }
    

}
