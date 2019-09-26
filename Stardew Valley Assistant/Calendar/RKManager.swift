//
//  RKManager.swift
//  Stardew Valley Assistant
//
//  Created by Thomas Luong on 9/19/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import Combine
import SwiftUI

class RKManager : ObservableObject {
    
    @Published var selectedDate: Day
    @Published var isVertical = true
    
    // color settings
    var colors = ColorSettings()
  
    init(selectedDate: Day) {
        self.selectedDate = selectedDate
    }
    
    func getPrintableCurrentDate() -> String {
        return "\(selectedDate.season.rawValue.capitalized) \(selectedDate.day)"
    }
    
    func getWeekday() -> String {
        let remainder = selectedDate.day % 7
        switch (remainder) {
            case 0:
                return "Sunday"
            case 1:
                return "Monday"
            case 2:
                return "Tuesday"
            case 3:
                return "Wednesday"
            case 4:
                return "Thursday"
            case 5:
                return "Friday"
            case 6:
                return "Saturday"
            default:
                return "Dayday"
        }
    }
}
