//
//  BuildingsView.swift
//  Valley Assistant
//
//  Created by Thomas Luong on 9/23/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct BuildingsView: View {
    let categories: [BuildingType] = [.all, .shop , .house, .communityCenter, .farmUpgrades, .houseUpgrades]
    
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
        }.environment(\.horizontalSizeClass, .compact)
    }
}

struct BuildingsView_Previews: PreviewProvider {
    static var previews: some View {
        BuildingsView()
    }
}
