//
//  Item.swift
//  Valley Assistant
//
//  Created by Thomas Luong on 9/22/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import Foundation

class Item: Codable, Hashable {
    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.name == rhs.name && lhs.type == rhs.type && lhs.value == rhs.value && lhs.source == rhs.source && lhs.basicDescription == rhs.basicDescription && lhs.longDescription == rhs.longDescription && lhs.recipe == rhs.recipe && lhs.heal == rhs.heal && lhs.energy == rhs.energy
    }
    
    var name: ItemName
    var type: ItemType
    var value: Int
    var source: String
    var basicDescription: String
    var longDescription: String
    var recipe: [ItemName]?
    var heal: Int?
    var energy: Int?
    var growthTimeDays: Int?
    var seasonToGrow: [Season]?
    
    required init(from decoder: Decoder) throws {
        let map = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try map.decode(.name)
        self.type = try map.decode(.type)
        self.value = try map.decode(.value)
        self.source = try map.decode(.source)
        self.basicDescription = try map.decode(.basicDescription)
        self.longDescription = try map.decode(.longDescription)
        
        self.recipe = try? map.decode(.recipe)
        self.heal = try? map.decode(.heal)
        self.energy = try? map.decode(.energy)
        self.growthTimeDays = try? map.decode(.growthTimeDays)
        self.seasonToGrow = try? map.decode(.seasonToGrow)
    }
    
    private enum CodingKeys: CodingKey {
        case name, type, value, source, basicDescription, longDescription, recipe, heal, energy, growthTimeDays, seasonToGrow
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(type)
        hasher.combine(value)
        hasher.combine(basicDescription)
        hasher.combine(recipe)
        hasher.combine(heal)
        hasher.combine(energy)
        hasher.combine(growthTimeDays)
        hasher.combine(seasonToGrow)
    }
}


enum ItemType: String, Codable {
    case all, tools, food, minerals, fish, crops, weapons, crafting, building, furniture, unlockable, animalProducts, artisanGoods, forageables
}

class Purchasable: Codable, Hashable {
    static func == (lhs: Purchasable, rhs: Purchasable) -> Bool {
        return lhs.name == rhs.name && lhs.price == rhs.price && lhs.availableSeason == rhs.availableSeason
    }
    
    var name: ItemName
    var price: Int
    var availableSeason: [Season]?
    var ingredients: [ItemName: Int]?
    
    private enum CodingKeys: CodingKey {
        case name, price, availableSeason, ingredients
    }
    
    required init(from decoder: Decoder) throws {
        let map = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try map.decode(.name)
        self.price = try map.decode(.price)
        
        self.availableSeason = try? map.decode(.availableSeason)
        self.ingredients = try? map.decode(.ingredients)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(price)
    }
}
