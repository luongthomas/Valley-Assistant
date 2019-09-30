//
//  BuildingData.swift
//  Stardew Valley Assistant
//
//  Created by Thomas Luong on 9/30/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import Foundation

struct BuildingData {
    var buildings = [Building]()
    
    init() {
        let url = Bundle.main.url(forResource: "buildings", withExtension: ".json")!
        do {
            let json = try Data(contentsOf: url)
            let elements = try JSONDecoder().decode([Building].self, from: json)
            self.buildings = elements
        } catch {
            print(error)
        }
    }
}
