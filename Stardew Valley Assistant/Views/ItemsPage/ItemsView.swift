//
//  ItemsView.swift
//  Stardew Valley Assistant
//
//  Created by Thomas Luong on 9/23/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct ItemsView: View {
    let categories = ["All Items", "Crafting", "Fish", "Crops", "Weapons", "Recipes", "Tools"]

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(categories, id: \.self) { category in
                        NavigationLink(destination: self.containedView(category: category)) {
                            Text(category)
                        }
                    }
                }
            }
            .navigationBarTitle("Items")
        }
    }
    
    func containedView(category: String) -> AnyView {
        switch category {
            case "All Items":
                return AnyView(AllItemsView())
            case "Crafting":
                return AnyView(CraftingView())
            case "Fish":
                return AnyView(FishView())
            case "Crops":
                return AnyView(CropsView())
            case "Weapons":
                return AnyView(WeaponsView())
            case "Recipes":
                return AnyView(RecipesView())
            case "Tools":
                return AnyView(ToolsView())
            default:
                return AnyView(AllItemsView())
        }
    }
}

struct ItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ItemsView()
    }
}
