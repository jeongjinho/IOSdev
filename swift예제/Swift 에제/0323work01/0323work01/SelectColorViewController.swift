//
//  SelectColorViewController.swift
//  0323work01
//
//  Created by 진호놀이터 on 2017. 4. 2..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

enum ColorType : Int {
    case red = 1
    case green = 2
    case blue = 3
}
class SelectColorViewController: UIViewController {

   
    @IBOutlet weak var inputColorTextField: UITextField!
    @IBOutlet weak var redColorView: UIView!
    @IBOutlet weak var greenColorView: UIView!
    @IBOutlet weak var blueColorView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func touchUpSelectColorButton(_ sender: UIButton) {
        
        print("\(sender.tag)")
        
        switch sender.tag {
        
        case 0:
            showlableForColorView(labelName:"빨강", seletedColor:ColorType(rawValue: 1)!)
            break
        case 1:
            showlableForColorView(labelName:"초록", seletedColor:ColorType(rawValue: 2)!)
            break
        case 2:
            showlableForColorView(labelName:"파랑", seletedColor:ColorType(rawValue: 3)!)
            break
            
            
        default:
            break
        }
        
    }
    
    
    func  showlableForColorView(labelName:String ,seletedColor: ColorType) {
        
        var label = UILabel();
        label.frame.size.width = 30;
        label.frame.size.height = 50;
        for v in self.redColorView.subviews{
            if v is UILabel{
                v.removeFromSuperview()
            }
        }
        for v in self.greenColorView.subviews{
            if v is UILabel{
                v.removeFromSuperview()
            }
        }
        for v in self.blueColorView.subviews{
            if v is UILabel{
                v.removeFromSuperview()
            }
        }
        
        switch seletedColor {
        case .red:  label.text = "빨강"
        label.frame.origin.x = self.redColorView.frame.width/2 - label.frame.size.width/2
        label.frame.origin.y = self.redColorView.frame.height/2 - label.frame.size.height/2
        print("\(label.frame)");
        self.redColorView .addSubview(label)
        
            break
        case .green:  label.text = "초록"
        label.frame.origin.x = self.greenColorView.frame.width/2 - label.frame.size.width/2
        label.frame.origin.y = self.greenColorView.frame.height/2 - label.frame.size.height/2
        self.greenColorView .addSubview(label)
            break
        case .blue:  label.text = "파랑"
        label.frame.origin.x = self.blueColorView.frame.width/2 - label.frame.size.width/2
        label.frame.origin.y = self.blueColorView.frame.height/2 - label.frame.size.height/2
        self.blueColorView .addSubview(label)
            break
        default:
            break
        }
        
    }
    
    
    @IBAction func touchUpInsideInputButton(_ sender: UIButton) {
        
        let inputString = self.inputColorTextField.text;
        
        if(inputString == "red" || inputString == "Red"){
        
            showlableForColorView(labelName:"빨강", seletedColor:ColorType(rawValue: 1)!)
        
        }
        else if(inputString == "green" || inputString == "Green"){
        
             showlableForColorView(labelName:"초록", seletedColor:ColorType(rawValue: 2)!)
        }
        
        else if(inputString == "blue" || inputString == "Blue"){
        
         showlableForColorView(labelName:"파랑", seletedColor:ColorType(rawValue: 3)!)
        } else {
        
            simpleAlert(title: "Error", message: "Red Green Blue 중 입력해주세요")
        }
        
        inputColorTextField.text = "";
    }
    
    func simpleAlert(title:String, message msg:String){
        
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title:"확인",style:.default)
        
        let cancelAction = UIAlertAction(title:"취소",style:.cancel)
        
        
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        present(alert,animated: true)
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
