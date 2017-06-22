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
    var  data :[SchoolData?]?
    var selectedRow: Int?
    override func viewWillAppear(_ animated: Bool) {
            //  self.table.reloadData()

    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        initialData()
        // print(schoolData?.count)
        
        expadn = ExpandableTableViewVM(sc:self, data:data as! [SchoolData])
        self.table.dataSource = expadn
        self.table.delegate = expadn
         self.table.rowHeight = UITableViewAutomaticDimension
        self.table.estimatedRowHeight = 88.0
       
    }

    func initialData ()  {
        
        let koreaUniv = SchoolData.init(schoolName:"korea Univ", schoolImage:"koreaUniv", departMents:
                                                    [DepartMent.init(departMentName:"화학과", peopleNumber: 50),                                                        DepartMent.init(departMentName:"법학과", peopleNumber: 32),DepartMent.init(departMentName:"컴퓨터학부", peopleNumber: 35)])
        let yeonseiUniv = SchoolData.init(schoolName: "yeonsei Univ", schoolImage: "yeonseiUniv", departMents:
                                                        [DepartMent.init(departMentName:"의과", peopleNumber: 100),                                                        DepartMent.init(departMentName:"수의학과", peopleNumber: 50),DepartMent.init(departMentName:"기계학과", peopleNumber: 70)])
        
       self.data = [koreaUniv,yeonseiUniv]
        
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 100.0
//    }
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 50
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
//        print(data?.count)
//        //처음시작될 때 data의 갯수만큼 만들어진다 여기선 2개
//        
//        
//        if let datas = data {
//            return datas.count
//            
//        } else {
//            return 0
//        }
//    }
//    
//    
//    
//    
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        print("선택된셀 :" + "\(indexPath.row)")
//        if let data = self.data?[indexPath.row] {
//            //      학교셀일떄
//            
//            let upperCell = tableView.dequeueReusableCell(withIdentifier:"UpperCell", for: indexPath) as! UpperCell
//                         upperCell.contfigure(data)
//          // upperCell.backUnivImageView.image = UIImage(named:"koreaUniv")
//          //  upperCell.rankLabel.text = "\(indexPath.row)"
//            upperCell.selectionStyle = .none
//            return upperCell
//        }else {
//            if let rowData  = data?[selectedRow!] {
//                let subCell = tableView.dequeueReusableCell(withIdentifier:"SubCell", for: indexPath) as! SubCell
//                
//                let parentCellIndex = getParentCellIndex(expansionIndex: indexPath.row)
//                let dptIndex = indexPath.row - selectedRow! - 1
//                
//                subCell.dptNameLabel.text = rowData.departMents?[dptIndex].departMentName
//                subCell.selectionStyle = .none
//                return subCell
//            }
//            
//        }
//        
//        
//        // 학과셀일때
//        
//        return UITableViewCell()
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//         print("선택된셀 :" + "\(indexPath.row)")
//        
//            //버튼을 눌렀을때
//            // 만약 누른 곳의 인덱스패스와 데이터의 갯수-1해서 배열위치와 비교한다 만약
//            // indextpath보다 작거나 같다면 마지막에 있는 row를 클릭한것  예 : 1번째를 눌렀다면 indextpath는 0,0 data
//            // count는 2-1  = 1  같으므로 들어간다. 이것을 하는이유는  맨아래 펼치는 것만하면 data 다음에 는 아무것도 없어서 (nil조차없으니 에러) 그래서 먼저 마지막인지 검사한다.
//            if (self.data?.count)! <= indexPath.row+1 {
//               selectedRow = indexPath.row
//                expandCell(tableView:self.table, selectIndext:indexPath.row)
//                //위에 로직이들어간이유가 여기 있다.
//                // 인덱스패스 0번쨰를 눌렀다면 그다음 인덱스패스가 nil이라면 이것은 이미 펼쳐진상태이다.
//                //그러므로 줄이는 함수를 실행한다.
//            } else{
//                if(self.data?[indexPath.row+1] != nil){
//                    
//                    selectedRow = indexPath.row
//                    expandCell(tableView:self.table, selectIndext:indexPath.row)
//                    
//                } else {
//                    //늘리기
//                    //만약 그렇지않다면 즉 nil이 아니라면 다음번쨰가 nil도 아니고 끝내 있는 것도 아니라는 것이다.
//                    
//                    inpandCell(tableView:self.table, selectIndext:indexPath.row)
//                }
//                
//                
//            }
//        
//        //      else
//    }
//    
//    func  expandCell(tableView: UITableView, selectIndext: Int) {
//        
//        guard let dpts = self.data?[selectIndext]?.departMents else { return  }
//        
//        for i in 1...dpts.count {
//            
//            data?.insert(nil, at:selectIndext+i)
//            tableView.insertRows(at:[NSIndexPath(row:selectIndext+i,section:0) as IndexPath], with:.top)
//            
//        }
//    }
//    
//    
//    func  inpandCell(tableView: UITableView, selectIndext: Int) {
//        print("선택된셀 :" + "\(selectIndext)")
//
//        if let dpts = self.data?[selectIndext]?.departMents {
//        
//            for i in 1...dpts.count {
//                
//                
//                
//                data?.remove(at: selectIndext+1)
//                tableView.deleteRows(at: [NSIndexPath(row:selectIndext+1,section:0) as IndexPath], with: .top)
//                
//                
//                
//            }
//        } else {
//        
//        return
//        }
//        
//        
//    }
//    
//    
//    private func getParentCellIndex(expansionIndex: Int) -> Int {
//        
//        var selectedCell: SchoolData?
//        var selectedCellIndex = expansionIndex
//        
//        while(selectedCell == nil && selectedCellIndex >= 0) {
//            selectedCellIndex -= 1
//            selectedCell = data?[selectedCellIndex]
//        }
//        
//        return selectedCellIndex
//    }

}
