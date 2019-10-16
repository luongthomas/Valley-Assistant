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
            case .alex:
                return getAlexSchedule()
            case .elliott:
                return getElliottSchedule()
            case .emily:
                return getEmilySchedule()
            default:
                return [TimeLocation]()
            }
        }()
        
        return schedule
    }

    func getAlexSchedule() -> [TimeLocation] {
        let possibleSchedules = scheduleData.possibleSchedules

        if selectedDate.season == .winter && selectedDate.day == 17 {
            return possibleSchedules["winter_17"]!
        }

        if selectedDate.season == .summer && selectedDate.day == 16 {
            return possibleSchedules["summer_16"]!
        }

        if params.isRaining {
            return possibleSchedules["regular_or_rainy"]!
        }

        // TODO: Add hearts condition
        if selectedDate.getWeekday() == "wednesday" {
            return possibleSchedules["wednesday_less_6_hearts_haley"]!
        }

        if selectedDate.season == .summer {
            return possibleSchedules["summer_regular"]!
        }
        
        if selectedDate.season == .winter {
            return possibleSchedules["winter_regular"]!
        }

        // TODO: Add marriage

        return possibleSchedules["regular_or_rainy"]!
    }

    func getElliottSchedule() -> [TimeLocation] {
        let possibleSchedules = scheduleData.possibleSchedules

        let weekday = selectedDate.getWeekday()

        if selectedDate.season == .winter && selectedDate.day == 17 {
            return possibleSchedules["winter_17"]!
        }

        if selectedDate.season == .summer && selectedDate.day == 9 {
            return possibleSchedules["summer_9"]!
        }

        if params.isRaining {
            return possibleSchedules["rainy"]!
        }

        if selectedDate.getWeekday() == "thursday" {
            return possibleSchedules["thursday"]!
        }

        if selectedDate.season != .spring && weekday == "friday" || weekday == "sunday" {
            return possibleSchedules["non_spring_friday_sunday"]!
        }

        if selectedDate.season == .spring {
            return possibleSchedules["spring_regular"]!
        }
        
        if selectedDate.season == .summer {
            return possibleSchedules["summer_regular"]!
        }

        if selectedDate.season == .winter || selectedDate.season == .fall {
            return possibleSchedules["fall_winter_regular"]!
        }

        // TODO: Add marriage

        // Should not reach this
        return possibleSchedules["regular"]!
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
            return possibleSchedules["regular"]!
        }

        if selectedDate.getWeekday() == "Tuesday" {
            return possibleSchedules["tuesday"]!
        }

        // TODO: Add community center restored toggle
        if selectedDate.getWeekday() == "Friday" {
            return possibleSchedules["friday_community_center_restored"]!
        }

        // TODO: Add marriage

        return possibleSchedules["regular"]!
    }
    
}
