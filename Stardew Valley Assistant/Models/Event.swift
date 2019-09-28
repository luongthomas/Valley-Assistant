//
//  Event.swift
//  Stardew Valley Assistant
//
//  Created by Thomas Luong on 9/25/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import Foundation

class AllEvents: Codable {
    var birthdays = [Event]()
    var festivals = [Event]()
    var tasks = [Event]()
    
    required init(from decoder: Decoder) throws {
        let map = try decoder.container(keyedBy: CodingKeys.self)
        self.birthdays = try map.decode(.birthdays)
        self.festivals = try map.decode(.festivals)
        self.tasks = try map.decode(.tasks)
    }
    
    private enum CodingKeys: CodingKey {
        case birthdays, festivals, tasks
    }
}

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

// MARK: - DateClass
struct DateClass: Codable {
    let season: String
    let day: Int
}

extension Event: Hashable {
    static func == (lhs: Event, rhs: Event) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name && lhs.date == rhs.date
    }
    
  var hashValue: Int {
    return name.hashValue ^ id.hashValue ^ date.hashValue ^ type.hashValue
  }
}
