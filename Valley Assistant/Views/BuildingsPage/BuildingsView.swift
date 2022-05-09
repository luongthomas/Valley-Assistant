//
//  BuildingsView.swift
//  Valley Assistant
//
//  Created by Thomas Luong on 9/23/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct BuildingsView: View {
    @Binding public var resetNavigationID: UUID
    
    let categories: [BuildingType] = [.all, .shop, .shopWithSeasonalStock, .residence, .communityCenter, .upgradables, .museum]
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(categories, id: \.self) { category in
                        NavigationLink(destination: BuildingTypeList(buildingType: category)) {
                            Text(category.rawValue.camelCaps)
                        }
                    }
                }
            }
            .navigationBarTitle("Buildings")
        }
        .id(self.resetNavigationID)
        .environment(\.horizontalSizeClass, .compact)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

