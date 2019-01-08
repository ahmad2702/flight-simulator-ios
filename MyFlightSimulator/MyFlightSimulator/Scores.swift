//
//  Scores.swift
//  MyFlightSimulator
//
//  Created by Akhmad Sadullaev on 08.01.19.
//  Copyright © 2019 Akhmad Sadullaev. All rights reserved.
//

import Foundation

class Scores {
    
    static var highScores = [Double]([1.1, 1.2, 1.3, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8, 1.9, 2.0])

    static func getAllScores() -> Array<Double>{
        highScores.sort(by: >)
        return highScores
    }
    
    
    
    
}
