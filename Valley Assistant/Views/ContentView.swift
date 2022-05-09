//
//  ContentView.swift
//  Valley Assistant
//
//  Created by Thomas Luong on 9/19/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    @ObservedObject var rkManager: RKManager
    @State private var resetNavigationID = UUID()
    
    var body: some View {
        
        let selectable = Binding(
            get: { self.selection },
            set: {
                let oldSelection = self.selection
                
                // set new ID to recreate NavigationView, so put it
                // in root state, same as is on change tab and back
                self.selection = $0
                
                if selection == oldSelection {
                    self.resetNavigationID = UUID()
                }
            }
        )

        return TabView(selection: selectable) {
            HomeView(rkManager: rkManager).tabItem {
                Image(systemName: "calendar")
                Text("Calendar")
            }.tag(0)

            VillagerView(resetNavigationID: $resetNavigationID).tabItem {
                Image(systemName: "person")
                Text("Villagers")
            }.tag(1)

            ItemsView(resetNavigationID: $resetNavigationID).tabItem {
                Image(systemName: "square.on.square")
                Text("Items")
            }.tag(2)

            BuildingsView(resetNavigationID: $resetNavigationID).tabItem {
                Image(systemName: "house")
                Text("Buildings")
            }.tag(3)
        }
    }
}

