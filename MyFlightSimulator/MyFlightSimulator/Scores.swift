//
//  Scores.swift
//  MyFlightSimulator
//
//  Created by Akhmad Sadullaev on 08.01.19.
//  Copyright © 2019 Akhmad Sadullaev. All rights reserved.
//

import Foundation

class Scores {
    
    static let defaults = UserDefaults.standard
    static let dataName: String = "data_SSSS"
    
    static let max: Int = 10
    static var highScores = [Double](repeating: 0, count: max)
    
    static func saveData(){
        var stringA = highScores.description
        stringA = stringA.replacingOccurrences(of: "[", with: "")
        stringA = stringA.replacingOccurrences(of: "]", with: "")
        
        defaults.set(stringA, forKey: dataName)
    }
    
    static func getDataFromCore(){
        defaults.synchronize()
        
        if (defaults.object(forKey: dataName) == nil){
            saveData()
        }else{
            let text = defaults.object(forKey: dataName) as! String
            let array = text.components(separatedBy: ",")
            for (index, value) in array.enumerated(){
                highScores[index] = Double(value.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines))!
            }
        }
    }
    
    static func printAllData() -> String {
        getDataFromCore()

        highScores.sort(by: >)
        
        var result:String = ""
        for (index, element) in highScores.enumerated() {
            result += "\(index+1): \(element) km\n"
        }
        return result
    }
    
    static func updateScores(newScore: Double){
        getDataFromCore()
        
        highScores.sort(by: <)
        
        if(newScore > highScores[0] && newScore < highScores[highScores.count-1]){
            highScores[0] = newScore
        } else if (newScore > highScores[highScores.count-1]){
            highScores[0] = newScore
        }
        
        saveData()
    }
    
    
}
