//
//  Item.swift
//  Valley Assistant
//
//  Created by Thomas Luong on 9/22/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import Foundation

class Item: Codable {
    var id: Int
    var name: ItemName
    var type: ItemType
    var value: Int
    var source: String
    var description: String
    var recipe: [ItemName]?
    var heal: Int?
    var stamina: Int?
    
    required init(from decoder: Decoder) throws {
        let map = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try map.decode(.id)
        self.name = try map.decode(.name)
        self.type = try map.decode(.type)
        self.value = try map.decode(.value)
        self.source = try map.decode(.source)
        self.description = try map.decode(.description)
        
        self.recipe = try? map.decode(.recipe)
        self.heal = try? map.decode(.heal)
        self.stamina = try? map.decode(.stamina)
    }
    
    private enum CodingKeys: CodingKey {
        case id, name, type, value, source, description, recipe, heal, stamina
    }
}

enum ItemName: String, Codable {
    case daffodil, emerald, aquamarine, poppy, sapphire, ruby, axe, omelette, egg, milk, barn, bigBarn
}

enum ItemType: String, Codable {
    case all, tools, food, minerals, fish, crops, weapons, crafting, building
}

struct Purchasable: Codable, Hashable {
    var name: ItemName
    var price: Int
    
    private enum CodingKeys: CodingKey {
        case name, price
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(price)
    }
}
