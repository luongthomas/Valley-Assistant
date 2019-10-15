//
//  Location.swift
//  Valley Assistant
//
//  Created by Thomas Luong on 10/6/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import Foundation

enum Location: String, Codable, CustomStringConvertible {
    case home
    case willowLane
    case oneWillowLane
    case twoWillowLane
    case stardropSaloon
    case communityCenter
    case medicalClinic
    case elliotsCabin
    case theBeach
    case pierresGeneralStore
    case oneRiverRoad
    case twentyFourMountainRoad
    case marniesRanch
    case leahsCottage
    
    var description: String {
        return self.rawValue
    }
}
