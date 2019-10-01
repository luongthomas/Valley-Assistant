//
//  BuildingsView.swift
//  Stardew Valley Assistant
//
//  Created by Thomas Luong on 9/23/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct BuildingsView: View {
    let categories = ["All Buildings", "Shops", "Farm Upgrades", "House Upgrades", "Community Center"]

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
            .navigationBarTitle("Buildings")
        }.environment(\.horizontalSizeClass, .compact)
    }
    
    func containedView(category: String) -> AnyView {
        switch category {
            case "All Buildings":
                return AnyView(AllBuildingsView())
            case "Shops":
                return AnyView(ShopsView())
            case "Farm Upgrades":
                return AnyView(FarmUpgradesView())
            case "House Upgrades":
                return AnyView(HouseUpgradesView())
            case "Community Center":
                return AnyView(CommunityCenterView())
            default:
                return AnyView(AllBuildingsView())
        }
    }
}

struct BuildingsView_Previews: PreviewProvider {
    static var previews: some View {
        BuildingsView()
    }
}
