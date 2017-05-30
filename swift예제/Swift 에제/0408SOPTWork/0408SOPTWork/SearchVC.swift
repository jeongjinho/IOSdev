//
//  SearchVC.swift
//  0408SOPTWork
//
//  Created by 진호놀이터 on 2017. 4. 19..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class SearchVC: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {

    var mainCategory: Array  = ["OB","YB"]
    var ybCategory: Array  = ["기획","개발","디자인"]
    var obCategory: Array  = ["19th 기획","19th 개발","19th 디자인","16~18th 기획","16~18th 개발","16~18th 디자인"]
   
    var ybThirdCategory:Array = ["ios","안드로이드","서버"];     var obThirdCategory:Array = ["클라이언트","서버"]
    
    @IBOutlet weak var fistCategory: UITextField!
    @IBOutlet weak var secondCategory: UITextField!
    @IBOutlet weak var thirdCategory: UITextField!
    var firstPickerView =  UIPickerView()
    var secondPickerView =  UIPickerView()
    var thirdPickerView =  UIPickerView()
                         
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstPickerView.delegate = self
        firstPickerView.dataSource = self
        secondPickerView.delegate = self
        secondPickerView.dataSource = self
        thirdPickerView.delegate = self
        thirdPickerView.dataSource = self
        firstPickerView.tag = 1
        secondPickerView.tag = 2
        thirdCategory.tag = 3
        fistCategory.inputView = firstPickerView
        secondCategory.inputView = secondPickerView
        thirdCategory.inputView = thirdPickerView
//        let toolBar = UIToolbar(frame: CGRect(x: 0, y: self.view.frame.size.height/4, width: self.view.frame.size.width, height: 40.0))
//         let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.donePressed))
//        toolBar.setItems([doneButton], animated: true)
         fistCategory.inputAccessoryView = CustomPickerView().toolbarForpickerView(vc: self, completeHandler: { (
            ) in
            
            
            if(self.fistCategory.isEditing == true){
                let row = self.firstPickerView.selectedRow(inComponent: 0)
                self.fistCategory.text = self.mainCategory[row]
                
                print("선택")
            }
            
         })     //   secondCategory.inputAccessoryView = toolBar
      //  thirdCategory.inputAccessoryView = toolBar
        // Do any additional setup after loading the view.
    }
//    func donePressed(_ sender: UIBarButtonItem) {
//        
//       
//        
//        //pickerView.selectRow(0, inComponent: 0, animated: false)
//        //pickerView.selectedRow(inComponent: 0)
//    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if(pickerView.tag == 1){
        
            return mainCategory.count
        } else if(pickerView.tag == 2 ){
            
            
        if( fistCategory.text == "YB"){
        
             return ybCategory.count
        } else {
        
            return obCategory.count
        
            }
            
        }
        else if(pickerView.tag == 3 ){
            
            
            if( secondCategory.text == "개발" && secondCategory.text == "19th 개발"){
                
                return ybThirdCategory.count
            } else {
                
                return obThirdCategory.count
                
            }
            
        } else {
        
        return 0
        }
        
}
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView.tag == 1){
            
            return mainCategory[row]
        } else if(pickerView.tag == 2 ){
            
            
            if( fistCategory.text == "YB"){
                
                return ybCategory[row]
            } else {
                
                return obCategory[row]
                
            }
            
        }
        else if(pickerView.tag == 3 ){
            
            
            if( secondCategory.text == "개발" || secondCategory.text == "19th 개발"){
                
                return ybThirdCategory[row]
            } else {
                
                return obThirdCategory[row]
                
            }
            
        } else {
        
        return ""
        }
    }


    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
      //  pickerTextField.text = pickOption[row]
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
