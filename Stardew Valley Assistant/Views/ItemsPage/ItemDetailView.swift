//
//  ItemDetailView.swift
//  Stardew Valley Assistant
//
//  Created by Thomas Luong on 9/24/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct ItemDetailView: View {
    var item: Item
    let affinities = ["Loves", "Likes", "Dislikes"]
    
    @State var selectedAffinity = 0
    
    var body: some View {
        VStack {
            Text("Value: \(item.value)")
            Text("Description: \(item.description)")
            Text("Source: \(item.source)")
            
            // Segmented Control between Loves and Likes
            Picker(selection: $selectedAffinity, label: EmptyView()) {
                ForEach(0..<affinities.count) { index in
                    Text(self.affinities[index]).tag(index)
                }
            }.pickerStyle(SegmentedPickerStyle())
            List {
                ForEach(getVillagersThat(affinity: affinities[selectedAffinity], item: item), id: \.self) { name in
                    VillagerRow(villager: villagers.first(where: {
                        $0.name == name
                    })!)
                }
            }
            
            .navigationBarTitle("\(item.name)")
        }
    }
    
    private func getVillagersThat(affinity: String, item: Item) -> [String] {
        var villagersForAffinity = [String]()
        if affinity == "Loves" {
            villagersForAffinity = villagers.compactMap({ villager in
                // Convert to enum and check if "loves" contains it
                if villager.loves.contains(ItemName(rawValue: item.name)!) {
                    return villager.name
                } else {
                    return nil
                }
            })
        } else if affinity == "Likes" {
            villagersForAffinity = villagers.compactMap({ villager in
                if villager.likes.contains(ItemName(rawValue: item.name)!) {
                    return villager.name
                } else {
                    return nil
                }
            })
        }
        return villagersForAffinity
    }
}
