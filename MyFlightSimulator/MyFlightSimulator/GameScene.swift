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
    
    var cloudTimer = Timer()
    
    struct physicsBodyNumbers{
        static let flightNumber: UInt32 = 0b1 // 1
        static let cloudNumber: UInt32 = 0b10 // 2
        
        static let emptyNumber: UInt32 = 0b1000 // 8
    }

    override func didMove(to view: SKView) {
        
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)
        
        let backgroundTexture = SKTexture(imageNamed: "sky2")
        background = SKSpriteNode(texture: backgroundTexture)
        background.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        background.size.height = self.frame.height
        background.size.width = self.frame.width
        //self.addChild(background)

        
        let flightTexture = SKTexture(imageNamed: "plane2")
        flight = SKSpriteNode(texture: flightTexture)
        flight.position = CGPoint(x: self.frame.midX, y: self.frame.minY+flight.size.height*2)
        flight.physicsBody = SKPhysicsBody(circleOfRadius: flight.size.width/2)
        flight.physicsBody?.affectedByGravity = false
        flight.physicsBody?.categoryBitMask = physicsBodyNumbers.flightNumber
        flight.physicsBody?.collisionBitMask = physicsBodyNumbers.emptyNumber
        self.addChild(flight)
        
        
        cloudTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(addCloud), userInfo: nil, repeats: true)

        

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
    
    @objc func addCloud(){
    
        let cloud = SKSpriteNode(imageNamed: "cloud2")
        cloud.setScale(1.0)
        cloud.physicsBody = SKPhysicsBody(circleOfRadius: cloud.size.width/2)
        cloud.physicsBody?.affectedByGravity = false
        cloud.physicsBody?.categoryBitMask = physicsBodyNumbers.cloudNumber
        let randomX = CGFloat(arc4random_uniform(UInt32(self.size.width)))-self.size.width/2
        cloud.position = CGPoint(x: randomX, y: self.frame.maxY)
        self.addChild(cloud)
        
        let moveDown = SKAction.moveTo(y: -cloud.size.height*10, duration: 3)
        moveDown.speed = 1.0
        let delete = SKAction.removeFromParent()
        cloud.run(SKAction.sequence([moveDown, delete]))
        
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
