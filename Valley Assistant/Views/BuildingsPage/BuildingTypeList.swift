//
//  BuildingTypeList.swift
//  Valley Assistant
//
//  Created by Thomas Luong on 10/7/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct BuildingTypeList: View {
    @State private var searchTerm = ""
    var buildingType: BuildingType
    
    var body: some View {
        VStack {
            List {
                SearchBar(text: $searchTerm)
                
                ForEach(buildings.filter {
                    validElement(building: $0)
                }, id: \.id) { building in
                    NavigationLink(destination: BuildingDetailView(building: building)) {
                        Text(building.name.capitalized)
                    }
                }
            }.navigationBarTitle("\(buildingType.rawValue.camelCaps)")
        }
    }
    
    private func validElement(building: Building) -> Bool {
        let containsSubString = self.searchTerm.isEmpty ? true : building.name.localizedCaseInsensitiveContains(self.searchTerm)
        
        if containsSubString && (building.type == self.buildingType || self.buildingType == .all) {
            return true
        } else {
            return false
        }
    }
}
