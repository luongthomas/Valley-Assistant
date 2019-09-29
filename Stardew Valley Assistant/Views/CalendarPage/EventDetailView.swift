//
//  EventDetailView.swift
//  Stardew Valley Assistant
//
//  Created by Thomas Luong on 9/29/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct EventDetailView: View {
    var event: Event
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(event.name)")
            Text("\(event.date.season.rawValue.capitalized) \(event.date.day)")
            Text("\(event.description)")
        }
    }
}
