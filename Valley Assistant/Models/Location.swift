//
//  Location.swift
//  Valley Assistant
//
//  Created by Thomas Luong on 10/6/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import Foundation

enum Location: String, Codable, CustomStringConvertible {
    case yourFarm
    case home
    case willowLane
    case oneWillowLane
    case twoWillowLane
    case stardropSaloon
    case communityCenter
    case medicalClinic
    case elliotsCabin
    case beach
    case generalStore
    case oneRiverRoad
    case twentyFourMountainRoad
    case marniesRanch
    case leahsCottage
    case trailer
    case theMines
    case theSewers
    case mayorsManor
    case tent
    case oasis
    case iceCreamStand
    case spa
    case cindersapForest
    case library
    case townSquare
    case jojaMart
    case museum
    case wizardsTower
    case fishShop
    case pelicanTown
    
    var description: String {
        return self.rawValue
    }
}
