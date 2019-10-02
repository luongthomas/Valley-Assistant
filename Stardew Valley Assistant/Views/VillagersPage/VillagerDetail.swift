//
//  VillagerDetail.swift
//  Stardew Valley Assistant
//
//  Created by Thomas Luong on 9/23/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct VillagerDetailView: View {
    var villager: Villager

    let affinities = ["Loves", "Likes", "Dislikes"]
    
    @State var selectedAffinity = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Text("Birthday: \(villager.birthday.season.description)  \(villager.birthday.day)")
                .font(.subheadline)
                Spacer()
                Text("Address: \(villager.address.description)")
                    .font(.subheadline)
            }

            Spacer()
            
            Picker(selection: $selectedAffinity, label: EmptyView()) {
                ForEach(0..<affinities.count) { index in
                    Text(self.affinities[index]).tag(index)
                }
            }.pickerStyle(SegmentedPickerStyle())
            List {
                ForEach(getItemsForAffinityOfVillager(affinity: affinities[selectedAffinity], villager: villager), id: \.self) { name in
                    ItemRow(item: items.first(where: {
                        $0.name == name
                    })!)
                }
            }
        }
        .padding()
        .navigationBarTitle(
            Text(villager.name.rawValue.capitalized)
            .font(.title)
        )
    }
    
    private func getItemsForAffinityOfVillager(affinity: String, villager: Villager) -> [ItemName] {
        if affinity == "Loves" {
            return villager.loves.map({$0})
        } else if affinity == "Likes" {
            return villager.likes.map({$0})
        } else {
            return villager.dislikes.map({$0})
        }
    }
}
