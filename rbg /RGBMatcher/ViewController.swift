//
//  ViewController.swift
//  RGBMatcher
//
//  Created by Jayne Srinivas on 10/31/21.
//

import UIKit

class ViewController: UIViewController {
   
    
    @IBOutlet var targetColorLabel: UILabel!
    @IBOutlet var myColorLabel: UILabel!
    @IBOutlet var timerText: UILabel!
    //timer
    var timer = Timer()
   
    var secRemaining = 3
    //for sliders
    var rValue: Double = 0
    var gValue: Double = 0
    var bValue: Double = 0
    
    //for target color
    var rTargetValue: Double = Double((Double.random(in: 1..<256)) )
    var gTargetValue: Double = Double((Double.random(in: 1..<256)))
    var bTargetValue: Double = Double((Double.random(in: 1..<256)))
        
    //score
    var score: Double = 0
    var rDiff : Double = 0
    var gDiff : Double = 0
    var bDiff : Double = 0
    var scoreConvert: Int = 0
    
    //alert
    var alert = UIAlertController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set the background color of the labels
        myColorLabel.backgroundColor = UIColor(red: CGFloat(rValue*255), green: CGFloat(gValue*255), blue: CGFloat(bValue*255), alpha: 1.0)
        targetColorLabel.backgroundColor = UIColor(red: CGFloat(rTargetValue), green: CGFloat(gTargetValue), blue: CGFloat(bTargetValue), alpha: 1.0)
        //borders
        targetColorLabel.layer.borderWidth = 3.0
       
    targetColorLabel.layer.borderColor = UIColor.black.cgColor
       myColorLabel.layer.borderWidth = 3.0
       myColorLabel.layer.borderColor = UIColor.black.cgColor
        view.addSubview(targetColorLabel)
        view.addSubview(myColorLabel)
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
        

    }
    //functions to get r/g/b values for the my color label
    @IBAction func rslider(_ sender: UISlider) {
        rValue = Double(sender.value)
        myColorLabel.backgroundColor = UIColor(red: CGFloat(rValue), green: CGFloat(gValue), blue: CGFloat(bValue), alpha: 1.0)
    }
    
    @IBAction func gslider(_ sender: UISlider) {
        gValue = Double(sender.value)
        myColorLabel.backgroundColor = UIColor(red: CGFloat(rValue), green: CGFloat(gValue), blue: CGFloat(bValue), alpha: 1.0)
    }

    @IBAction func bslider(_ sender: UISlider) {
        bValue = Double(sender.value)
        myColorLabel.backgroundColor = UIColor(red: CGFloat(rValue), green: CGFloat(gValue), blue: CGFloat(bValue), alpha: 1.0)
    }
    
    //when timer ends, create function to calculate score
    @objc func timerFunction(_ sender: UISlider){
        if (secRemaining) > 0{
            timerText.text = "Time Left: \(secRemaining)"
            secRemaining-=1
        }
        else{
            timerText.text = "Time Left: 0"
            timer.invalidate()
       // rDiff = abs(pow(rTargetValue - (rValue * 255)),2)
        //gDiff = abs((gTargetValue - (gValue * 255)),2)
        
            
           // bDiff = abs((bTargetValue - (bValue * 255)),2)
         
           // print(rDiff)
           // print(gDiff)
           // print(bDiff)
            
            
            score = abs(1-(sqrt(abs(pow(rTargetValue - (rValue * 255),2) + pow(gTargetValue - (gValue * 255),2) + pow(bTargetValue - (bValue * 255),2)))))
            
                         
            print(score)
            scoreConvert = Int(round(score))
            
            
            //alert the user about the score
            alert = UIAlertController(title: "Game Over", message: "Score: \(scoreConvert)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: nil))
            self.present(alert, animated: true)
           // alert.addAction(UIAlertAction)
           resetGame()
        }
        
        
    }
    
    func resetGame(){
        rTargetValue = Double((Double.random(in: 1..<256)) / 255)
        
        gTargetValue = Double((Double.random(in: 1..<256)) / 255)
        
        bTargetValue = Double((Double.random(in: 1..<256)) / 255)
        
        targetColorLabel.backgroundColor = UIColor(red: CGFloat(rTargetValue), green: CGFloat(gTargetValue), blue: CGFloat(bTargetValue), alpha: 1.0)
        
        
       // timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
        secRemaining = 3
        
        timerText.text = "Time Left: \(secRemaining)"
       timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
        
        view.addSubview(targetColorLabel)
        
        
    }

    
}


