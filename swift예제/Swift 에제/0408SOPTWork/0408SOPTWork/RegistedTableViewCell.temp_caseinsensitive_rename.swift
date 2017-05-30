//
//  RegistedTableVIewCell.swift
//  0408SOPTWork
//
//  Created by 진호놀이터 on 2017. 5. 4..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class RegistedTableVIewCell: UITableViewCell {

    @IBOutlet weak var partImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var universityLabel: UILabel!
    @IBOutlet weak var partLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
