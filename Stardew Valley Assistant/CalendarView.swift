//
//  CalendarView.swift
//  Stardew Valley Assistant
//
//  Created by Thomas Luong on 9/20/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct CalendarView: View {
    let rkManager: RKManager
    
    init(rkManager: RKManager) {
        self.rkManager = rkManager
    }
    
    var body: some View {
        VStack {
            Text("Spring 1").font(.largeTitle)
            
            RKMonth(isPresented: .constant(false),rkManager: self.rkManager, monthOffset: 0)
            Spacer()
        }
    }
}
