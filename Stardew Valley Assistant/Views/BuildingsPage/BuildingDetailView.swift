//
//  BuildingDetailView.swift
//  Stardew Valley Assistant
//
//  Created by Thomas Luong on 9/30/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct BuildingDetailView: View {
    var building: Building
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Type: \(building.type.rawValue.capitalized)")
                Text("Hours: \(building.openTime.hour) \(building.openTime.ampm.rawValue.capitalized) - \(building.closeTime.hour) \(building.closeTime.ampm.rawValue.capitalized)")
                Text("Description: \(building.description)")
                
                Spacer()

                Text("Occupants:").font(.subheadline)
                List {
                    ForEach(building.occupants, id: \.self) { name in
                        VillagerRow(villager: villagers.first(where: {
                            $0.name == name
                        })!)
                    }
                }
                
                Divider()
                
                Text("Obtainables:").font(.subheadline)
                List {
                    ForEach(building.obtainables, id: \.self) { obtainable in
                        ItemRow(item: items.first(where: {
                            $0.name == obtainable
                        })!)
                    }
                }
                
                .navigationBarTitle("\(building.name)")
            }
        }.environment(\.horizontalSizeClass, .compact)
    }
}
