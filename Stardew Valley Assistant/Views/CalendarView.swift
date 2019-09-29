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
        GeometryReader { geometry in
            if geometry.size.height > geometry.size.width {
                VStack {
                    RKMonth(isPresented: .constant(true), rkManager: self.rkManager)
                    CalendarEventList(eventHolder: self.eventHolder)
                }
            } else {
                HStack {
                    RKMonth(isPresented: .constant(true), rkManager: self.rkManager)
                    CalendarEventList(eventHolder: self.eventHolder).frame(maxWidth: geometry.size.width / 4)
                }
            }
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
        GeometryReader { geometry in
            VStack(alignment: .center) {
                Text("Events").fontWeight(.heavy).font(.headline).underline()
                
                List {
                    if !self.eventHolder.seasonBirthdays.isEmpty {
                        EventRows(events: self.eventHolder.seasonBirthdays, title: "Birthdays")
                    }
                    if !self.eventHolder.seasonFestivals.isEmpty {
                        EventRows(events: self.eventHolder.seasonFestivals, title: "Festivals")
                    }
                    if !self.eventHolder.seasonTasks.isEmpty {
                        EventRows(events: self.eventHolder.seasonTasks, title: "Tasks")
                    }
                }.frame(minHeight: geometry.size.height/4, maxHeight: geometry.size.height/2)
            }
        }
    }
}

struct EventRows: View {
    var events: [Event]
    var title: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title).fontWeight(.light).font(.subheadline)
            ForEach(events, id: \.id) { event in
                Text("\(event.name)").padding(.leading, 15)
            }
        }
    }
}
