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
        GeometryReader { geometry in
            HStack(alignment: .center, spacing: 0) {
                ForEach(self.getWeekdayHeaders(), id: \.self) { weekday in
                    Text(weekday)
                    .font(.system(size: 12))
                    .frame(maxWidth: .infinity)
                    .foregroundColor(self.rkManager.colors.weekdayHeaderColor)
                    .border(Color.gray, width: 1)
                }
            }
            .background(self.rkManager.colors.weekdayHeaderBackColor)
            .border(Color.gray, width: 1)
        }
    }
    
    func getWeekdayHeaders() -> [String] {
        return ["Mon", "Tues", "Wed", "Thu", "Fri", "Sat", "Sun"]
    }
}
