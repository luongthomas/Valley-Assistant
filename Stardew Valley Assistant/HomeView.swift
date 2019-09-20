//
//  HomeView.swift
//  Stardew Valley Assistant
//
//  Created by Thomas Luong on 9/19/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    let rkManager: RKManager
    
    init() {
        let startDate = Date(timeIntervalSince1970: 1801468800) // February 2027
        self.rkManager = RKManager(calendar: Calendar.current, minimumDate: startDate, maximumDate: .distantFuture, mode: 0)
    }
    
    var body: some View {
        VStack {
            Spacer()
            Text("Welcome to HomeView!")
            Spacer()
            CalendarView(rkManager: rkManager)
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
