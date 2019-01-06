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
    
    var background = SKSpriteNode()
    var flight = SKSpriteNode()

    override func didMove(to view: SKView) {
        
        let backgroundTexture = SKTexture(imageNamed: "sky2")
        background = SKSpriteNode(texture: backgroundTexture)
        background.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        background.size.height = self.frame.height
        background.size.width = self.frame.width
        self.addChild(background)
        
        spawnClouds()
        spawnClouds()
        spawnClouds()
        spawnClouds()
        spawnClouds()
        spawnClouds()
        spawnClouds()
        spawnClouds()
        spawnClouds()
        spawnClouds()
        spawnClouds()
        spawnClouds()

        
        //var cloudTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: Selector("spawnClouds"), userInfo: nil, repeats: true)
        
        
        let flightTexture = SKTexture(imageNamed: "plane2")
        flight = SKSpriteNode(texture: flightTexture)
        flight.position = CGPoint(x: self.frame.midX, y: self.frame.minY+flight.size.height*2)
        //flight.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
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
    
    func spawnClouds(){
        var cloud = SKSpriteNode()
        let cloudTexture = SKTexture(imageNamed: "cloud2")
        cloud = SKSpriteNode(texture: cloudTexture)
        let minValue = self.size.width / 8
        let maxValue = self.size.width - 20
        let spawnPoint = UInt32(maxValue-minValue)
        cloud.position = CGPoint(x: CGFloat(arc4random_uniform(spawnPoint)), y: self.size.height)
        
        let action = SKAction.moveTo(y: -30, duration: 3.0)
        cloud.run(SKAction.repeatForever(action))
        self.addChild(cloud)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.location(in: self)
            
            flight.position.x = location.x
            
        }
        
        
    }
    

    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
