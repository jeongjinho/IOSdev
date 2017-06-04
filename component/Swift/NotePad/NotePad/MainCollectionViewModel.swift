//
//  MainCollectionViewModel.swift
//  NotePad
//
//  Created by 진호놀이터 on 2017. 6. 4..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import Foundation
import UIKit

class MainCollectionViewModel: NSObject{


    var main: MainVC
    var rows = [Note]()
    
    init(vc: MainVC,notes:[Note]) {
        self.main = vc
        self.rows = notes
    }
}

extension MainCollectionViewModel: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(1,1,1,1)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width:self.main.view.frame.size.width, height:100)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        print(rows.count)
        return rows.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"NoteCell", for: indexPath)as! NoteCell
        
        let note = rows[indexPath.row]
        
        let noteTitle = Utility.genderOptString(string:note.title)
        let date = note.date
        let noteDate = Utility.dateString(date:date! as Date, inputFomat: "yy/MM/dd hh:mm:ss a")
        
        cell.titleLabel.text = noteTitle
        cell.dateLabel.text = noteDate
        
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let readVC = main.storyboard?.instantiateViewController(withIdentifier:"ReadVC") as! ReadVC
        
        readVC.note = rows[indexPath.row]
        
        main.navigationController?.pushViewController(readVC, animated: true)
    }
}
