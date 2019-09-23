//
//  Item.swift
//  Stardew Valley Assistant
//
//  Created by Thomas Luong on 9/22/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import Foundation

class BasicItem: Codable {
    var name: String = ""
    var value: Int = 0
    var obtainMethod: String = ""
    
    init(name: String, value: Int, obtainMethod: String) {
        self.name = name
        self.value = value
        self.obtainMethod = obtainMethod
    }
    
    enum CodingKeys: CodingKey {
        case name, value, obtainMethod
    }
}


class Food: BasicItem {
    var recipe: [Item]?
    var heal: Int
    var stamina: Int
    
    init(name: String, value: Int, obtainMethod: String, recipe: [Item]?, heal: Int, stamina: Int) {
        self.recipe = recipe
        self.heal = heal
        self.stamina = stamina
        super.init(name: name, value: value, obtainMethod: obtainMethod)
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}

class Crop {
    
}

enum Item: String, Codable {
    case Daffodil, Emerald, Aquamarine, Poppy 
    
}
