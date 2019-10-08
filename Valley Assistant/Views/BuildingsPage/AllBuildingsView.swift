//
//  AllBuildingsView.swift
//  Valley Assistant
//
//  Created by Thomas Luong on 9/23/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct AllBuildingsView: View {
    @State private var searchTerm = ""
    
    var body: some View {
        VStack {
            List {
                SearchBar(text: $searchTerm)
                
                ForEach(buildings.filter {
                    self.searchTerm.isEmpty ? true : $0.name.rawValue.localizedCaseInsensitiveContains(self.searchTerm)
                }, id: \.self) { building in
                    NavigationLink(destination: BuildingDetailView(building: building)) {
                        Text(building.name.rawValue.camelCaps)
                    }
                }
            }.navigationBarTitle("All Buildings")
        }
    }
}

struct AllBuildingsView_Previews: PreviewProvider {
    static var previews: some View {
        AllBuildingsView()
    }
}
