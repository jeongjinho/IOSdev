//
//  FriendVC.swift
//  fbMessanger
//
//  Created by 진호놀이터 on 2017. 5. 31..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import Foundation
import UIKit



class FriendVC: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
 
    private let FriendID = "Cell_id"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
  //  collectionView?.register(FriendCell.self, forCellWithReuseIdentifier:FriendID)
    collectionView?.alwaysBounceVertical  = true
    
    
    }
 
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
     return 1
    }
 
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
     return 5
    
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        return collectionView.dequeueReusableCell(withReuseIdentifier:FriendID, for: indexPath) as! FriendCell
        
        
    }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
      
        return CGSize.init(width: view.frame.size.width, height: 100)
        
    }
    
}


class FriendCell: BaseCell {
    
//    let profileImageView: UIImageView = {
//    
//        let imageView = UIImageView()
//       imageView.contentMode = .scaleToFill
//        
//        
//        return imageView
//    }()
    
    @IBOutlet weak var senderName: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var profileImageVIew: UIImageView!
    let image: UIImage = {
        guard let defaultImage = UIImage(named:"zukerburg") else{
        
            return UIImage()
        }
        
    
        
    return defaultImage
    }()
    
    let divideLine: UIView  = {
        let line = UIView()
        
        line.backgroundColor = UIColor.gray
        
        return line
        
    }()
    
    override func draw(_ rect: CGRect) {
       
            setupViews()
    }
    
    func  setupViews()  {
        
        self.backgroundColor = UIColor.blue
        print("\(self.frame.size.height)")
        self.divideLine.frame = CGRect(x:0, y:self.contentView.frame.size.height-1, width:self.frame.size.width, height: 1)
        print("\(self.contentView.frame.size.height)")
        print("\(divideLine.frame.origin.y))")
        self.addSubview(divideLine)
        
        self.profileImageVIew.contentMode = .scaleAspectFill
        self.profileImageVIew.image = image
        self.profileImageVIew.clipsToBounds = true
        self.profileImageVIew.layer.cornerRadius = profileImageVIew.frame.size.height/2
        
        
    }
    
    
    
    

    
    
}




class BaseCell: UICollectionViewCell{

    
    
    override func awakeFromNib() {
        //self.backgroundColor = UIColor.blue
        
    }
   
}

