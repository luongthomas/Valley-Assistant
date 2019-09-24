//
//  Item.swift
//  Stardew Valley Assistant
//
//  Created by Thomas Luong on 9/22/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import Foundation

class BasicItem: Codable {
    var id: Int = 0
    var name: String = ""
    var value: Int = 0
    var obtainMethod: String = ""
    var description: String = ""
    
    init(id: Int, name: String, value: Int, obtainMethod: String, description: String) {
        self.id = id
        self.name = name
        self.value = value
        self.obtainMethod = obtainMethod
        self.description = description
    }
    
    enum CodingKeys: CodingKey {
        case id, name, value, obtainMethod, description
    }
}


class Food: BasicItem {
    var recipe: [BasicItem]?
    var heal: Int
    var stamina: Int
    
    init(id: Int, name: String, value: Int, obtainMethod: String, description: String, recipe: [BasicItem]?, heal: Int, stamina: Int) {
        self.recipe = recipe
        self.heal = heal
        self.stamina = stamina
        super.init(id: id, name: name, value: value, obtainMethod: obtainMethod, description: description)
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
