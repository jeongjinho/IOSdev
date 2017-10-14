//
//  ViewController.swift
//  PinterStyleCollectionView
//
//  Created by 진호놀이터 on 2017. 7. 31..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource {

   
    var  images:[UIImage] = [UIImage(named:"s1")!,UIImage(named:"s2")!,UIImage(named:"s3")!,UIImage(named:"s4")!,UIImage(named:"s5")!,UIImage(named:"s6")!,UIImage(named:"s1")!,UIImage(named:"s2")!,UIImage(named:"s3")!,UIImage(named:"s4")!,UIImage(named:"s5")!,UIImage(named:"s6")!,UIImage(named:"s1")!,UIImage(named:"s2")!,UIImage(named:"s3")!,UIImage(named:"s4")!,UIImage(named:"s5")!,UIImage(named:"s6")!]
    @IBOutlet weak var pinterCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        pinterCollectionView.register(
            PinterCell.self,
            forCellWithReuseIdentifier:"pinterCell"
        )
       
        self.pinterCollectionView.dataSource  = self
    //    setupCollectionViewInsets()
        setupLayout()
    }
    
    
    //MARK: private
    
 //   private func setupCollectionViewInsets() {
 //       pinterCollectionView!.backgroundColor = .clear
 //       pinterCollectionView!.contentInset = UIEdgeInsets(
 //           top: 0,
 //           left: 10,
  //          bottom: 49,
  //          right: 10
  //      )
 //   }
    
    private func setupLayout() {
        let layout: PinterLayout = {
            if let layout = pinterCollectionView.collectionViewLayout as? PinterLayout {
                return layout
            }
            let layout = PinterLayout()
            
            pinterCollectionView.collectionViewLayout = layout
            
            return layout
        }()
        layout.pintercollectionView = pinterCollectionView
        layout.delegate = self
        layout.cellPadding = 5
        layout.numberOfColumns = 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "PinterCell",
            for: indexPath) as! PinterCell
        
        let image = images[indexPath.item]
        
        
        DispatchQueue.main.async {
            cell.pinerImgView.image = image
            cell.pinterLbl.numberOfLines = 0
            cell.pinterLbl.text = "adsadsadsadasdasdsadasddsklds,.ㅜㅇㄴ룽ㄴ룽ㄴ;룽;ㅣ눌;ㅣㅇㄴㄹㅇㄴㄹㅇㄴㄹㅇㄴalkdhaskldhsakldhlkashddsdsadsadsadsadasdsadlksas 안녕하세요 스위스에요"
            
        }
      
        return cell
    }

    
    
}

    
    
    







extension ViewController: PinterLayoutDelegate,UICollectionViewDelegate {
    
    func collectionView(collectionView: UICollectionView,
                        heightForImageAtIndexPath indexPath: IndexPath,
                        withWidth: CGFloat) -> CGFloat {
        let image = images[indexPath.item]
        
        return image.height(forWidth: withWidth)
    }
    
    func collectionView(collectionView: UICollectionView,
                        heightForAnnotationAtIndexPath indexPath: IndexPath,
                        withWidth: CGFloat) -> CGFloat {
        let text = "adsadsadsadasdasdsadasddsklds,.ㅜㅇㄴ룽ㄴ룽ㄴ;룽;ㅣ눌;ㅣㅇㄴㄹㅇㄴㄹㅇㄴㄹㅇㄴalkdhaskldhsakldhlkashddsdsadsadsadsadasdsadlksas안녕하세요 스위스에요"
        let font = UIFont.defaultFont
        
        let textHeight = text.heightForWidth(width: withWidth, font: font)
        print(textHeight)
        return   textHeight  + 5
    }
    
    
}

