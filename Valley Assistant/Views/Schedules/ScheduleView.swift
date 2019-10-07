//
//  ScheduleView.swift
//  Valley Assistant
//
//  Created by Thomas Luong on 10/4/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct ScheduleView: View {
    @State var isRaining = false
    
    let villager: Villager
    
    lazy var viewModel: ScheduleViewModel = {
        ScheduleViewModel(villager: self.villager, isRaining: isRaining)
    }()
    
    func getViewModel() -> ScheduleViewModel {
        var mutableSelf = self
        return mutableSelf.viewModel
    }
    
    var body: some View {
        VStack {
            Toggle(isOn: $isRaining) {
                Text("Currently Raining")
            }.padding()
            
            Text("Schedule:")
        
            ForEach(getViewModel().determineSchedule(), id: \.self) { timeLocation in
                Text("Event 1")
            }
            
            Spacer()
        }.navigationBarTitle("\(villager.name.rawValue.capitalized)'s Schedule")
    }
}
