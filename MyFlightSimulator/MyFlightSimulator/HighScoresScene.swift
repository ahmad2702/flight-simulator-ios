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
