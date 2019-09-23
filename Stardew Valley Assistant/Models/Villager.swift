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
    var loves: [Item]
    var likes: [Item]
    var dislikes: [Item]
    
    enum CodingKeys: CodingKey {
        case name, id, birthday, address, loves, likes, dislikes
    }
    
    init(name: String, id: Int, birthday: Day, address: Location, loves: [Item], likes: [Item], dislikes: [Item]) {
        self.name = name
        self.id = id
        self.birthday = birthday
        self.address = address
        self.loves = loves
        self.likes = likes
        self.dislikes = dislikes
    }
}

struct Day: Codable {
    var season: Season
    var day: Int
    
    enum CodingKeys: CodingKey {
        case season, day
    }
}

enum Season: String, Codable, CustomStringConvertible {
    case Spring, Summer, Fall, Winter
    
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