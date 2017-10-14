//
//  ViewController.swift
//  NotePad
//
//  Created by 진호놀이터 on 2017. 6. 3..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit
import CoreData
class MainVC: CoreDataVC{

    @IBOutlet weak var notesCollectionView: UICollectionView!{
        didSet{
          
        }
    }
    
    var mainCollectionVM: MainCollectionViewModel?
    var notes: [Note] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: false)
        
        self.coreDelegate.fetchRequest.sortDescriptors = [sortDescriptor]
        do {
            
            notes = try coreDelegate.context.fetch(self.coreDelegate.fetchRequest)
            print(notes.count)
            
        } catch  {
            Utility().myLog(object:"에러")
        }
        self.notesCollectionView.setContentOffset(CGPoint(x:0,y:0), animated:true)
        mainCollectionVM = MainCollectionViewModel(vc: self, notes:notes)
        self.notesCollectionView.delegate = mainCollectionVM
        self.notesCollectionView.dataSource = mainCollectionVM

           self.notesCollectionView.reloadData()
        
        
    }
        override func viewDidLoad() {
        super.viewDidLoad()
            
    }
    
}
