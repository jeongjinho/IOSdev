//
//  ViewController.swift
//  NotePad
//
//  Created by 진호놀이터 on 2017. 6. 3..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var notesCollectionView: UICollectionView!
    
        let coreDelegate = CoreDelegate()

    var notes :[Note] = []
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

          let sortDescriptor = NSSortDescriptor(key: "date", ascending: false)

        self.coreDelegate.fetchRequest.sortDescriptors = [sortDescriptor]
    

        do {
            
        notes = try coreDelegate.context.fetch(self.coreDelegate.fetchRequest)
            
        } catch  {
            Utility().myLog(object:"에러")
        }
     
 self.notesCollectionView.setContentOffset(CGPoint(x:0,y:0), animated:true)
           self.notesCollectionView.reloadData()
        
        
    }
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.notesCollectionView.delegate = self
        self.notesCollectionView.dataSource = self
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(1,1,1,1)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width:self.view.frame.size.width, height:100)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        print(notes.count)
        return notes.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"NoteCell", for: indexPath)as! NoteCell
        
        let note = notes[indexPath.row]
        
        let noteTitle = optString(optString: note.title)
        cell.titleLabel.text = noteTitle
        
        let noteDate = note.date
        let formatter = DateFormatter()
        formatter.dateFormat = "yy/MM/dd hh:mm:ss a"
        let dateString = optString(optString:formatter.string(from: noteDate! as Date))
        
        cell.dateLabel.text = dateString
        
        
        return cell
        
    }
//    var hideHeader: Bool = true //or false to not hide the header
//    
//   
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        
//        if hideHeader {
//            return CGSize.zero //supplementary view will not be displayed if height/width are 0
//        } else {
//            return CGSize(width: 30, height: 30) //size of your UICollectionReusableView
//        }
//        
//    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let readVC = self.storyboard?.instantiateViewController(withIdentifier:"ReadVC") as! ReadVC
        
        readVC.note = notes[indexPath.row]
        
        self.navigationController?.pushViewController(readVC, animated: true)
        
        
    }
    
    
    func optString(optString: String?) -> String{
    
        guard let string = optString else { return "" }
    
        return string
        
    }
    
}
