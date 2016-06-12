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
    var runningNum = ""
    var leftValStr = ""
    var rightValStr = ""
    
    enum Operation: String{
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Equal = "="
        case Empty = "Empty"
    }
    
    var currentOperation: Operation = Operation.Empty
    
    
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
        btnSound.play()
    }
    @IBAction func onDividePressed(sender: AnyObject) {
    }
    @IBAction func onMultiplyPressed(sender: AnyObject) {
    }
    @IBAction func onSubtractPressed(sender: AnyObject) {
    }
    @IBAction func onAddPressed(sender: AnyObject) {
    }
    @IBAction func onEqualPressed(sender: AnyObject) {
    }
    
}

