//
//  Building.swift
//  Valley Assistant
//
//  Created by Thomas Luong on 9/30/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import Foundation

class Building: Codable, Hashable {
    var name: BuildingName
    var type: BuildingType
    var description: String
    
    var occupants: [VillagerName]
    var openTime: Time
    var closeTime: Time
    var purchasable: [Purchasable]
    
    required init(from decoder: Decoder) throws {
        let map = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try map.decode(.name)
        self.type = try map.decode(.type)
        self.description = try map.decode(.description)
        
        self.occupants = try map.decode(.occupants)
        self.openTime = try map.decode(.openTime)
        self.closeTime = try map.decode(.closeTime)
        self.purchasable = try map.decode(.purchasable)
    }
    
    private enum CodingKeys: CodingKey {
        case name, type, description, occupants, openTime, closeTime, purchasable
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(type)
        hasher.combine(description)
        hasher.combine(occupants)
        hasher.combine(openTime)
        hasher.combine(closeTime)
        hasher.combine(purchasable)
    }
    
    static func == (lhs: Building, rhs: Building) -> Bool {
        return lhs.name == rhs.name && lhs.type == rhs.type && lhs.description == rhs.description && lhs.occupants == rhs.occupants && lhs.openTime == lhs.openTime && rhs.closeTime == rhs.closeTime && lhs.purchasable == rhs.purchasable
    }
}

enum BuildingName: String, Codable {
    case pierresGeneralStore, carpentersShop
}

enum BuildingType: String, Codable {
    case all, shop, house, communityCenter, farmUpgrades, houseUpgrades
}
