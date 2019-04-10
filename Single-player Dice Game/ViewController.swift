//
//  ViewController.swift
//  Single-player Dice Game
//
//  Created by Code Nation 21 on 09/04/2019.
//  Copyright © 2019 Code Nation 21. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
  
    @IBOutlet weak var singleDice: UIImageView!
    @IBOutlet weak var message: UILabel!
    
    @IBOutlet weak var currScore: UILabel!
    
    var allDice = [#imageLiteral(resourceName: "dice1"),#imageLiteral(resourceName: "dice2"),#imageLiteral(resourceName: "dice3"),#imageLiteral(resourceName: "dice4"),#imageLiteral(resourceName: "dice5"),#imageLiteral(resourceName: "dice6")]
    var rand: Int = 0
    var totalScore: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        message.text = ""
        rand = Int.random(in: 0 ... 5)
        singleDice.image = allDice[rand]
        totalScore +=  rand + 1
        if (rand == 0) {
            message.text = "You rolled a one! You lose!"
            totalScore = 0
        }
        else if (totalScore >= 21) {
            message.text = "You got to 21! You win!"
        }
        currScore.text = "\(totalScore)"
    }
    
//  The following code was from when the die was rolled on a button press.
//    @IBAction func rollSingleDie(_ sender: Any) {
//    }
    
    @IBAction func resetSingle(_ sender: Any) {
        message.text = ""
        singleDice.image = allDice[1]
        totalScore = 0
        currScore.text = "0"
    }
}

