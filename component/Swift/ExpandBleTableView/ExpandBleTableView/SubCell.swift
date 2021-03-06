//
//  SubCell.swift
//  ExpandBleTableView
//
//  Created by 진호놀이터 on 2017. 6. 6..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class SubCell: UITableViewCell {

//    @IBOutlet weak var peoplesLabel: UILabel!
    @IBOutlet weak var dptNameLabel: UILabel!
     var vm: DepartMent?
    
    func configureSubCellLabel(_ model:DepartMent) {
        self.vm = model
        configureDptName()
    }
    
    func  configureDptName()  {
        
      let dptVM = SubLabelViewModel.init(SubDatas:vm!)
        print("\(dptVM)")
        dptNameLabel.configureLabel(dptVM!)
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
