//
//  EventData.swift
//  Stardew Valley Assistant
//
//  Created by Thomas Luong on 9/25/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import Foundation

struct EventData {
    var birthdays = [Event]()
    var festivals = [Event]()
    var tasks = [Event]()
    
    init() {
        let url = Bundle.main.url(forResource: "events", withExtension: ".json")!
        do {
            let json = try Data(contentsOf: url)
            let events = try JSONDecoder().decode(AllEvents.self, from: json)
            self.birthdays = events.birthdays
            self.festivals = events.festivals
            self.tasks = events.tasks
        } catch {
            print(error)
        }
    }
    
    func generateBirthdayEvents() -> [Event] {
        // Assuming villagers is already populated
        
        
        var birthdayEvents = [Event]()
        
        for villager in villagers {
            let birthday = Event(name: "\(villager.name.rawValue.capitalized)",
                date: villager.birthday,
                type: .birthday,
                description: "Give \(villager.name.rawValue.capitalized) a gift",
                associatedVillager: villager)
            
            birthdayEvents.append(birthday)
        }
        
        return birthdayEvents
    }
}
