//
//  RKMonth.swift
//  Valley Assistant
//
//  Created by Thomas Luong on 9/19/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct RKMonth: View {
    
    let seasons: [Season] = [.spring, .summer, .fall, .winter]

    @Binding var isPresented: Bool
    
    @ObservedObject var rkManager: RKManager
    
    @ObservedObject var eventHolder: EventHolder
    
    let daysPerWeek = 7
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing:0) {                
                Picker(selection: self.$rkManager.selectedDate.season, label: EmptyView()) {
                    ForEach(self.seasons, id: \.self) { season in
                        Text(season.rawValue.capitalized).tag(Season.allCases.firstIndex(of: season))
                    }
                }.pickerStyle(SegmentedPickerStyle())
                .padding(.bottom)
                
                VStack(spacing:0) {
                    RKWeekdayHeader(rkManager: self.rkManager)
                    
                    // Generate cells representing the calendar days
                    ForEach(self.rkManager.monthArray, id: \.self) { row in
                        HStack(spacing: 0) {
                            ForEach(row, id: \.self) { column in
                                AnyView(
                                    RKCell(
                                        rkDate: RKDate(date: column, rkManager: self.rkManager, isSelected: self.isSelectedDate(date: column)),
                                        cellWidth: CGFloat(UIScreen.main.bounds.width/8),
                                        rkManager: self.rkManager
                                    )
                                    .frame(maxHeight:CGFloat(UIScreen.main.bounds.width/8))
                                    .border(Color.gray, width: 1)
                                )
                                .onTapGesture {
                                    self.dateTapped(selectedDay: column)
                                }
                            }
                        }
                    }
                }
                .padding(.leading)
                .padding(.trailing)
                
            }.background(self.rkManager.colors.monthBackColor)
            .frame(width: geometry.size.width)
        }
    }
    
    func dateTapped(selectedDay: Day) {
        let selected = Day(season: self.rkManager.selectedDate.season, day: selectedDay.day)
        self.rkManager.selectedDate = selected
        self.isPresented = false
    }
    
    func isSelectedDate(date: Day) -> Bool {
        return (date.day == self.rkManager.selectedDate.day)
    }
}
