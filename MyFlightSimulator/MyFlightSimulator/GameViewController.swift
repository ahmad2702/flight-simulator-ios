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

        let scene1 = MainMenu(size: self.view.bounds.size)
        let view = self.view as! SKView

        view.presentScene(scene1)
        view.ignoresSiblingOrder = true

    }

    
}
