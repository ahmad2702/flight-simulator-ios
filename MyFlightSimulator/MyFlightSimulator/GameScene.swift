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
    var background = SKSpriteNode()
    

    override func didMove(to view: SKView) {
        
        let backgroundTexture = SKTexture(imageNamed: "sky1")
        background = SKSpriteNode(texture: backgroundTexture)
        background.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        background.size.height = self.frame.height
        background.size.width = self.frame.width
        self.addChild(background)
        
        let flightTexture = SKTexture(imageNamed: "plane1")
        flight = SKSpriteNode(texture: flightTexture)
        flight.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        self.addChild(flight)
        
        
        
        /**
        let screen = UIScreen.main
        let screenWidth = screen.bounds.size.width
        let height = screen.bounds.size.height
        print("Screen: \(screenWidth) x \(height)")
        
        let colorViewWidth = colorView.frame.size.width
        print("ColorView: \(colorViewWidth)")
        
        
        colorView.center.x = colorViewWidth/2 + CGFloat(sender.value) * (screenWidth-colorViewWidth)
        */

    }
    

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
    }
    

    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
