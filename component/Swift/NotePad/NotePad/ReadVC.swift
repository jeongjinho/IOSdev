//
//  ReadVC.swift
//  NotePad
//
//  Created by 진호놀이터 on 2017. 6. 4..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class ReadVC: UIViewController {

    var seletedIndexpath: IndexPath? = nil
     let coreDelegate = CoreDelegate()
    @IBOutlet weak var dateLabel: UILabel!
    var note: Note = Note()
    @IBOutlet weak var noteTextView: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Utility().myLog(object:seletedIndexpath)
        
        self.titleLabel.text = note.title
        self.noteTextView.text = note.memo
        
        
        let noteDate = note.date
        let formatter = DateFormatter()
        formatter.dateFormat = "yy/MM/dd hh:mm:ss a"
        let dateString = optString(optString:formatter.string(from: noteDate! as Date))
        self.dateLabel.text = dateString
    }
    override func viewDidLoad() {
        super.viewDidLoad()
            Utility().myLog(object:seletedIndexpath)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func optString(optString: String?) -> String{
        
        guard let string = optString else { return "" }
        
        return string
        
    }
    @IBAction func touchUpInsideEditBtn(_ sender: UIBarButtonItem) {
        
       let alert = UIAlertController(title:"편집", message:"편집할 항목을 선택해 주세요", preferredStyle: .actionSheet)
        
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
          let defaultAction = UIAlertAction(title:"돌아가기", style:.default, handler: nil)
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
