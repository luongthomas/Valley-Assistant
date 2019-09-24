//
//  ItemDetailView.swift
//  Stardew Valley Assistant
//
//  Created by Thomas Luong on 9/24/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct ItemDetailView: View {
    var item: BasicItem
    var villagersThatLike: [String]
    
    init(item: BasicItem) {
        self.item = item
        self.villagersThatLike = villagers.compactMap({ villager in
            if villager.likes.contains(Item(rawValue: item.name)!) {    // Convert to enum and check if "likes" contains it
                return villager.name
            } else {
                return nil
            }
        })
    }
    
    var body: some View {
        VStack {
            Text("Value: \(item.value)")
            Text("Description: \(item.description)")
            Text("Source: \(item.source)")
            
            // Segmented Control between Loves and Likes
            
            List {
                ForEach(villagersThatLike, id: \.self) { name in
                    Text(name)
                }
            }
            
            .navigationBarTitle("\(item.name)")
        }
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ItemDetailView(item: BasicItem(id: 0, name: "Rock", type: .mineral, value: 100, source: "Store", description: "A hard mineral."))
    }
}
