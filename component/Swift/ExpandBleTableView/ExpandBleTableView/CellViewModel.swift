//
//  CellViewModel.swift
//  ExpandBleTableView
//
//  Created by 진호놀이터 on 2017. 6. 8..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import Foundation
import UIKit


protocol TextForCellProtocol {
    
    
    var title: String {get}
    var textColor: UIColor {get}
    
}
extension TextForCellProtocol{
    var title: String {
    
        return ""
    }
    
    
    var textColor : UIColor {
    
        return UIColor(colorLiteralRed:255, green:255, blue:255, alpha: 1)
    }
}

class LabelViewModel:TextForCellProtocol {
 
    var title: String
    
    
    init?(datas inData:SchoolData) {
        
       guard let titleString =  inData.schoolName else { return nil }
        self.title = titleString
        
    }
    
    
}

extension UILabel{
    func configureUpperLabel(_ viewModel: TextForCellProtocol) {
        
        self.text = viewModel.title
        self.textColor = viewModel.textColor
        
    }

}


protocol ImageForCellProtocol {
    
    var image: UIImage {get}
    var alpha: Float {get}
}

extension ImageForCellProtocol{

    var alpha :Float{
    
        return 1
    }
    var image: UIImage{
        
        return  UIImage(named:"default")!
    }
}

class ImageViewModel:ImageForCellProtocol {
    var image: UIImage

    
    init?(datas inData: SchoolData) {
        
        guard let schoolImageString = inData.schoolImageName else { return nil }
        self.image = UIImage(named:schoolImageString)!
    }
}

extension UIImageView{

    func configureUpperBackImage(_ viewModel: ImageForCellProtocol){
        
      self.image = viewModel.image
    }
    
}
