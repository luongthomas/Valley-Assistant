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
//    let affinities = ["Loves", "Likes", "Dislikes"]
    
//    @State var selectedAffinity = 0
    
    var body: some View {
        VStack(alignment: .leading) {
//            Text("Value: \(building.value)")
            Text("Description: \(building.description)")
//            Text("Source: \(item.source)")
            
//            if item.type == .food {
//                Text("Health: \(item.heal!)")
//                Text("Stamina: \(item.stamina!)")
//            }
            
            // Requirements
//            if item.recipe != nil {
//                RecipeView(recipe: item.recipe!)
//            }
            
            // Segmented Control between Loves and Likes
//            Picker(selection: $selectedAffinity, label: EmptyView()) {
//                ForEach(0..<affinities.count) { index in
//                    Text(self.affinities[index]).tag(index)
//                }
//            }.pickerStyle(SegmentedPickerStyle())
//            List {
//                ForEach(getVillagersThat(affinity: affinities[selectedAffinity], item: item), id: \.self) { name in
//                    VillagerRow(villager: villagers.first(where: {
//                        $0.name == name
//                    })!)
//                }
//            }
            
            .navigationBarTitle("\(building.name)")
        }.padding()
    }
    
//    private func getVillagersThat(affinity: String, item: Item) -> [String] {
//        var villagersForAffinity = [String]()
//        if affinity == "Loves" {
//            villagersForAffinity = villagers.compactMap({ villager in
//                // Convert to enum and check if "loves" contains it
//                if villager.loves.contains(ItemName(rawValue: item.name)!) {
//                    return villager.name
//                } else {
//                    return nil
//                }
//            })
//        } else if affinity == "Likes" {
//            villagersForAffinity = villagers.compactMap({ villager in
//                if villager.likes.contains(ItemName(rawValue: item.name)!) {
//                    return villager.name
//                } else {
//                    return nil
//                }
//            })
//        }
//        return villagersForAffinity
//    }
}

//struct RecipeView: View {
//    var recipe: [ItemName]
//
//    var body: some View {
//        HStack {
//            ScrollView(.horizontal, showsIndicators: false) {
//                Text("Recipe: ").font(.caption)
//                Spacer()
//                HStack {
//                    ForEach(recipe, id: \.self) { ingredient in
//                        ItemRow(item: items.first(where:{ $0.name == ingredient.rawValue })!)
//                    }
//                }
//            }
//            Spacer()
//        }
//    }
//}
//
//struct ItemDetailView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        ItemDetailView(item: items.first(where: {
//            $0.name == "omelette"
//        })!)
//    }
//}
