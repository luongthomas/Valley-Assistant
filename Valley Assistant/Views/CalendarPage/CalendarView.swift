//
//  CalendarView.swift
//  Valley Assistant
//
//  Created by Thomas Luong on 9/20/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct CalendarView: View {
    @ObservedObject var rkManager: RKManager
    @ObservedObject var eventHolder: EventHolder
    
    @Binding var isPresented: Bool
    @State private var selectedSeason : Season = .spring
    
    var screen = UIScreen.main.bounds

    var body: some View {
        
        NavigationView {
            Group {
                if screen.size.height > screen.size.width {
                    VStack {
                        RKMonth(isPresented: .constant(true), rkManager: self.rkManager, eventHolder: self.eventHolder)
                        CalendarEventList(eventHolder: self.eventHolder)
                    }
                } else {
                    HStack {
                        RKMonth(isPresented: .constant(true), rkManager: self.rkManager, eventHolder: self.eventHolder)
                        CalendarEventList(eventHolder: self.eventHolder).frame(maxWidth: screen.size.width / 4)
                    }
                    .padding(.vertical, 10)
                }
            }
            .navigationBarTitle(
                Text(self.rkManager.getPrintableCurrentDate())
            , displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.isPresented = false
            }) {
                Text("Done").bold()
            })
        }
        .navigationViewStyle(StackNavigationViewStyle())
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
        VStack(alignment: .center) {
            Text("Events").fontWeight(.heavy).font(.headline).underline()
            
            List {
                if !self.eventHolder.seasonBirthdays.isEmpty {
                    CalendarEventRows(events: self.eventHolder.seasonBirthdays, title: "Birthdays")
                }
                if !self.eventHolder.seasonFestivals.isEmpty {
                    CalendarEventRows(events: self.eventHolder.seasonFestivals, title: "Festivals")
                }
                if !self.eventHolder.seasonTasks.isEmpty {
                    CalendarEventRows(events: self.eventHolder.seasonTasks, title: "Tasks")
                }
            }
        }
        .padding(.vertical, 10)
    }
}

struct CalendarEventRows: View {
    var events: [Event]
    var title: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title).fontWeight(.light)
                .font(.headline)
            
            ForEach(events.sorted(by: { (left, right) -> Bool in
                left.date.day < right.date.day
            }), id: \.self) { event in
                CalendarEventRow(eventText: event.name, date: event.date)
            }
        }
    }
}

struct CalendarEventRow: View {
    var eventText: String
    var date: Day
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(eventText)")
                .font(.subheadline)
            Text("\(date.season.rawValue.capitalized) \(date.day)")
                .font(.footnote)
                .fontWeight(.ultraLight)
        }.padding(.leading, 15)
    }
}
