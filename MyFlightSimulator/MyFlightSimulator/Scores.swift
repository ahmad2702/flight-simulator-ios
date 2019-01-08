//
//  Scores.swift
//  MyFlightSimulator
//
//  Created by Akhmad Sadullaev on 08.01.19.
//  Copyright © 2019 Akhmad Sadullaev. All rights reserved.
//

import Foundation

class Scores {
    
    static var highScores = [Double]([1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8, 1.9, 1.99])

    static func getAllScores() -> Array<Double>{
        highScores.sort(by: >)
        return highScores
    }
    
    static func printAllData() -> String {
        highScores.sort(by: >)
        
        var result:String = ""
        for (index, element) in highScores.enumerated() {
            result += "\(index+1): \(element) km\n"
        }
        return result
    }
    
    static func updateScores(newScore: Double){
        highScores.sort(by: <)
        
        if(newScore > highScores[0] && newScore < highScores[highScores.count-1]){
            highScores[0] = newScore
            print("kleiner und mitte")
        } else if (newScore > highScores[highScores.count-1]){
            highScores[highScores.count-1] = newScore
        }
    }
    
    
}
