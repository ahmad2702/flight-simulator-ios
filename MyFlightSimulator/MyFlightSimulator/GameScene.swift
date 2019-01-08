//
//  GameScene.swift
//  MyFlightSimulator
//
//  Created by Akhmad Sadullaev on 06.01.19.
//  Copyright © 2019 Akhmad Sadullaev. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var background = SKSpriteNode()
    var flight = SKSpriteNode()
    
    var cloudTimer = Timer()
    var flightTimer = Timer()
    
    var score: Int = 0
    
    var nullSpeed: Double = 235.0       // in km/h
    var bremse: Double = 1/4            //
    var currentSpeed: Double = 847.0    // in km/h
    var currentTime: Int = 0            // in Sekunden
    var maxTime: Int = 30               // in Sekunden
    var distance: Double = 0            // in km
    
    
    struct physicsBodyNumbers{
        static let flightNumber: UInt32 = 0b1 // 1
        static let cloudNumber: UInt32 = 0b10 // 2
        
        static let emptyNumber: UInt32 = 0b1000 // 8
    }

    override func didMove(to view: SKView) {
        
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)
        self.physicsWorld.contactDelegate = self
        
        let backgroundTexture = SKTexture(imageNamed: "sky2")
        background = SKSpriteNode(texture: backgroundTexture)
        background.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        background.size.height = self.frame.height
        background.size.width = self.frame.width
        //self.addChild(background)

        
        let flightTexture = SKTexture(imageNamed: "plane2")
        flight = SKSpriteNode(texture: flightTexture)
        flight.position = CGPoint(x: self.frame.midX, y: self.frame.minY+flight.size.height)
        flight.setScale(0.5)
        flight.physicsBody = SKPhysicsBody(texture: flightTexture, size: flight.size)
        flight.physicsBody?.affectedByGravity = false
        flight.physicsBody?.categoryBitMask = physicsBodyNumbers.flightNumber
        flight.physicsBody?.collisionBitMask = physicsBodyNumbers.emptyNumber
        flight.physicsBody?.contactTestBitMask = physicsBodyNumbers.cloudNumber
        self.addChild(flight)
        
        
        cloudTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(addCloud), userInfo: nil, repeats: true)
        flightTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(checkDistance), userInfo: nil, repeats: true)
        

    }
    
    @objc func addCloud(){
        
        let cloudTexture = SKTexture(imageNamed: "cloud2")
        let cloud = SKSpriteNode(texture: cloudTexture)
        cloud.setScale(0.5)
        cloud.physicsBody = SKPhysicsBody(texture: cloudTexture, size: cloud.size)
        cloud.physicsBody?.affectedByGravity = false
        cloud.physicsBody?.categoryBitMask = physicsBodyNumbers.cloudNumber
        let randomX = CGFloat(arc4random_uniform(UInt32(self.size.width)))
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
    
    func getContactFlightVSCloud(flight: SKSpriteNode, cloud: SKSpriteNode){
        
        flight.run(SKAction.repeat(SKAction.sequence([SKAction.fadeAlpha(to: 0.1, duration: 0.1), SKAction.fadeAlpha(to: 1.0, duration: 0.1)]), count: 5))
        
    }

    func gameOver(explicit: Bool){
        if (explicit != true) {
            if(currentSpeed >= nullSpeed) {
                return
            }
        }
        
        self.removeAllActions()
        self.removeAllChildren()
        currentTime = maxTime + 1
        let gameOverScene = GameOverScene(size: self.size)
        gameOverScene.setScore(number: distance)
        self.view?.presentScene(gameOverScene)
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        //print("Kontakt!")
        
        let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        switch contactMask {
        case physicsBodyNumbers.flightNumber | physicsBodyNumbers.cloudNumber:
            
            guard let node1 = contact.bodyA.node else {
                print("Nicht gefunden")
                return
            }
            
            guard let node2 = contact.bodyB.node else {
                print("Nicht gefunden")
                return
            }
            
            getContactFlightVSCloud(flight: node1 as! SKSpriteNode, cloud: node2 as! SKSpriteNode)
            node2.removeFromParent()
            score += 1
            currentSpeed = currentSpeed - currentSpeed * bremse
            gameOver(explicit: false)
            //print(score)
        default:
            print("----")
        }
        
        //self.flight.colorBlendFactor = 0.5
    }
    
    
    @objc func checkDistance(){

        if (currentTime <= maxTime){
            let currentSpeedInMeter: Double = currentSpeed*10/36
            let distanceInMeter = currentSpeedInMeter * Double(currentTime)
            distance = distance + distanceInMeter / 1000
            print("Time: \(currentTime), Distance: \(distance), Speed: \(currentSpeed)")
            currentTime += 1
        } else {
            gameOver(explicit: true)
        }
        
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
