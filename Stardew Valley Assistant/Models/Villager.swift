//
//  Villager.swift
//  Stardew Valley Assistant
//
//  Created by Thomas Luong on 9/22/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import Foundation

struct Villager: Codable {
    var name: String
    var id: Int
    var birthday: Day
    var address: Location
    var loves: [ItemName]
    var likes: [ItemName]
    var dislikes: [ItemName]
    
    enum CodingKeys: CodingKey {
        case name, id, birthday, address, loves, likes, dislikes
    }
    
    init(name: String, id: Int, birthday: Day, address: Location, loves: [ItemName], likes: [ItemName], dislikes: [ItemName]) {
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
    case penny
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

enum Location: String, Codable, CustomStringConvertible {
    case Home
    case WillowLane
    
    var description: String {
        return self.rawValue
    }
}

struct Schedule {
    
}
