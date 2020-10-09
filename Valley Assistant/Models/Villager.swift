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
    var neutral: [ItemName]
    
    enum CodingKeys: CodingKey {
        case name, birthday, address, loves, likes, neutral
    }
    
    init(name: VillagerName, birthday: Day, address: Location, loves: [ItemName], likes: [ItemName], neutral: [ItemName]) {
        self.name = name
        self.birthday = birthday
        self.address = address
        self.loves = loves
        self.likes = likes
        self.neutral = neutral
    }
    
    static func == (lhs: Villager, rhs: Villager) -> Bool {
        return lhs.name == rhs.name && lhs.birthday == rhs.birthday && lhs.address == rhs.address && lhs.loves == rhs.loves && lhs.likes == rhs.likes && lhs.neutral == rhs.neutral
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(birthday)
        hasher.combine(address)
        hasher.combine(loves)
        hasher.combine(likes)
        hasher.combine(neutral)
    }
}

enum VillagerName: String, Codable, Comparable {
    static func < (lhs: VillagerName, rhs: VillagerName) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
    
    case alex, elliott, harvey, sam, sebastian, shane
    
    case abigail, emily, leah, maru, penny, haley
    
    case caroline, clint, demetrius, dwarf, evelyn, george, gus, jas, jodi, kent, krobus, lewis, linus, marnie, pam, pierre, robin, sandy, vincent, willy, wizard
    
    case bouncer, gil, governor, grandpa, gunther, henchman, marlon, morris, mrQi
}
