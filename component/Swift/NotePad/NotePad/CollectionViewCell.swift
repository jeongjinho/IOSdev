//
//  CollectionViewCell.swift
//  NotePad
//
//  Created by 진호놀이터 on 2017. 6. 3..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit



extension UICollectionViewDelegate {
    
    
    

    
}


protocol Pressible {
    
    func Long()
}



class NoteCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    var pressCallback: Pressible?
    @IBOutlet weak var dateLabel: UILabel!
    var longpress: UILongPressGestureRecognizer?
    

    func  getPress(callback: Pressible) {
        
        pressCallback = callback
        
    }
    
     override func awakeFromNib() {
        super.awakeFromNib()
        longpress = UILongPressGestureRecognizer(target:self, action: "long")
        longpress?.minimumPressDuration = 1.0
        self.addGestureRecognizer(longpress!)
        
    
    }
    
    func long(complettionHandler:(String)->Void) {
       self.pressCallback?.Long()
        complettionHandler("성공")
        
    }
}
