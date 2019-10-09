//
//  ItemDetailView.swift
//  Valley Assistant
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
        VStack(alignment: .leading) {
            Text("Value: \(item.value)")
            Text("Description: \(item.basicDescription)")
            Text("Source: \(item.source)")
            
            if item.type == .food {
                Text("Health: \(item.heal!)")
                Text("Stamina: \(item.stamina!)")
            }
                
            item.growthTimeDays.map({
                Text("Days to full growth: \($0)")
            })
            
            item.seasonToGrow.map({
                Text("Seasons to grow in: \($0.printArray)")
            })
            
            item.recipe.map({
                RecipeView(recipe: $0)
            })
            
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
            .navigationBarTitle("\(item.name.rawValue.camelCaps)")
        }.padding()
    }
    
    private func getVillagersThat(affinity: String, item: Item) -> [VillagerName] {
        var villagersForAffinity = [VillagerName]()
        if affinity == "Loves" {
            villagersForAffinity = villagers.compactMap({ villager in
                // Convert to enum and check if "loves" contains it
                if villager.loves.contains(item.name) {
                    return villager.name
                } else {
                    return nil
                }
            })
        } else if affinity == "Likes" {
            villagersForAffinity = villagers.compactMap({ villager in
                if villager.likes.contains(item.name) {
                    return villager.name
                } else {
                    return nil
                }
            })
        }
        return villagersForAffinity
    }
}

struct RecipeView: View {
    var recipe: [ItemName]
    
    var body: some View {
        HStack {
            ScrollView(.horizontal, showsIndicators: false) {
                Text("Recipe: ").font(.caption)
                Spacer()
                HStack {
                    ForEach(recipe, id: \.self) { ingredient in
                        ItemRow(item: items.first(where:{ $0.name == ingredient })!)
                    }
                }
            }
            Spacer()
        }
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        ItemDetailView(item: items.first(where: {
            $0.name.rawValue == "omelette"
        })!)
    }
}
