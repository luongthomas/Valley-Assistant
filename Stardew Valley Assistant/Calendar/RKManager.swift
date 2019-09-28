//
//  RKManager.swift
//  Stardew Valley Assistant
//
//  Created by Thomas Luong on 9/19/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import Combine
import SwiftUI

class RKManager : ObservableObject {
    
    @Published var selectedDate: Day {
        didSet {
            updatePublisher.send()
        }
    }
    @Published var isVertical = true
    
    // Can be consumed by other classes / objects.
    let updatePublisher = PassthroughSubject<Void, Never>()
    
    // color settings
    var colors = ColorSettings()
  
    init(selectedDate: Day) {
        self.selectedDate = selectedDate
    }
    
    func getPrintableCurrentDate() -> String {
        return "\(selectedDate.season.rawValue.capitalized) \(selectedDate.day)"
    }
    
    func getWeekday() -> String {
        let remainder = selectedDate.day % 7
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

class EventHolder: ObservableObject {
    @ObservedObject var rkManager: RKManager
    @Published var seasonBirthdays = [Event]()
    @Published var seasonFestivals = [Event]()
    @Published var seasonTasks = [Event]()
    
    private var previousSeason: Season
    
    let updatePublisher = PassthroughSubject<Void, Never>()
    
    // More on AnyCancellable on: apple-reference-documentation://hs-NDfw7su
    var cancellable: AnyCancellable?
    
    init(rkManager: RKManager) {
        self.rkManager = rkManager
        self.previousSeason = rkManager.selectedDate.season
            
        // `sink`: Attaches a subscriber with closure-based behavior.
       cancellable = rkManager.updatePublisher.sink(receiveValue: { [weak self] _ in
           guard let self = self else { return }
        self.updateEventsWhenDateChanges()
       })
    }
    
    func updateEventsWhenDateChanges() {
        if previousSeason != rkManager.selectedDate.season {
            var events = [Event]()
            self.clearPreviousEvents()
            
            events = birthdays.filter(({$0.date.season == rkManager.selectedDate.season}))
            seasonBirthdays.append(contentsOf: events)
            
            events = festivals.filter(({$0.date.season == rkManager.selectedDate.season}))
            seasonFestivals.append(contentsOf: events)
            
            events = tasks.filter(({$0.date.season == rkManager.selectedDate.season}))
            seasonTasks.append(contentsOf: events)
            
            previousSeason = rkManager.selectedDate.season
            updatePublisher.send()
        }
    }
    
    func clearPreviousEvents() {
        seasonBirthdays.removeAll()
        seasonFestivals.removeAll()
        seasonTasks.removeAll()
    }
}
