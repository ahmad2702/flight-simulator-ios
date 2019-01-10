//
//  GameOverScene.swift
//  MyFlightSimulator
//
//  Created by Akhmad Sadullaev on 08.01.19.
//  Copyright © 2019 Akhmad Sadullaev. All rights reserved.
//

import SpriteKit

class GameOverScene: SKScene {
    
    var score: Double = 0
    
    let button = SKSpriteNode(imageNamed: "main_menu")
    
    func setScore(number: Double){
        score = number
    }
    
    override func didMove(to view: SKView) {
        let label = SKLabelNode(fontNamed:"ArialMT")
        label.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        label.text = "YOUR SCORE"
        label.fontSize = 18;
        label.fontColor = SKColor.black
        
        let label1 = SKLabelNode(fontNamed:"ArialMT")
        label1.position = CGPoint(x: self.frame.midX, y: self.frame.midY-30)
        label1.text = "\(score) km"
        label1.fontSize = 16;
        label1.fontColor = SKColor.black
        
        button.position = CGPoint(x: self.frame.midX, y: self.frame.minY+50)
        button.setScale(0.1)

        self.addChild(label)
        self.addChild(label1)
        self.addChild(button)
        
        self.backgroundColor = SKColor.white
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            
            let locationUser = touch.location(in: self)
            
            if (atPoint(locationUser) == button){
                Scores.updateScores(newScore: score)
                print("To main menu clicked!")
                let gameScene = MainMenu(size: self.size)
                self.view?.presentScene(gameScene)
            }
            
        }
    }



}
