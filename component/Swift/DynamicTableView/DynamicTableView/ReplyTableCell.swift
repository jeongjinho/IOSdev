//
//  ReplyTableCell.swift
//  DynamicTableView
//
//  Created by 진호놀이터 on 2017. 7. 10..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit



struct Reply{
    
    var name:String?
    var content:String?
    
    init(name:String,content:String) {
        
        self.name = name
        self.content = content
    }
    
    
}

class ReplyTableCell: UITableViewCell {

    @IBOutlet weak var contentLbl: UILabel!
    @IBOutlet weak var nameLbl: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
