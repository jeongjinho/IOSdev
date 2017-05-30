//
//  PictureViewController.swift
//  0323work01
//
//  Created by 진호놀이터 on 2017. 4. 6..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//


import UIKit

class PictureViewController: UIViewController {
    
    @IBOutlet weak var pictureBackgroundView: UIView!
    @IBOutlet weak var zionTImageView: UIImageView!
    @IBOutlet weak var giriBoyImageView: UIImageView!
    @IBOutlet weak var heizeImageView: UIImageView!
    
    
    var defaultFrame :CGRect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     initialImageViews()
        
        // Do any additional setup after loading the view.
    }
    func initialImageViews(){
        pictureBackgroundView.frame.origin.x = 0;
        pictureBackgroundView.frame.origin.y = 150;
        pictureBackgroundView.frame.size.width = self.view.frame.size.width;
        pictureBackgroundView.frame.size.height = self.view.frame.size.height-150;
        
        
        let initialFrame :CGRect = pictureBackgroundView.frame
        
        self.zionTImageView.frame.origin.x = 0
        self.zionTImageView.frame.origin.y = 0
        self.zionTImageView.frame.size.width = initialFrame.size.width
        self.zionTImageView.frame.size.height = initialFrame.size.height/3
     

        self.giriBoyImageView.frame.origin.x = zionTImageView.frame.origin.x
        self.giriBoyImageView.frame.origin.y = zionTImageView.frame.size.height
        self.giriBoyImageView.frame.size.width = initialFrame.size.width;
        self.giriBoyImageView.frame.size.height = initialFrame.size.height/3
     
        
        self.heizeImageView.frame.origin.x = giriBoyImageView.frame.origin.x
        self.heizeImageView.frame.origin.y = giriBoyImageView.frame.size.height*2
        self.heizeImageView.frame.size.width = initialFrame.size.width;
        self.heizeImageView.frame.size.height = initialFrame.size.height/3

        
        
    
    }
    @IBAction func touchUpInsideResetButton(_ sender: UIButton) {
        
        initialImageViews();
    }
    
    @IBAction func touchUpInsideZionTButton(_ sender: UIButton) {
        
        
        initialImageViews();

        self.zionTImageView.frame.size.height *= 2
        self.giriBoyImageView.frame.origin.y = self.zionTImageView.frame.size.height
        self.giriBoyImageView.frame.size.height /= 2
        
        self.heizeImageView.frame.origin.y = self.zionTImageView.frame.size.height+self.giriBoyImageView.frame.size.height
        self.heizeImageView.frame.size.height /= 2
        
    }
    
    @IBAction func touchUpInsideGiriBoyButton(_ sender: UIButton) {
        initialImageViews();

        self.zionTImageView.frame.size.height /= 2
        self.giriBoyImageView.frame.origin.y = self.zionTImageView.frame.size.height
        self.giriBoyImageView.frame.size.height *= 2
        
        self.heizeImageView.frame.origin.y = self.zionTImageView.frame.size.height+self.giriBoyImageView.frame.size.height
        self.heizeImageView.frame.size.height /= 2
    }
    
    @IBAction func touchUpInsideHeizeButton(_ sender: UIButton) {
        
        initialImageViews();

        self.zionTImageView.frame.size.height /= 2
        self.giriBoyImageView.frame.origin.y = self.zionTImageView.frame.size.height
        self.giriBoyImageView.frame.size.height /= 2
        
        self.heizeImageView.frame.origin.y = self.zionTImageView.frame.size.height+self.giriBoyImageView.frame.size.height
        self.heizeImageView.frame.size.height *= 2
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
