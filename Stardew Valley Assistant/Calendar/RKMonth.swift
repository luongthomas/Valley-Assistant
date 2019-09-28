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
    
    let daysPerWeek = 7
    var monthsArray: [[Day]] {
        monthArray()
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text(self.rkManager.getPrintableCurrentDate()).font(.largeTitle).padding(.top)
                
                Picker(selection: self.$rkManager.selectedDate.season, label: EmptyView()) {
                    ForEach(Season.allCases, id: \.self) { season in
                        Text(season.rawValue.capitalized).tag(Season.allCases.firstIndex(of: season))
                    }
                }.pickerStyle(SegmentedPickerStyle())
                .padding(.bottom)
                
                VStack(spacing: 0) {
                    RKWeekdayHeader(rkManager: self.rkManager)
                    ForEach(self.monthsArray, id: \.self) { row in
                        HStack(spacing: 0) {
                            ForEach(row, id: \.self) { column in
                                AnyView(
                                    // TODO: Fix this so it actually recreates the cells depending on the month
                                    RKCell(
                                        rkDate: RKDate(date: column, rkManager: self.rkManager, isSelected: self.isSelectedDate(date: column)),
                                        cellWidth: CGFloat(UIScreen.main.bounds.width/8)
                                    )
                                    .border(Color.gray, width: 1)
                                )
                                .onTapGesture {
                                    self.dateTapped(selectedDay: column)
                                }
                            }
                        }
                    }
                }.frame(minWidth: 0, maxWidth: .infinity, maxHeight: CGFloat(UIScreen.main.bounds.height/2.5))
                .padding(.leading)
                .padding(.trailing)
                
                Spacer()
                
            }.background(self.rkManager.colors.monthBackColor)
            .frame(width: geometry.size.width)
        }
    }
    
    func dateTapped(selectedDay: Day) {
        let selected = Day(season: self.rkManager.selectedDate.season, day: selectedDay.day)
        self.rkManager.selectedDate = selected
        self.isPresented = false
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
