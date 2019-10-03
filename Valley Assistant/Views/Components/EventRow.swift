//
//  EventRow.swift
//  Valley Assistant
//
//  Created by Thomas Luong on 9/29/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct EventRow: View {
    var event: Event
    
    var body: some View {
        HStack {
            NavigationLink(destination: EventDetailView(event: event)) {
                Text(event.name)
            }
        }
    }
}
