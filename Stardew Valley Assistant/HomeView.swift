//
//  HomeView.swift
//  Stardew Valley Assistant
//
//  Created by Thomas Luong on 9/19/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var rkManager = RKManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60*60*24*28), mode: 0)
    let startDate = Date(timeIntervalSince1970: 1801468800) // February 2027
    
    var body: some View {
        VStack {
            Spacer()
            Text("Welcome to HomeView!")
            Spacer()
            Text("Spring 1").font(.largeTitle)
            RKWeekdayHeader(rkManager: RKManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60*60*24*28), mode: 0))
            RKMonth(isPresented: .constant(false),rkManager: RKManager(calendar: Calendar.current, minimumDate: startDate, maximumDate: .distantFuture, mode: 0), monthOffset: 3)
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
