//
//  ViewController.swift
//  Single-player Dice Game
//
//  Created by Code Nation 21 on 09/04/2019.
//  Copyright © 2019 Code Nation 21. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
  
    @IBOutlet weak var singleRollDie: UIButton!
    @IBOutlet weak var singleDieImage: UIImageView!
    @IBOutlet weak var currentScoreText: UILabel!
    @IBOutlet weak var messageText: UILabel!
    @IBOutlet weak var singleResetButton: UIButton!
    
    var allDice = [#imageLiteral(resourceName: "dice1"),#imageLiteral(resourceName: "dice2"),#imageLiteral(resourceName: "dice3"),#imageLiteral(resourceName: "dice4"),#imageLiteral(resourceName: "dice5"),#imageLiteral(resourceName: "dice6")]
    var isGamePlaying: Bool = true
    var rand: Int = 0
    var totalScore: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        singleResetButton.isHidden = true
        messageText.isHidden = true
        singleDieImage.isHidden = true
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if (isGamePlaying) {singleRollDieFunc()}
        else {singleResetFunc()}
    }
    
    
    
    func singleRollDieFunc() {
        messageText.isHidden = true
        rand = Int.random(in: 0 ... 5)
        singleDieImage.isHidden = false
        singleDieImage.image = allDice[rand]
        totalScore +=  rand + 1
        if (rand == 0) {
            messageText.isHidden = false
            messageText.text = "You rolled a one! You lose!"
            totalScore = 0
            isGamePlaying = false
            singleRollDie.isHidden = true
        }
        else if (totalScore >= 21) {
            messageText.isHidden = false
            messageText.text = "You got to 21! You win!"
            isGamePlaying = false
            singleRollDie.isHidden = true
        }
        currentScoreText.text = "\(totalScore)"
        singleResetButton.isHidden = false
    }
    
    func singleResetFunc() {
        isGamePlaying = true
        messageText.text = ""
        singleDieImage.isHidden = true
        singleRollDie.isHidden = false
        totalScore = 0
        currentScoreText.text = "0"
        singleResetButton.isHidden = true
    }
    
    @IBAction func singleRollDie(_ sender: Any) {
        if (isGamePlaying) {singleRollDieFunc()}
    }
    
    @IBAction func singleReset(_ sender: Any) {
        singleResetFunc()
    }
    
    
}

