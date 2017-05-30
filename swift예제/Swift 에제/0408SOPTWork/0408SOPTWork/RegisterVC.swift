//
//  RegisterVC.swift
//  0408SOPTWork
//
//  Created by 진호놀이터 on 2017. 5. 3..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var universityTextField: UITextField!
    @IBOutlet weak var soptPartTextField: UITextField!
    let soptPartPickerView = UIPickerView()
    let soptPartArray = ["개발","기획","디자인"]
    
    @IBOutlet weak var currentTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initializingForVC()
    }

    func initializingForVC() {
        //pickerView initialize
        self.soptPartPickerView.dataSource = self
        self.soptPartPickerView.delegate = self
        self.soptPartTextField.inputView = soptPartPickerView
        
        soptPartTextField.inputAccessoryView = CustomPickerView().toolbarForpickerView(vc: self, completeHandler: { (
            ) in
            if(self.soptPartTextField.isEditing == true){
                let row = self.soptPartPickerView.selectedRow(inComponent:0)
                self.soptPartTextField.text = self.soptPartArray[row]
               
                Utility().myLog(object:self.soptPartArray[row] + "이 선택되었습니다.")
                self.soptPartTextField.endEditing(true)
            }
        })
        
        //tableView initialize
        self.currentTableView.dataSource = self
        self.currentTableView.delegate = self
        
        
        
    }
    
    
    
    // MARK: - pickerView Delegate
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return soptPartArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        return soptPartArray[row]
    }
    
     // MARK: - tableView Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
        return PersonDataModel.sharedData.registeredPersons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:"Cell", for: indexPath) as! RegistedTableViewCell
        
        let personInfo: SoptPerson = PersonDataModel.sharedData.registeredPersons[indexPath.row]
        
            Utility().myLog(object:personInfo)
        cell.nameLabel.text = personInfo.name
        cell.universityLabel.text = personInfo.university
        cell.partLabel.text = personInfo.soptPart[koreanWord]
        cell.partImageView.image = UIImage(named:personInfo.soptPart[englishWord]!)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let infoVC = storyboard?.instantiateViewController(withIdentifier: "InfoVC")  as? InfoVC else { return
            
        }
        self.navigationController?.pushViewController(infoVC, animated:true)
            infoVC.selectIndex = indexPath.row
        
    }
    
    @IBAction func touchUpInsideForAddButton(_ sender: UIButton) {
        
        if (nameTextField.text != "" && universityTextField.text != "" && soptPartTextField.text != "") {
            
            PersonDataModel.sharedData.addInPersonDataModel(inputName: nameTextField.text!, inPutUniversity: universityTextField.text!, inputSoptPart: soptPartTextField.text!)
            
            self.currentTableView.reloadData()
            
        } else {
        
            DefaultAlert().basicAlert(title:"입력오류", inputMessage: "빈칸을 모두 채워주세요", viewController:self, alertButtonStyle: .OneButtonStyle)
        }
    }
   
    // MARK:  didReceiveMemoryWarning 
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
