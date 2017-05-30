//
//  LikeViewController.swift
//  0323work01
//
//  Created by 진호놀이터 on 2017. 4. 2..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit

class LikeViewController: UIViewController {

    @IBOutlet weak var currentLikeImageView: UIImageView!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        likeLabel.isHidden = true
        // Do any additional setup after loading the view.
    }

    @IBAction func touchUpinsideLikeButton(_ sender: UIButton) {
        
        
        switch sender.tag {
        case 0:
            currentLikeImageView.image = UIImage(named:"like")
            likeCountLabel.text = "1"
            likeLabel.isHidden = false
            break
        case 1 :
              currentLikeImageView.image = UIImage(named:"unLike")
               likeCountLabel.text = "0"
              likeLabel.isHidden = true

            break
        default:
            break
        }
        
        
        
        
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
