//
//  HighScoresScene.swift
//  MyFlightSimulator
//
//  Created by Akhmad Sadullaev on 08.01.19.
//  Copyright © 2019 Akhmad Sadullaev. All rights reserved.
//

import SpriteKit

class HighScoresScene: SKScene {
    
    let button = SKSpriteNode(imageNamed: "main_menu")
    
    override func didMove(to view: SKView) {
        
        let label = SKLabelNode(fontNamed:"ArialMT")
        label.position = CGPoint(x: self.frame.midX, y: self.frame.maxY-130)
        label.text = "HIGH SCORES"
        label.fontSize = 18;
        label.fontColor = SKColor.black
        self.addChild(label)
        
        let label1 = SKLabelNode(fontNamed:"ArialMT")
        label1.position = CGPoint(x: self.frame.midX, y: self.frame.midY-50)
        let scoresData = Scores.printAllData()
        print(scoresData)
        label1.text = "\(scoresData)"
        label1.fontSize = 20;
        label1.fontColor = SKColor.black
        label1.lineBreakMode = NSLineBreakMode.byWordWrapping
        label1.numberOfLines = 12
        label1.preferredMaxLayoutWidth = 500
        self.addChild(label1)
        
        button.position = CGPoint(x: self.frame.midX, y: self.frame.minY+50)
        button.setScale(0.1)
        self.addChild(button)
        
        self.backgroundColor = SKColor.white
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches{
            
            let locationUser = touch.location(in: self)
            
            if (atPoint(locationUser) == button){
                print("To main menu clicked!")
                let transition = SKTransition.crossFade(withDuration: 3)
                let gameScene = MainMenu(size: self.size)
                self.view?.presentScene(gameScene, transition: transition)
            }
            
        }
        
    }




}
