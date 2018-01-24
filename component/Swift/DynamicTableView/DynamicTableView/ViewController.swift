//
//  ViewController.swift
//  DynamicTableView
//
//  Created by 진호놀이터 on 2017. 7. 10..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,ReplyCellDelegate {

    @IBOutlet weak var BoardTableView: UITableView!
    var cellReplyheight: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        BoardTableView.delegate = self
        BoardTableView.dataSource = self
        BoardTableView.rowHeight = UITableViewAutomaticDimension
        BoardTableView.estimatedRowHeight = 131
        
//    self.BoardTableView.setNeedsLayout()
//        self.BoardTableView.layoutIfNeeded()
  
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = tableView.dequeueReusableCell(withIdentifier:"BoardTableCell", for: indexPath) as! BoardTableCell
        
     //   cell.layoutSubviews()
//        cell.ReplyTableView.layoutIfNeeded()
//         cell.layoutIfNeeded()
        
            print(cell.contentView.frame.size.height)
      
            cell.replyTableVieweHeight.constant = cell.ReplyTableView.contentSize.height
            cell.setBoadReplyTableView(reply:[Reply.init(name:"진호",content:"안녕하세요 저는 정진호입니다.")], delegate: self)
        cell.nameLbl.text = "정진호"
        cell.contentLbl.text = "스위프트는 어려우면서도 재밌다 그래서 계속하고 싶다 어서 빨리 고수가 되어서 책도 써보고 싶다. 빨리 실력이 늘도록 공부도 열심히 해야겠다.스위프트는 어려우면서도 재밌다 그래서 계속하고 싶다 어서 빨리 고수가 되어서 책도 써보고 싶다. 빨리 실력이 늘도록 공부도 열심히 해야겠다.스위프트는 어려우면서도 재밌다 그래서 계속하고 싶다 어서 빨리 고수가 되어서 책도 써보고 싶다. 빨리 실력이 늘도록 공부도 열심히 해야겠다.스위프트는 어려우면서도 재밌다 그래서 계속하고 싶다 어서 빨리 고수가 되어서 책도 써보고 싶다. 빨리 실력이 늘도록 공부도 열심히 해야겠다.스위프트는 어려우면서도 재밌다 그래서 계속하고 싶다 어서 빨리 고수가 되어서 책도 써보고 싶다. 빨리 실력이 늘도록 공부도 열심히 해야겠다.스위프트는 어려우면서도 재밌다 그래서 계속하고 싶다 어서 빨리 고수가 되어서 책도 써보고 싶다. 빨리 실력이 늘도록 공부도 열심히 해야겠다."

            cell.ReplyTableView.layoutIfNeeded()
   
            cell.layoutIfNeeded()
       
      //  print(cell.contentView.subviews.last?.frame.size.height)
        
        return cell
        
    }
    
    func getReplyHeight(height: CGFloat) {
        
        
        self.cellReplyheight += height
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        self.BoardTableView.reloadData()
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        
////        return  self.BoardTableView.estimatedRowHeight
//    }
    
}

