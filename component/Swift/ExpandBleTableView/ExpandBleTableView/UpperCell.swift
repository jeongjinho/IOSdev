//
//  UpperCell.swift
//  ExpandBleTableView
//
//  Created by 진호놀이터 on 2017. 6. 6..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class UpperCell: UITableViewCell {

    @IBOutlet weak var backUnivImageView: UIImageView!
    @IBOutlet weak var schoolNameLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    
    var vm: SchoolData?
    
    func contfigure(_ model: SchoolData )  {
        
        self.vm = model
        self.configureSchoolName()
        self.configureUnivImage()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureSchoolName() {
        let viewModel = LabelViewModel.init(datas:vm!)
        
        schoolNameLabel.configureLabel(viewModel!)
        
    
    }
    func configureUnivImage() {
        let viewModel = ImageViewModel.init(datas:vm!)
       // backUnivImageView.image = viewModel?.image
       backUnivImageView.configureUpperBackImage(viewModel!)
      //  self.backgroundView = UIImageView(image:viewModel?.image)
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
