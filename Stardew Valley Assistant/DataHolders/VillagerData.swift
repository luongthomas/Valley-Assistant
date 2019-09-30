//
//  VillagerData.swift
//  Stardew Valley Assistant
//
//  Created by Thomas Luong on 9/22/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import Foundation

struct VillagerData {
    var villagers = [Villager]()
    
    init() {
        let url = Bundle.main.url(forResource: "villagers", withExtension: ".json")!
        do {
            let json = try Data(contentsOf: url)
            self.villagers = try JSONDecoder().decode([Villager].self, from: json)
        } catch {
            print(error)
        }
    }
}
