//
//  CalendarView.swift
//  Stardew Valley Assistant
//
//  Created by Thomas Luong on 9/20/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct CalendarView: View {
    @State private var selectedSeason : Season = .spring
    let rkManager: RKManager
    
    init(rkManager: RKManager) {
        self.rkManager = rkManager
    }

    var body: some View {
        VStack {
            RKMonth(isPresented: .constant(true), rkManager: self.rkManager)
            Spacer()
        }
    }
}

public extension CaseIterable where Self: Equatable {
    func ordinal() -> Self.AllCases.Index {
        return Self.allCases.firstIndex(of: self)!
    }
}
