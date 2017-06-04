//
//  SplashVC.swift
//  seminar_8
//
//  Created by 하태경 on 2017. 6. 2..
//  Copyright © 2017년 addcampus. All rights reserved.
//

import Foundation
import UIKit

class SplashVC : UIViewController,UIGestureRecognizerDelegate {


    var delayInSeconds = 2.0
    let ud = UserDefaults.standard
    
    
    
    override func viewDidLoad() {
        
       // let accountSequence = self.ud.value(forKey: "accountSequence") as! Int
        let accountSequence = self.ud.integer(forKey: "accountSequence")
        print("어카운트시퀀스")
      
            
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
            print(accountSequence)
            
            if accountSequence == 150621{
                
                
                print("come")
                let main_storyboard = UIStoryboard(name: "Main", bundle: nil)
                guard let main = main_storyboard.instantiateViewController(withIdentifier: "MainVC") as? MainVC else {return}
                self.present(main, animated: true, completion: nil)
                
            }
                
            else{
            guard let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") else {return}
        self.present(loginVC, animated: true, completion: nil)
            }
            
        }//DispatchQueue.main
    
       
        
    }//viewDidLoad
    

}
