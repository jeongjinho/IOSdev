//
//  ExpandableTableView.swift
//  ExpandBleTableView
//
//  Created by 진호놀이터 on 2017. 6. 6..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class ExpandableTableView: UIViewController {
    var expadn: ExpandableTableViewVM?
    @IBOutlet var table: UITableView!
    var  data :[SchoolData?] = []
    
    override func viewWillAppear(_ animated: Bool) {
        initialData()
       // print(schoolData?.count)
        
       expadn = ExpandableTableViewVM(sc:self, data:data as! [SchoolData])
        self.table.dataSource = expadn
        self.table.delegate = expadn
        self.table.reloadData()

    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
//        print(section)
//        return data.count
//    }
//    func numberOfSections(in tableView: UITableView) -> Int {
//        
//        return 1
//    }
//    
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if let rowData = data[indexPath.row] {
//            return 142
//        } else {
//            return 75
//        }
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if let data = self.data[indexPath.row] {
//            //      학교셀일떄
//            
//            let upperCell = tableView.dequeueReusableCell(withIdentifier:"UpperCell", for: indexPath) as! UpperCell
//            
//            
//            
//            return upperCell
//        }else {
//            
//            // 학과셀일때
//            let subCell = tableView.dequeueReusableCell(withIdentifier:"SubCell", for: indexPath) as! SubCell
//            return subCell
//        }
//        
//        
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let datas = self.data[indexPath.row] else { return  }
//        
//        
//        
//        if(data[indexPath.row+1] == nil){
//            
//            inpandCell(tableView:self.table, selectIndext:indexPath.row)
//            
//        } else {
//            //늘리기
//            expandCell(tableView:self.table, selectIndext:indexPath.row)
//        }
//        
//    }
//    
//    func  expandCell(tableView: UITableView, selectIndext: Int) {
//        
//        guard let dpts = self.data[selectIndext]?.departMents else { return  }
//        
//        for _ in 0..<dpts.count {
//            
//            self.data.insert(nil, at:selectIndext+1)
//            tableView.insertRows(at:[NSIndexPath(row:selectIndext+1,section:0) as IndexPath], with:.top)
//            
//        }
//    }
//    
//    
//    func  inpandCell(tableView: UITableView, selectIndext: Int) {
//        
//        guard let dpts = self.data[selectIndext]?.departMents else { return  }
//        
//        for _ in 0..<dpts.count {
//            
//            self.data.remove(at: selectIndext+1)
//            tableView.deleteRows(at: [NSIndexPath(row:selectIndext+1,section:0) as IndexPath], with: .bottom)
//            
//        }
//    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
      
    }

    func initialData ()  {
        
        let koreaUniv = SchoolData.init(schoolName:"korea Univ", schoolImage:"korea", departMents:
                                                    [DepartMent.init(departMentName:"화학과", peopleNumber: 50),                                                        DepartMent.init(departMentName:"법학과", peopleNumber: 32),DepartMent.init(departMentName:"컴퓨터학부", peopleNumber: 35)])
        let yeonseiUniv = SchoolData.init(schoolName: "yeonsei Univ", schoolImage: "yeonsei", departMents:
                                                        [DepartMent.init(departMentName:"의과", peopleNumber: 100),                                                        DepartMent.init(departMentName:"수의학과", peopleNumber: 50),DepartMent.init(departMentName:"기계학과", peopleNumber: 70)])
        
       self.data = [koreaUniv,yeonseiUniv]
        
    }
    

}
