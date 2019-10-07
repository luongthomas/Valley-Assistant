//
//  VillagerRow.swift
//  Valley Assistant
//
//  Created by Thomas Luong on 9/24/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct VillagerRow: View {
    var villager: Villager
    
    var body: some View {
        HStack {
            NavigationLink(destination: VillagerDetailView(villager: villager)) {
                Text(villager.name.rawValue.capitalized)
            }
        }
    }
}
