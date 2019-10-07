//
//  Building.swift
//  Valley Assistant
//
//  Created by Thomas Luong on 9/30/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import Foundation

class Building: Codable {
    var id: Int
    var name: String
    var type: BuildingType
    var description: String
    
    var occupants: [VillagerName]
    var openTime: Time
    var closeTime: Time
    var obtainables: [ItemName]
    
    required init(from decoder: Decoder) throws {
        let map = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try map.decode(.id)
        self.name = try map.decode(.name)
        self.type = try map.decode(.type)
        self.description = try map.decode(.description)
        
        self.occupants = try map.decode(.occupants)
        self.openTime = try map.decode(.openTime)
        self.closeTime = try map.decode(.closeTime)
        self.obtainables = try map.decode(.obtainables)
    }
    
    private enum CodingKeys: CodingKey {
        case id, name, type, description, occupants, openTime, closeTime, obtainables
    }
}

enum BuildingType: String, Codable {
    case shop, house, communityCenter
}

struct Time: Codable, Hashable {
    let hour: Int
    let min: Int = 00
    let ampm: AMPM
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(hour)
        hasher.combine(min)
        hasher.combine(ampm)
    }
}

enum AMPM: String, Codable {
    case am, pm
}
