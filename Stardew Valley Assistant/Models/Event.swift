//
//  Event.swift
//  Stardew Valley Assistant
//
//  Created by Thomas Luong on 9/25/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import Foundation

class Event: Codable {
    var id: Int
    var name: String
    var date: Day
    var type: EventType
    var description: String
    
    var associatedVillager: Villager?
    var eventStart: Int?
    var eventEnd: Int?
    
    required init(from decoder: Decoder) throws {
        let map = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try map.decode(.id)
        self.name = try map.decode(.name)
        self.date = try map.decode(.date)
        self.type = try map.decode(.type)
        self.description = try map.decode(.description)
        
        self.associatedVillager = try? map.decode(.associatedVillager)
        self.eventStart = try? map.decode(.eventStart)
        self.eventEnd = try? map.decode(.eventEnd)
    }
    
    private enum CodingKeys: CodingKey {
        case id, name, date, type, description, associatedVillager, eventStart, eventEnd
    }
}

enum EventType: String, Codable {
    case birthday, task, festival
}
