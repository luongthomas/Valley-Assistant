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
    var type: ItemType = .unknown
    var value: Int = 0
    var source: String = ""
    var description: String = ""
    
    init(id: Int, name: String, type: ItemType, value: Int, source: String, description: String) {
        self.id = id
        self.name = name
        self.type = type
        self.value = value
        self.source = source
        self.description = description
    }
    
    enum CodingKeys: CodingKey {
        case id, name, type, value, source, description
    }
}


class Food: BasicItem {
    var recipe: [BasicItem]?
    var heal: Int
    var stamina: Int
    
    init(id: Int, name: String, type: ItemType, value: Int, source: String, description: String, recipe: [BasicItem]?, heal: Int, stamina: Int) {
        self.recipe = recipe
        self.heal = heal
        self.stamina = stamina
        super.init(id: id, name: name, type: type, value: value, source: source, description: description)
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}

class Crop {
    
}

enum Item: String, Codable {
    case daffodil, emerald, aquamarine, poppy, sapphire, ruby, axe, omelette
}

enum ItemType: String, Codable {
    case tool, food, mineral, unknown
}
