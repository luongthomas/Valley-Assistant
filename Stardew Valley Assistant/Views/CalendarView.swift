//
//  CalendarView.swift
//  Stardew Valley Assistant
//
//  Created by Thomas Luong on 9/20/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct CalendarView: View {
    @State private var selectedSeason = 0
    
    let rkManager: RKManager
    
    var seasons = ["Spring", "Summer", "Fall", "Winter"]
    
    init(rkManager: RKManager) {
        self.rkManager = rkManager
        
//        let calendar = Calendar.current
//        let components = calendar.dateComponents([.day], from: rkManager.selectedDate)
//        let day = components.day
    }
    

    var body: some View {
        VStack {
            Text("\(seasons[selectedSeason])").font(.largeTitle)
            
            Picker(selection: $selectedSeason, label: EmptyView()) {
                ForEach(0..<seasons.count) { index in
                    Text(self.seasons[index]).tag(index)
                }
            }.pickerStyle(SegmentedPickerStyle())
            RKMonth(isPresented: .constant(false),rkManager: self.rkManager, monthOffset: 0)
            Spacer()
        }.padding()
    }
}
