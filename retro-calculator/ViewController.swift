//
//  ViewController.swift
//  retro-calculator
//
//  Created by Gordon Seto on 2016-06-11.
//  Copyright © 2016 Gordon Seto. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    // MARK: Properties
    var btnSound: AVAudioPlayer!
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    
    enum Operation: String{
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
    }
    
    var currentOperation: Operation = Operation.Empty
    var result = ""
    
    // MARK: Outlets
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        let soundUrl = NSURL(fileURLWithPath: path!)
        do {
            try btnSound = AVAudioPlayer(contentsOfURL: soundUrl)
            btnSound.prepareToPlay()
        } catch let err as NSError{
            print(err.debugDescription)
        }
    }
    // MARK: Actions
    
    @IBAction func numberPressed(btn: UIButton!){
        playSound()
        
        runningNumber += "\(btn.tag)"
        outputLabel.text = runningNumber;
    }
    
    @IBAction func onDividePressed(sender: AnyObject) {
        processOperation(Operation.Divide)
    }
    
    @IBAction func onMultiplyPressed(sender: AnyObject) {
        processOperation(Operation.Multiply)
    }
    
    @IBAction func onSubtractPressed(sender: AnyObject) {
        processOperation(Operation.Subtract)
    }
    
    @IBAction func onAddPressed(sender: AnyObject) {
        processOperation(Operation.Add)
    }
    
    @IBAction func onEqualPressed(sender: AnyObject) {
        processOperation(currentOperation)
    }
    
    func processOperation(op: Operation){
        playSound()
        
        if currentOperation != Operation.Empty {
            //run some math
            
            // A user selected an operator, but then selected another operator without
            //first entering a number
            if runningNumber != "" {
            
                rightValStr = runningNumber
                runningNumber = ""
            
                if currentOperation == Operation.Multiply {
                    result = "\(Double(leftValStr)! * (Double(rightValStr))!)"
                }
                else if currentOperation == Operation.Divide {
                    result = "\(Double(leftValStr)! / (Double(rightValStr))!)"
                }
                else if currentOperation == Operation.Subtract {
                    result = "\(Double(leftValStr)! - (Double(rightValStr))!)"
                }
                else if currentOperation == Operation.Add {
                    result = "\(Double(leftValStr)! + (Double(rightValStr))!)"
                }
                
                outputLabel.text = result
                leftValStr = result
            }
            
            currentOperation = op
            
        } else{
            //this is the first time an operator has been pressed
            leftValStr = runningNumber
            runningNumber = ""
            currentOperation = op
        }
    }
    
    func playSound(){
        if btnSound.playing {
            btnSound.stop()
        }
        btnSound.play()
    }
}

