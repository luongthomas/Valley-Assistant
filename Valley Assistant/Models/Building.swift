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
    var basicDescription: String
    var longDescription: String
    
    var occupants: [VillagerName]
    var openTime: Time
    var closeTime: Time
    var purchasable: [Purchasable]
    
    required init(from decoder: Decoder) throws {
        let map = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try map.decode(.name)
        self.type = try map.decode(.type)
        self.basicDescription = try map.decode(.basicDescription)
        self.longDescription = try map.decode(.longDescription)
        
        self.occupants = try map.decode(.occupants)
        self.openTime = try map.decode(.openTime)
        self.closeTime = try map.decode(.closeTime)
        self.purchasable = try map.decode(.purchasable)
    }
    
    private enum CodingKeys: CodingKey {
        case name, type, basicDescription, longDescription, occupants, openTime, closeTime, purchasable
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(type)
        hasher.combine(occupants)
    }
    
    static func == (lhs: Building, rhs: Building) -> Bool {
        return lhs.name == rhs.name && lhs.type == rhs.type && lhs.occupants == rhs.occupants
    }
}

enum BuildingName: String, Codable {
    case pierresGeneralStore, carpentersShop, harveysClinic
}

enum BuildingType: String, Codable {
    case all, shop, house, communityCenter, farmUpgrades, houseUpgrades
}
