//
//  Item.swift
//  Homepwner
//
//  Created by Tuan Pham on 3/11/17.
//  Copyright © 2017 Tuan Pham. All rights reserved.
//

import UIKit
class Item: NSObject {
    var name: String
    var valueInDollars: Int
    var serialNumber: String?
    let dateCreated: Date
    
    init(name: String, serialNumber: String?, valueInDollars: Int) {
        self.name = name
        self.valueInDollars = valueInDollars
        self.serialNumber = serialNumber
        self.dateCreated = Date()
        
        super.init()
    }
    
    // Initializer takes in arguments for name, serialNumber, and valueInDollars
    // use self to distinguish the property from the argument because argument names and property names are the same
    
    convenience init(random: Bool = false) {
        if random {
            let adjectives = ["Fluffy", "Rusty", "Shiny"]
            let nouns = ["Bear" , "Spork", "Mac"]
            
            var idx = arc4random_uniform(UInt32(adjectives.count))
            let randomAdjective = adjectives[Int(idx)]
            
            idx = arc4random_uniform(UInt32(nouns.count))
            let randomNoun = nouns[Int(idx)]
            
            let randomName = "\(randomAdjective) \(randomNoun)"
            let randomValue = Int(arc4random_uniform(100))
            let randomSerialNumber = UUID().uuidString.components(separatedBy: "-").first!
            
            self.init(name: randomName, serialNumber: randomSerialNumber, valueInDollars: randomValue)
        } else {
            self.init(name: " ", serialNumber: nil, valueInDollars: 0)
        }
    }
    
    // Convenience initializer as a helper to declare the rules for class
}
