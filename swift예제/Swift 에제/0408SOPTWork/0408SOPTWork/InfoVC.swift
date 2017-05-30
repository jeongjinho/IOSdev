//
//  InfoVC.swift
//  0408SOPTWork
//
//  Created by 진호놀이터 on 2017. 5. 5..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class InfoVC: UIViewController {

    @IBOutlet weak var partImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var universityLabel: UILabel!
   
    var selectIndex: Int!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        Utility().myLog(object: selectIndex)
        let selectedPerson: SoptPerson = PersonDataModel.sharedData.registeredPersons[selectIndex]
        
        self.partImageView.image = UIImage(named:selectedPerson.soptPart[englishWord]!)
        self.nameLabel.text = selectedPerson.name
        self.universityLabel.text = selectedPerson.university
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
