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
    }
    
    var body: some View {
        VStack {
            Text("Spring 1").font(.largeTitle)
            
            Picker(selection: $selectedSeason, label: EmptyView()) {
                ForEach(0..<seasons.count) { index in
                    Text(self.seasons[index]).tag(index)
                }
            }.pickerStyle(SegmentedPickerStyle())
            RKMonth(isPresented: .constant(false),rkManager: self.rkManager, monthOffset: 0)
            Spacer()
        }
    }
}
