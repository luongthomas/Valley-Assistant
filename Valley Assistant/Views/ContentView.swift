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
    @State private var resetNavigationID = UUID()
    
    var body: some View {
        let selection = Binding<Tab>(
            get: { self.selectedTab },
            set: {
                print("Pressed tab: \($0)")
                if $0 == .Calendar {
                           // <<< your action here !!
                    print("Calendar selected")
                }
                self.selectedTab = $0
                // set new ID to recreate NavigationView, so put it
                // in root state, same as is on change tab and back
                self.resetNavigationID = UUID()
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
            .id(self.resetNavigationID)
            
            ItemsView().tabItem {
                Image(systemName: "square.on.square")
                Text("Items")
            }
            .tag(Tab.Items)
            .id(self.resetNavigationID)
            
            BuildingsView().tabItem {
                Image(systemName: "house")
                Text("Buildings")
            }
            .tag(Tab.Buildings)
            .id(self.resetNavigationID)
        }
        .onTapGesture(count: 2, perform: {
            self.resetNavigationID = UUID()
        })
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

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
