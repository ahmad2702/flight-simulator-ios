//
//  MainMenu.swift
//  MyFlightSimulator
//
//  Created by Akhmad Sadullaev on 07.01.19.
//  Copyright © 2019 Akhmad Sadullaev. All rights reserved.
//

import SpriteKit

class MainMenu: SKScene {
    
    let playButton = SKSpriteNode(imageNamed: "play")
    let scoreButton = SKSpriteNode(imageNamed: "high_scores")
    
    override func didMove(to view: SKView) {
        
        playButton.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        playButton.setScale(0.2)
        self.addChild(playButton)
        
        scoreButton.position = CGPoint(x: self.frame.midX, y: self.frame.midY-50)
        scoreButton.setScale(0.2)
        self.addChild(scoreButton)
        
        self.backgroundColor = SKColor.white
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches{
            
            let locationUser = touch.location(in: self)
            
            if (atPoint(locationUser) == playButton){
                let transition = SKTransition.crossFade(withDuration: 3)
                let gameScene = GameScene(size: self.size)
                self.view?.presentScene(gameScene, transition: transition)
            }
            
        }
        
    }
    
    
}
