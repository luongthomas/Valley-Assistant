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
            ForEach(self.getWeekdayHeaders(), id: \.self) { weekday in
                Text(weekday)
                    .font(.system(size: 12))
                    .frame(minWidth: 0, maxWidth: CGFloat(UIScreen.main.bounds.width/7.5))
                    .foregroundColor(self.rkManager.colors.weekdayHeaderColor)
                    .border(Color.gray, width: 1)
            }
        }.background(rkManager.colors.weekdayHeaderBackColor)
        .border(Color.gray, width: 1)
    }
    
    func getWeekdayHeaders() -> [String] {
        return ["Mon", "Tues", "Wed", "Thu", "Fri", "Sat", "Sun"]
    }
}
