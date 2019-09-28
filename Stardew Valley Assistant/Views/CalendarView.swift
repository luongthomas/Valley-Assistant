//
//  CalendarView.swift
//  Stardew Valley Assistant
//
//  Created by Thomas Luong on 9/20/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct CalendarView: View {
    @State private var selectedSeason : Season = .spring
    let rkManager: RKManager
    @ObservedObject var eventHolder: EventHolder
    
    init(rkManager: RKManager, eventHolder: EventHolder) {
        self.rkManager = rkManager
        self.eventHolder = eventHolder
    }

    var body: some View {
        VStack {
            RKMonth(isPresented: .constant(true), rkManager: self.rkManager)
            Spacer()
            CalendarEventList(eventHolder: eventHolder)
        }
    }
}

public extension CaseIterable where Self: Equatable {
    func ordinal() -> Self.AllCases.Index {
        return Self.allCases.firstIndex(of: self)!
    }
}

struct CalendarEventList: View {
    @ObservedObject var eventHolder: EventHolder
    
    var body: some View {
        List {
            if !eventHolder.seasonBirthdays.isEmpty {
                EventRows(events: eventHolder.seasonBirthdays, title: "Birthdays")
            }
            if !eventHolder.seasonFestivals.isEmpty {
                EventRows(events: eventHolder.seasonFestivals, title: "Festivals")
            }
            if !eventHolder.seasonTasks.isEmpty {
                EventRows(events: eventHolder.seasonTasks, title: "Tasks")
            }
            
            
        }
    }
}

struct EventRows: View {
//    @ObservedObject var eventHolder: EventHolder
    var events: [Event]
    var title: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title).fontWeight(.heavy)
            ForEach(events, id: \.id) { event in
                Text("\(event.name)").padding(.leading, 15)
            }
        }
    }
}
