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
    case twoWillowLane
    case stardropSaloon
    case communityCenter
    case harveysClinic
    case theBeach
    case pierresGeneralStore
    
    var description: String {
        return self.rawValue
    }
}
