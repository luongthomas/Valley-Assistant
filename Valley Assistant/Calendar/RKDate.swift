//
//  RKDate.swift
//  Valley Assistant
//
//  Created by Thomas Luong on 9/19/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI



struct RKDate {
    
    var date: Day
    let rkManager: RKManager
    var isSelected: Bool = false
    
    init(date: Day, rkManager: RKManager, isSelected: Bool) {
        self.date = date
        self.rkManager = rkManager
        self.isSelected = isSelected
    }
    
    func getText() -> String {
        let day = "\(date.season.rawValue.capitalized) \(date.day)"
        return day
    }
    
    func getTextColor() -> Color {
        var textColor = rkManager.colors.textColor
        if isSelected {
            textColor = rkManager.colors.selectedColor
        }
        return textColor
    }
    
    func getBackgroundColor() -> Color {
        var backgroundColor = rkManager.colors.textBackColor
        if isSelected {
            backgroundColor = rkManager.colors.selectedBackColor
        }
        return backgroundColor
    }
    
    func getFontWeight() -> Font.Weight {
        var fontWeight = Font.Weight.medium
        if isSelected {
            fontWeight = Font.Weight.heavy
        }
        return fontWeight
    }
    
    func getWeekday() -> String {
        let remainder = date.day % 7
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
