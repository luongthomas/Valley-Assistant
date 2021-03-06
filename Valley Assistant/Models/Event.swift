//
//  Event.swift
//  Valley Assistant
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
    
    init(id: Int? = nil, name: String, date: Day, type: EventType, description: String, associatedVillager: Villager? = nil, eventStart: Int? = nil, eventEnd: Int? = nil) {
        
        self.name = name
        self.date = date
        self.type = type
        self.description = description
        self.associatedVillager = associatedVillager
        self.eventStart = eventStart
        self.eventEnd = eventEnd
        if let id = id {
            self.id = id
        } else {
            // Needs to be initialized before using a self function
            self.id = 1
            self.id = self.generateNextId()
        }
    }
    
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
    
    func generateNextId() -> Int {
        let birthdayCount = events.birthdays.count
        let festivalCount = events.festivals.count
        let taskCount = events.tasks.count
        return birthdayCount + festivalCount + taskCount + 1
    }
}

enum EventType: String, Codable {
    case birthday, task, festival
}

extension Event: Hashable {
    static func == (lhs: Event, rhs: Event) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name && lhs.date == rhs.date
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(id)
        hasher.combine(date)
        hasher.combine(type)
    }
}
