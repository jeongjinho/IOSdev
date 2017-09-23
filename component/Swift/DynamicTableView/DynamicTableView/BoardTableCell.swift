//
//  BoardTableCell.swift
//  DynamicTableView
//
//  Created by 진호놀이터 on 2017. 7. 10..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import Foundation
import UIKit
protocol ReplyCellDelegate {
    
    func getReplyHeight(height:CGFloat)
}

class BoardTableCell: UITableViewCell,UITableViewDelegate,UITableViewDataSource{
    @IBOutlet weak var replyTableVieweHeight: NSLayoutConstraint!
    @IBOutlet weak var ReplyTableView: UITableView!
    var replies: [Reply]?
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    var ReplyDelegate: ReplyCellDelegate?
    var currentHeight:CGFloat = 0.0
    
    override func awakeFromNib() {
       
        ReplyTableView.dataSource = self
        ReplyTableView.delegate = self
           ReplyTableView.layoutIfNeeded()
    }
    

    
    func setBoadReplyTableView(reply:[Reply],delegate:ReplyCellDelegate) {
        
        ReplyTableView.rowHeight = UITableViewAutomaticDimension
        ReplyTableView.estimatedRowHeight = 40
        replies = reply
        ReplyDelegate = delegate
        if(replies?.count != 0){
           ReplyTableView.layoutIfNeeded()
        currentHeight = 0.0
          //  replyTableVieweHeight.constant = ReplyTableView.estimatedRowHeight * 2
        }
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return  1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"ReplyTableCell", for: indexPath) as! ReplyTableCell
        
       
        cell.nameLbl.setTitle("애프토", for: .normal)
        cell.contentLbl.text = "좋은댓글 입니다. 반가워용 s!!,ReplyTableCell,ReplyTableCell,ReplydsadsadasdasdasdasdasdasTableCell"
        cell.layoutIfNeeded()
        print(cell.frame.size.height)
        //ReplyTableView.estimatedRowHeight += cell.frame.size.height
     //   self.ReplyDelegate?.getReplyHeight(height: cell.frame.size.height)
       // self.currentHeight += cell.frame.size.height
        return cell
    }
    
   
    
}
