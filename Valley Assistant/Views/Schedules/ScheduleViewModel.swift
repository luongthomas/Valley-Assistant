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
    @EnvironmentObject var rkManager: RKManager
    
    lazy var scheduleData: ScheduleData = {
        return ScheduleData(villager: self.villager)
    }()
    
    // https://stackoverflow.com/questions/57316270/cannot-use-mutating-getter-on-immutable-value-self-is-immutable-error
    func getScheduleData() -> ScheduleData {
        var mutableSelf = self
        return mutableSelf.scheduleData
    }
    
    init(villager: Villager, isRaining: Bool) {
        self.villager = villager
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
        
        
        // `A` is the regular schedule
        let scheduleA = getScheduleData().possibleSchedules["regular"]!
        
        // The raining schedule is the same as `A`
        
        // `B` is Tuesdays
        
        
        
        return scheduleA
    }
    
}
