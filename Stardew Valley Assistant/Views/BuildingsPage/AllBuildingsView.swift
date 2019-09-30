//
//  AllBuildingsView.swift
//  Stardew Valley Assistant
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
                    self.searchTerm.isEmpty ? true : $0.name.localizedCaseInsensitiveContains(self.searchTerm)
                }, id: \.id) { building in
                    NavigationLink(destination: BuildingDetailView(building: building)) {
                        Text(building.name)
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
