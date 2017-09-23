//
//  BackgroundMusicVC.swift
//  MusicApp
//
//  Created by 진호놀이터 on 2017. 7. 30..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit
import AVFoundation
class BackgroundMusicVC: UIViewController {

    var audioFile:URL!
    var audioPlayer: AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()

    
     //   startMusic()
        
        
        
    }
    
    
    func startMusic() {
        
        
        audioFile = Bundle.main.url(forResource:"Bolbbalgan4 - 프리지아", withExtension:"mp3")
        audioPlayer.volume = 10
        do {
            audioPlayer =  try AVAudioPlayer(contentsOf: audioFile)
        } catch let error as NSError {
            print("Error-initPlay: \(error)")
        }
        
        audioPlayer.prepareToPlay()
        audioPlayer.numberOfLoops = -1
        audioPlayer.play()
        
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
