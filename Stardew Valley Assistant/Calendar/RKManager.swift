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
}
