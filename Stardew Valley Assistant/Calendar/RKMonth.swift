//
//  RKMonth.swift
//  Stardew Valley Assistant
//
//  Created by Thomas Luong on 9/19/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct RKMonth: View {

    @Binding var isPresented: Bool
    
    @ObservedObject var rkManager: RKManager
    @State private var selectedSeason : Season = .spring
    
    let daysPerWeek = 7
    var monthsArray: [[Day]] {
        monthArray()
    }
    let cellWidth = CGFloat(UIScreen.main.bounds.width/8)
    
    var body: some View {
        VStack {
            
            Text("\(rkManager.selectedDate.season.rawValue.capitalized) \(rkManager.selectedDate.day)").font(.largeTitle)
            
            Picker(selection: $rkManager.selectedDate.season, label: EmptyView()) {
                ForEach(Season.allCases, id: \.self) { season in
                    Text(season.rawValue.capitalized).tag(Season.allCases.firstIndex(of: season)).onTapGesture {
                        self.rkManager.selectedDate.season = season
                    }
                }
            }.pickerStyle(SegmentedPickerStyle())
            
            RKWeekdayHeader(rkManager: self.rkManager)
            VStack {
                ForEach(monthsArray, id: \.self) { row in
                    HStack(spacing: 0) {
                        ForEach(row, id: \.self) { column in
                            AnyView(
                                // TODO: Fix this so it actually recreates the cells depending on the month
                                RKCell(
                                    rkDate: RKDate(date: column, rkManager: self.rkManager, isSelected: self.isSelectedDate(date: column)),
                                    cellWidth: self.cellWidth
                                )
                                .border(Color.gray, width: 1)
                                .onTapGesture {
                                    self.dateTapped(selectedDay: column)
                                }
                            )
                        }
                    }
                }
            }.frame(minWidth: 0, maxWidth: .infinity)
        }.background(rkManager.colors.monthBackColor)
    }
    
    func dateTapped(selectedDay: Day) {
        let selected = Day(season: self.rkManager.selectedDate.season, day: selectedDay.day)
        self.rkManager.selectedDate = selected
        self.isPresented = false
        print("\(self.rkManager.selectedDate)")
    }
     
    func monthArray() -> [[Day]] {
        let weeksInMonth = 4
        let daysInWeek = 7
        var dayCount = 1
        
        var weeks = [[Day]]()
        for _ in 1 ... weeksInMonth {
            var weekdays = [Day]()
            for _ in 1 ... daysInWeek {
                let day = Day(season: .spring, day: dayCount)
                weekdays.append(day)
                dayCount += 1
            }
            weeks.append(weekdays)
        }
        return weeks
    }
    
    func isSelectedDate(date: Day) -> Bool {
        return (date.day == self.rkManager.selectedDate.day)
    }
}

//#if DEBUG
//struct RKMonth_Previews : PreviewProvider {
//    static var previews: some View {
//        RKMonth(isPresented: .constant(false), rkManager: RKManager(selectedDate: Day(season: .summer, day: 1)))
//    }
//}
//#endif
