//
//  MainMenu.swift
//  MyFlightSimulator
//
//  Created by Akhmad Sadullaev on 07.01.19.
//  Copyright © 2019 Akhmad Sadullaev. All rights reserved.
//

import SpriteKit

class MainMenu: SKScene {
    
    let playButton = SKSpriteNode(imageNamed: "play_button1")
    
    override func didMove(to view: SKView) {
        
        playButton.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        playButton.setScale(0.2)
        self.addChild(playButton)
    }
    
    
}
