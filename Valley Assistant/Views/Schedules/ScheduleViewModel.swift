//
//  ScheduleViewModel.swift
//  Valley Assistant
//
//  Created by Thomas Luong on 10/4/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import Foundation

import SwiftUI
import Combine

class ScheduleViewModel: ObservableObject {
    let villager: Villager
    let selectedDate: Day
    let scheduleData: ScheduleData
    
    var params: ScheduleParameters = scheduleParameters
    
    init(villager: Villager, selectedDate: Day) {
        self.villager = villager
        self.selectedDate = selectedDate
        self.scheduleData = ScheduleData(villager: villager)
    }
    
    // https://stackoverflow.com/questions/34800765/how-to-assign-a-variable-in-a-swift-case-statement
    func determineSchedule() -> [TimeLocation] {
        let schedule: [TimeLocation] = {
            switch villager.name {
            case .emily:
                return getEmilySchedule()
            default:
                return [TimeLocation]()
            }
        }()
        
        return schedule
    }
    
    func getEmilySchedule() -> [TimeLocation] {
        let possibleSchedules = scheduleData.possibleSchedules

        if selectedDate.season == .winter && selectedDate.day == 11 {
            return possibleSchedules["winter_11"]!
        }

        if selectedDate.season == .winter && selectedDate.day == 15 {
            return possibleSchedules["winter_15"]!
        }

        // Regular schedule is the same as the raining one
        if params.isRaining {
            return possibleSchedules["winter_11"]! // test change
        }

        if selectedDate.getWeekday() == "tuesday" {
            return possibleSchedules["tuesday"]!
        }

        // TODO: Add community center restored toggle
        if selectedDate.getWeekday() == "friday" {
            return possibleSchedules["friday_community_center_restored"]!
        }

        // TODO: Add marriage

        return possibleSchedules["regular"]!
    }
    
}
