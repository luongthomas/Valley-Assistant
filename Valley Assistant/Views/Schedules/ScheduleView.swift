//
//  ScheduleView.swift
//  Valley Assistant
//
//  Created by Thomas Luong on 10/4/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct ScheduleView: View {
    
    let villager: Villager
    
    @ObservedObject private var viewModel: ScheduleViewModel
    @ObservedObject private var params: ScheduleParameters = scheduleParameters
    
    init(villager: Villager) {
        self.villager = villager
        self.viewModel = ScheduleViewModel(villager: villager, selectedDate: rkManager.selectedDate)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Toggle(isOn: $params.isRaining) {
                Text("Currently Raining")
            }.padding()
            
            Text("Schedule:")
            
            List {
                ForEach(viewModel.determineSchedule(), id: \.self) { timeLocation in
                    VStack(alignment: .leading) {
                        Text(timeLocation.time.getPrintableTime())
                        Text(timeLocation.location.rawValue.camelCaps)
                        Text(timeLocation.description)
                        Text("")
                    }
                }
            }
            
            Spacer()
            }.navigationBarTitle("\(villager.name.rawValue.capitalized)'s Schedule").padding()
    }
}
