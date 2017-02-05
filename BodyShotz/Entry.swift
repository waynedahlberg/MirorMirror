//
//  Model.swift
//  BodyShotz
//
//  Created by Wayne Dahlberg on 2/4/17.
//  Copyright © 2017 PineBit Studios. All rights reserved.
//

import UIKit

// let model = Model()

class Entry: NSObject, NSCoding {
    
    var userWeight: Double
    var userNote: String
    let dateCreated: Date
    let entryKey: String
    
    
    init(userWeight: Double, userNote: String) {
        self.userWeight = userWeight
        self.dateCreated = Date()
        self.userNote = userNote
        
        super.init()
    }
    
    // generate a random weight between a range
    func randomDouble(min: Int, max:Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
    
    // set up a convenience init if you want to randomly fill these on initialization
    convenience init(random: Bool = false) {
        if random {
            
            let adjectives = ["braised", "grilled", "sauteed", "baked", "glazed", "microwaved"]
            let foodNames = ["chicken", "beef tips", "lettuce wraps", "ham", "toast", "cookies"]
            var index = arc4random_uniform(UInt32(foodNames.count))
            let randomAdjective = adjectives[Int(index)]
            index = arc4random_uniform(UInt32(foodNames.count))
            let randomFoodNames = foodNames[Int(index)]
            let randomFoodItem = "\(randomAdjective) \(randomFoodNames)"
            
            let randomWeight = Double(arc4random_uniform(100))
            
            self.init(userWeight: randomWeight, userNote: randomFoodItem)
        } else {
            self.init(userWeight: 0, userNote: "")
        }
    }
    
    // MARK: - NSCoding 
    required init?(coder aDecoder: NSCoder) {
        userWeight = aDecoder.decodeObject(forKey: "userWeight") as! Double
        userNote = aDecoder.decodeObject(forKey: "userNote") as! String
        dateCreated = aDecoder.decodeObject(forKey: "dateCreated") as! Date
        entryKey = aDecoder.decodeObject(forKey: "entryKey") as! String
        
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(userWeight,forKey:"userWieght")
        aCoder.encode(userNote, forKey: "userNote")
        aCoder.encode(dateCreated, forKey: "dateCreated")
        aCoder.encode(entryKey, forKey: "entryKey")
    }
    
    
    
    
    
    
}



































//class Model: NSObject {
//    let posts = [
//        [
//            "photoID": "1",
//            "photoName": "image01",
//            "photoDate": "3 December, 2017",
//            "userWeight": "212.4",
//            "userNotes": "Had chicken and rice with veggies and water for dinner."
//        ],
//        [
//            "photoID": "2",
//            "photoName": "image02",
//            "photoDate": "4 December, 2017",
//            "userWeight": "214.2",
//            "userNotes": "Had waffles and eggs and milk for dinner."
//        ],
//        [
//            "photoID": "3",
//            "photoName": "image03",
//            "photoDate": "5 December, 2017",
//            "userWeight": "213.9",
//            "userNotes": "Had bbq chicken and house salad for dinner."
//        ],
//        [
//            "photoID": "4",
//            "photoName": "image04",
//            "photoDate": "6 December, 2017",
//            "userWeight": "211.8",
//            "userNotes": "Had top ramen for dinner."
//        ]
//    ]
//}
