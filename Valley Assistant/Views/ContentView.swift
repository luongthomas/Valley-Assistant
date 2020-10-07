//
//  ContentView.swift
//  Valley Assistant
//
//  Created by Thomas Luong on 9/19/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = Tab.Calendar
    @ObservedObject var rkManager: RKManager
    

    var body: some View {
        let selection = Binding<Tab> (
            get: { self.selectedTab },
            set: {
                self.selectedTab = $0
        })

        return TabView(selection: selection) {
            HomeView(rkManager: rkManager).tabItem {
                Image(systemName: "calendar")
                Text("Calendar")
            }
            .tag(Tab.Calendar)

            VillagerView().tabItem {
                Image(systemName: "person")
                Text("Villagers")
            }
            .tag(Tab.Villagers)

            ItemsView().tabItem {
                Image(systemName: "square.on.square")
                Text("Items")
            }
            .tag(Tab.Items)

            BuildingsView().tabItem {
                Image(systemName: "house")
                Text("Buildings")
            }
            .tag(Tab.Buildings)
        }
    }
}

extension ContentView {
    enum Tab: Hashable {
        case Calendar
        case Villagers
        case Items
        case Buildings
    }
}

