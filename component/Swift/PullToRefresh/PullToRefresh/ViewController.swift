//
//  ViewController.swift
//  PullToRefresh
//
//  Created by 진호놀이터 on 2017. 8. 13..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    var constBase: CGFloat!
    @IBOutlet weak var const: NSLayoutConstraint!
   
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var refreshTableView: UITableView!{
    
        didSet{
            refreshTableView.delegate = self
            refreshTableView.dataSource = self
        }
    
        
    }
    
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    var refresh: UIRefreshControl?
    var oldOffset: CGFloat?
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        
    //   print(scrollView.contentOffset.y)
      // print(refreshTableView.tableHeaderView?.frame)
        if(scrollView.contentOffset.y  > 0){
            
            
            
            if(scrollView.contentOffset.y <= 150){
                
                
            
                self.const.constant = constBase - scrollView.contentOffset.y
                self.oldOffset = scrollView.contentOffset.y
                

            }else{
               
               self.const.constant =  50
               
            }
            
            print(self.const.constant)
              
        }
          
        
            
            
            
    
    
        
        else if(scrollView.contentOffset.y  < 0){
        print("늘어난다")
         self.const.constant = constBase +  abs(scrollView.contentOffset.y)
         
        }
        
        
    }
    
    
    
    
    
//    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        
//       
//
//        if(scrollView.contentOffset.y <= 0){
//            
//            let duration = (self.const.constant/constBase)
//          
//            UIView.animate(withDuration: 0.3, animations: {
//                self.const.constant = self.constBase
//            })
//       
//        }
    
        
      
        
 //   }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       refresh = UIRefreshControl()
        
        refresh?.backgroundColor = .clear
      //  refresh?.tintColor = .clear

    constBase = const.constant
        
      
        
        //self.refreshTableView.contentInset = UIEdgeInsetsMake(self.imgView.frame.height, 0, 0, 0)
        
     //   self.refreshTableView.contentOffset = CGPoint(x: 0, y:-self.imgView.frame.height)
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController:UITableViewDelegate,UITableViewDataSource{

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:"Cell", for: indexPath)
        
        return cell
        
    }
    
   
}

