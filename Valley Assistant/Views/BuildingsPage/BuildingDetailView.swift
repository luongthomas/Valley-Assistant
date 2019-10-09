//
//  BuildingDetailView.swift
//  Valley Assistant
//
//  Created by Thomas Luong on 9/30/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct BuildingDetailView: View {
    var building: Building
    
    var body: some View {
        VStack() {
            Text("Type: \(building.type.rawValue.camelCaps)")
            Text("Hours: \(building.openTime.hour) \(building.openTime.ampm.rawValue.capitalized) - \(building.closeTime.hour) \(building.closeTime.ampm.rawValue.capitalized)")
            Text("Description: \(building.basicDescription)")
            
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
            
            NavigationLink(destination: PurchasableList(building: building)) {
                Text("Purchasables")
            }
            .padding()
            .navigationBarTitle("\(building.name.rawValue.camelCaps)")
        }
    }
}
