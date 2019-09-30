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
        VStack() {
            Text("Type: \(building.type.rawValue.capitalized)")
            Text("Hours: \(building.openTime.hour) \(building.openTime.ampm.rawValue.capitalized) - \(building.closeTime.hour) \(building.closeTime.ampm.rawValue.capitalized)")
            Text("Description: \(building.description)")
            
            Spacer()

            Text("Occupants")
            List {
                ForEach(building.occupants, id: \.self) { name in
                    VillagerRow(villager: villagers.first(where: {
                        $0.name == name
                    })!)
                }
            }


//            List {
//                ForEach(bui, id: \.self) { name in
//                    VillagerRow(villager: villagers.first(where: {
//                        $0.name == name
//                    })!)
//                }
//            }
            
            .navigationBarTitle("\(building.name)")
        }
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
