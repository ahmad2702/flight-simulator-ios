//
//  GameViewController.swift
//  MyFlightSimulator
//
//  Created by Akhmad Sadullaev on 06.01.19.
//  Copyright © 2019 Akhmad Sadullaev. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let scene1 = GameScene(size: self.view.bounds.size)
        let view = self.view as! SKView

        view.presentScene(scene1)

        
        
        
        
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
            
            view.showsPhysics = true

    }
    
    /**
    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    */
    
}
