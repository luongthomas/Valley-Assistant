//
//  TimeLocation.swift
//  Valley Assistant
//
//  Created by Thomas Luong on 10/7/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import Foundation

struct Day: Codable, Equatable, Hashable {
    var season: Season
    var day: Int
    
    enum CodingKeys: CodingKey {
        case season, day
    }
    
    func getWeekday() -> String {
        let remainder = day % 7
        switch (remainder) {
            case 0:
                return "Sunday"
            case 1:
                return "Monday"
            case 2:
                return "Tuesday"
            case 3:
                return "Wednesday"
            case 4:
                return "Thursday"
            case 5:
                return "Friday"
            case 6:
                return "Saturday"
            default:
                return "Dayday"
        }
    }
}

enum Season: String, Codable, CustomStringConvertible, CaseIterable, Hashable {
    case all, spring, summer, fall, winter
    
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

struct TimeLocation: Codable, Hashable {
    static func == (lhs: TimeLocation, rhs: TimeLocation) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    var time: Time
    var location: Location
    var description: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(time)
        hasher.combine(location)
        hasher.combine(description)
    }
}

struct Time: Codable, Hashable {
    let hour: Int
    let min: Int
    let ampm: AMPM
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(hour)
        hasher.combine(min)
        hasher.combine(ampm)
    }
    
    func getPrintableTime() -> String {
        let hourMin = String(format: "%01d:%02d", hour, min)
        return "\(hourMin) \(ampm.rawValue.uppercased())"
    }
}

enum AMPM: String, Codable {
    case am, pm
}
