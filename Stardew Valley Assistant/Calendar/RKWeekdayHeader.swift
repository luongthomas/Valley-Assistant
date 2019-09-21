//
//  RKWeekdayHeader.swift
//  Stardew Valley Assistant
//
//  Created by Thomas Luong on 9/19/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//


import SwiftUI

struct RKWeekdayHeader : View {
    
    var rkManager: RKManager
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            ForEach(self.getWeekdayHeaders(calendar: self.rkManager.calendar), id: \.self) { weekday in
                Text(weekday)
                    .font(.system(size: 12))
                    .frame(minWidth: 0, maxWidth: CGFloat(UIScreen.main.bounds.width/8))
                    .foregroundColor(self.rkManager.colors.weekdayHeaderColor)
                    .border(Color.gray, width: 1)
            }
        }.background(rkManager.colors.weekdayHeaderBackColor)
        .border(Color.gray, width: 1)
    }
    
    func getWeekdayHeaders(calendar: Calendar) -> [String] {
        
        let formatter = DateFormatter()
        
        var weekdaySymbols = formatter.shortStandaloneWeekdaySymbols
        let weekdaySymbolsCount = weekdaySymbols?.count ?? 0
        let startOfTheWeek = 2
        for _ in 0 ..< (1 - startOfTheWeek + weekdaySymbolsCount){
            let lastObject = weekdaySymbols?.last
            weekdaySymbols?.removeLast()
            weekdaySymbols?.insert(lastObject!, at: 0)
        }
        
        return weekdaySymbols ?? []
    }
}

#if DEBUG
struct RKWeekdayHeader_Previews : PreviewProvider {
    static var previews: some View {
        RKWeekdayHeader(rkManager: RKManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60*60*24*365), mode: 0))
    }
}
#endif
