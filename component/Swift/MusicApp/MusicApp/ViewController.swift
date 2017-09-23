//
//  ViewController.swift
//  MusicApp
//
//  Created by 진호놀이터 on 2017. 7. 21..
//  Copyright © 2017년 진호놀이터. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController,AVAudioPlayerDelegate,AVAudioRecorderDelegate {
    //녹음
    var audioRecorder: AVAudioRecorder!
    var isRecordMode = false
    @IBOutlet weak var recordBtn: UIButton!
    
    @IBOutlet weak var recordTime: UILabel!
    
    
    //음악
    var audioPlayer: AVAudioPlayer!
    var audioFile:URL!
    var MAX_VOLUME:Float = 10.0
    var progressTimer : Timer!
    
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var pvProgressPlay: UIProgressView!
   
    @IBOutlet weak var endTime: UILabel!
    @IBOutlet weak var currentTime: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        selectAudioFile()
        if !isRecordMode{
        
        initPlay()
        recordBtn.isEnabled = false
        recordTime.isEnabled = false
        }else{
            initRecord()
        }
        
        
        
        
    }
    
    func initPlay() {
        
        
        do {
          audioPlayer =  try AVAudioPlayer(contentsOf: audioFile)
        } catch let error as NSError {
            print("Error-initPlay: \(error)")
        }
        
        volumeSlider.maximumValue = MAX_VOLUME
        volumeSlider.value = 1.0
        pvProgressPlay.progress = 0
        
        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()
        audioPlayer.volume = volumeSlider.value
        endTime.text = convertNSTimeInterval2String(audioPlayer.duration)
        currentTime.text = convertNSTimeInterval2String(0)
        
        setPlayButtons(true, pause: false, stop: false)
        
    }
    @IBOutlet weak var stopBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var btnPlay: UIButton!

    
    
    func setPlayButtons(_ play:Bool, pause:Bool,stop:Bool) {
        
        
        btnPlay.isEnabled = play
        pauseBtn.isEnabled = pause
        stopBtn.isEnabled = stop
        
    }
   
    func convertNSTimeInterval2String( _ time:TimeInterval
        
        ) -> String {
        
        let min = Int(time/60)
        //time갑을 60으로 나눈값의 나머지
        let sec = Int(time.truncatingRemainder(dividingBy: 60))
        let strTime = String(format: "%02d:%02d", min,sec)
        return strTime
        
        
    }

    @IBAction func changeVolume(_ sender: UISlider) {
        
        audioPlayer.volume = volumeSlider.value
    }
    @IBAction func touchUpinsidePlay(_ sender: UIButton) {
        audioPlayer.play()
        setPlayButtons(false, pause: true, stop: true)
        let timePlayerSelector:Selector = #selector(ViewController.updatePlayTime)
        progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timePlayerSelector, userInfo: nil, repeats: true)
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        progressTimer.invalidate()
        setPlayButtons(true, pause: false, stop: false)
        pvProgressPlay.progress = 0
    }
    func updatePlayTime() {
        
        
        currentTime.text = convertNSTimeInterval2String(audioPlayer.currentTime)
        pvProgressPlay.progress = Float(audioPlayer.currentTime/audioPlayer.duration)
    }

    @IBAction func touchUpinsidePause(_ sender: UIButton) {
        audioPlayer.pause()
        setPlayButtons(true, pause: false, stop: true)
    }
   
    @IBAction func touchUpInsideStop(_ sender: UIButton) {
        audioPlayer.stop()
      
        audioPlayer.currentTime = 0
        currentTime.text = convertNSTimeInterval2String(0)
          setPlayButtons(true, pause: false, stop: false)
        progressTimer.invalidate()
    }
    
    func selectAudioFile()  {
        
        if !isRecordMode{
        
             audioFile = Bundle.main.url(forResource:"111", withExtension:"wav")
        } else{
        
            let documnetDirectory = FileManager.default.urls(for:.documentDirectory, in: .userDomainMask)[0]
            audioFile = documnetDirectory.appendingPathComponent("recordFile.m4a")
            
            let data = try? Data(contentsOf: audioFile);
            print("\(data)")
        }
    }
    
    
    func initRecord() {
        
        
        let recordSettings = [
            
            AVFormatIDKey: NSNumber(value: kAudioFormatAppleLossless as UInt32),AVEncoderAudioQualityKey : AVAudioQuality.max.rawValue,
            AVEncoderBitRateKey: 320000,
            AVNumberOfChannelsKey : 2,
        AVSampleRateKey: 44100.0] as [String:Any]
        do {
       audioRecorder  =  try AVAudioRecorder(url: audioFile, settings: recordSettings)
        } catch let error as NSError {
            
            print("Error - initRecord: \(error)")
        }
        
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        
        volumeSlider.value = 1.0
        audioPlayer.volume = volumeSlider.value
        endTime.text = convertNSTimeInterval2String(0)
        currentTime.text = convertNSTimeInterval2String(0)
        setPlayButtons(false, pause: false, stop: false)
        
        
        let session = AVAudioSession.sharedInstance()
        
        do {
            try session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        } catch let error as NSError {
            print("Error - setCategory : \(error)")
        }
        
        do {
            try session.setActive(true)
        }catch let error as NSError {
            print("Error - setActive : \(error)")
        }

    }
    
    @IBAction func valueChangedRecordMode(_ sender: UISwitch) {
        
        
        if sender.isOn {
            
            audioPlayer.stop()
            audioPlayer.currentTime = 0
            recordTime.text = convertNSTimeInterval2String(0)
            isRecordMode = true
            recordBtn.isEnabled = true
            recordTime.isEnabled = true
        }else{
        
            isRecordMode = false
            recordBtn.isEnabled = false
            recordTime.isEnabled = false
            recordTime.text = convertNSTimeInterval2String(0)
            
        
        }
        
        selectAudioFile()
        if !isRecordMode{
                initPlay()
        }else{
        
            initRecord()
        }
    }
    
    @IBAction func touchUpinisdeRecord(_ sender: UIButton) {
        
        if sender.titleLabel?.text == "Record"{
        
        
            audioRecorder.record()
            sender.setTitle("Stop", for: .normal)
            let timeRecordSelector = #selector(ViewController.updateRecordTime)
            progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timeRecordSelector, userInfo: nil, repeats: true)
        }else{
        
            audioRecorder.stop()
            progressTimer.invalidate()
            sender.setTitle("Record", for: .normal)
            btnPlay.isEnabled = true
            initPlay()
        
        }
    }
    
    func updateRecordTime() {
        recordTime.text = convertNSTimeInterval2String(audioRecorder.currentTime)
        
    }
    
}

