//
//  ScheduleData.swift
//  Valley Assistant
//
//  Created by Thomas Luong on 10/4/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import Foundation

struct ScheduleData {
    let villager: Villager
    var possibleSchedules = [String:[TimeLocation]]()
    
    init(villager: Villager) {
        self.villager = villager
        let url = Bundle.main.url(forResource: "\(villager.name.rawValue)", withExtension: ".json")!
        do {
            let json = try Data(contentsOf: url)
            let scheduleData = try JSONDecoder().decode([String:[TimeLocation]].self, from: json)
            
            self.possibleSchedules = scheduleData
            
        } catch {
            print(error)
        }
    }
}
