//
//  File.swift
//  ExpandBleTableView
//
//  Created by 진호놀이터 on 2017. 6. 6..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import Foundation
import UIKit

class ExpandableTableViewVM: NSObject {
    
    var vc : ExpandableTableView
    var data = [SchoolData?]()
    var selectedRow: Int?
    init(sc :ExpandableTableView, data:[SchoolData]) {
        self.vc = sc
        self.data = data
    }
}


extension ExpandableTableViewVM : UITableViewDelegate,UITableViewDataSource{

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100.0
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        print(data.count)
        return data.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let rowData = data[indexPath.row] {
            return 142
        } else {
            return 75
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("indaex")
        print(indexPath.row)
        if let data = self.data[indexPath.row] {
        //      학교셀일떄
            
            let upperCell = tableView.dequeueReusableCell(withIdentifier:"UpperCell", for: indexPath) as! UpperCell
            
            
            
                return upperCell
        }else {
            if let row  = data[selectedRow!] {
                let subCell = tableView.dequeueReusableCell(withIdentifier:"SubCell", for: indexPath) as! SubCell
                
                let dptIndex = indexPath.row - selectedRow! - 1
                subCell.dptNameLabel.text = row.departMents?[dptIndex]?.departMentName
                return subCell
                }
            
            }
            

        // 학과셀일때
            
       return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        print(indexPath.row)
        print(self.data.count)
        if self.data.count-1 <= indexPath.row {
            selectedRow = indexPath.row
              expandCell(tableView:self.vc.table, selectIndext:indexPath.row)
            
        } else{
            if(self.data[indexPath.row+1] == nil){
                
            inpandCell(tableView:self.vc.table, selectIndext:indexPath.row)
                
                        } else {
                //늘리기
                selectedRow = indexPath.row
            expandCell(tableView:self.vc.table, selectIndext:indexPath.row)
                        }

        
        }
        
//      else
    }
    
    func  expandCell(tableView: UITableView, selectIndext: Int) {
        
        guard let dpts = self.data[selectIndext]?.departMents else { return  }
        
        for i in 1...dpts.count {
            
            self.data.insert(nil, at:selectIndext+i)
            tableView.insertRows(at:[NSIndexPath(row:selectIndext+i,section:0) as IndexPath], with:.top)
            
        }
    }
    
    
    func  inpandCell(tableView: UITableView, selectIndext: Int) {
        
        guard let dpts = self.data[selectIndext]?.departMents else { return  }
        
        for i in 1...dpts.count {
            
            self.data.remove(at: selectIndext+1)
            tableView.deleteRows(at: [NSIndexPath(row:selectIndext+1,section:0) as IndexPath], with: .bottom)
            
        }
    }

}


