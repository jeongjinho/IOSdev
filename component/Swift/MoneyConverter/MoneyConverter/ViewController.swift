//
//  ViewController.swift
//  MoneyConverter
//
//  Created by 진호놀이터 on 2017. 9. 3..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var targertMoneyLbl: UILabel!
    @IBOutlet weak var sourceMoneyTxtField: UITextField!
    @IBOutlet weak var currencySegment: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func touchUpInsideConvertLbl(_ sender: Any) {
        
        guard let sourceCurrency = Currency(rawValue: currencySegment.selectedSegmentIndex) else{
        
            print("Source Currency Error")
            
            return
        }
        
        guard let sourceAmount = Double(sourceMoneyTxtField.text!) else {
                print("Error")
            return  }
        
        let sourceMoney = Money(sourceAmount, currency: sourceCurrency)
        
     //  let ratio : Double
//        switch currencySegment.selectedSegmentIndex {
//        case 0:
//            ratio = 0.0085
//        case 1:
//            ratio = 1178.5
//        default:
//            ratio = 1.0
//        }
        
        
        var targertMoneyString = ""
        
//        if let sourceMoney = Double(sourceMoneyTxtField.text!){
//        
//            targertMoneyString = "\(sourceMoney * ratio)"
//        
//        }else{
//        
//            targertMoneyString = "error"
//        }

        for  i in 0 ..< 4 {
        
            targertMoneyString += sourceMoney.valueInCurrency(currency:Currency(rawValue: i)!)
            targertMoneyString += "\r\n"
        }
        
        targertMoneyLbl.text = targertMoneyString 
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

