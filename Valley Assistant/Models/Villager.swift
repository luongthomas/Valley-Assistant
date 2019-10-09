//
//  Villager.swift
//  Valley Assistant
//
//  Created by Thomas Luong on 9/22/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import Foundation

struct Villager: Codable, Hashable {
    var name: VillagerName
    var birthday: Day
    var address: Location
    var loves: [ItemName]
    var likes: [ItemName]
    var dislikes: [ItemName]
    
    enum CodingKeys: CodingKey {
        case name, birthday, address, loves, likes, dislikes
    }
    
    init(name: VillagerName, birthday: Day, address: Location, loves: [ItemName], likes: [ItemName], dislikes: [ItemName]) {
        self.name = name
        self.birthday = birthday
        self.address = address
        self.loves = loves
        self.likes = likes
        self.dislikes = dislikes
    }
    
    static func == (lhs: Villager, rhs: Villager) -> Bool {
        return lhs.name == rhs.name && lhs.birthday == rhs.birthday && lhs.address == rhs.address && lhs.loves == rhs.loves && lhs.likes == rhs.likes && lhs.dislikes == rhs.dislikes
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(birthday)
        hasher.combine(address)
        hasher.combine(loves)
        hasher.combine(likes)
        hasher.combine(dislikes)
    }
}

enum VillagerName: String, Codable {
    case penny, josh, jake, emily,
    pierre, caroline, abigail, harvey, clint, morris, gus
}
