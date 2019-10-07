//
//  Villager.swift
//  Valley Assistant
//
//  Created by Thomas Luong on 9/22/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import Foundation

struct Villager: Codable {
    var name: VillagerName
    var id: Int
    var birthday: Day
    var address: Location
    var loves: [ItemName]
    var likes: [ItemName]
    var dislikes: [ItemName]
    
    enum CodingKeys: CodingKey {
        case name, id, birthday, address, loves, likes, dislikes
    }
    
    init(name: VillagerName, id: Int, birthday: Day, address: Location, loves: [ItemName], likes: [ItemName], dislikes: [ItemName]) {
        self.name = name
        self.id = id
        self.birthday = birthday
        self.address = address
        self.loves = loves
        self.likes = likes
        self.dislikes = dislikes
    }
}

enum VillagerName: String, Codable {
    case penny, josh, jake, emily
}

struct Day: Codable, Equatable, Hashable {
    var season: Season
    var day: Int
    
    enum CodingKeys: CodingKey {
        case season, day
    }
}

enum Season: String, Codable, CustomStringConvertible, CaseIterable, Hashable {
    case spring, summer, fall, winter
    
    var description: String {
        return self.rawValue
    }
}

struct Schedule: Codable, Hashable {
    static func == (lhs: Schedule, rhs: Schedule) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    var locations: [TimeLocation]
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(locations)
    }
}

struct TimeLocation: Codable, Equatable {
    
    var time: Time
    var location: Location
    var description: String
}

extension TimeLocation: Hashable {
  var hashValue: Int {
  return time.hashValue ^ location.hashValue ^ description.hashValue
  }
}
