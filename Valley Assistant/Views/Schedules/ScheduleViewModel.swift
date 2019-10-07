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

struct ScheduleViewModel {
    let villager: Villager
    let selectedDate: Day
    
    lazy var scheduleData: ScheduleData = {
        return ScheduleData(villager: self.villager)
    }()
    
    // https://stackoverflow.com/questions/57316270/cannot-use-mutating-getter-on-immutable-value-self-is-immutable-error
    func getScheduleData() -> ScheduleData {
        var mutableSelf = self
        return mutableSelf.scheduleData
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
        let possibleSchedules = getScheduleData().possibleSchedules

        if selectedDate.season == .winter && selectedDate.day == 11 {
            return possibleSchedules["winter_11"]!
        }

        if selectedDate.season == .winter && selectedDate.day == 15 {
            return possibleSchedules["winter_15"]!
        }

        // Regular schedule is the same as the raining one
        //        if rkManager.isRaining {
        //            return possibleSchedules["regular"]!
        //        }

        if selectedDate.getWeekday() == "tuesday" {
            return possibleSchedules["tuesday"]!
        }

//     TODO: Add community center restored toggle
        if selectedDate.getWeekday() == "friday" {
            return possibleSchedules["friday_community_center_restored"]!
        }

        // TODO: Add marriage

        return possibleSchedules["regular"]!
    }
    
}
