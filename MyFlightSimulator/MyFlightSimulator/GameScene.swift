//
//  GameScene.swift
//  MyFlightSimulator
//
//  Created by Akhmad Sadullaev on 06.01.19.
//  Copyright © 2019 Akhmad Sadullaev. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var flight = SKSpriteNode()

    override func didMove(to view: SKView) {
        
        let flightTexture = SKTexture(imageNamed: "plane1")
        
        flight = SKSpriteNode(texture: flightTexture)
        
        flight.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        
        self.addChild(flight)

    }
    

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
    }
    

    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
