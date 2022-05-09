//
//  VillagerView.swift
//  Valley Assistant
//
//  Created by Thomas Luong on 9/21/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct VillagerView: View {
    @Binding public var resetNavigationID : UUID

    var body: some View {
        NavigationView {
            let sortedVillagers = villagers.sorted { $0.name < $1.name }
            List(sortedVillagers, id: \.self) { villager in
                VillagerRow(villager: villager)
            }.navigationBarTitle("Villagers")
        }
        .id(self.resetNavigationID)
        .environment(\.horizontalSizeClass, .compact)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

