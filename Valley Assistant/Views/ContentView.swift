//
//  ContentView.swift
//  Valley Assistant
//
//  Created by Thomas Luong on 9/19/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 1
    @ObservedObject var rkManager: RKManager
    
    var body: some View {
        TabView(selection: $selection) {
            HomeView(rkManager: rkManager).tabItem {
                Image(systemName: "calendar")
                Text("Calendar")
            }.tag(1)
            VillagerView().tabItem {
                Image(systemName: "person")
                Text("Villagers")
            }.tag(2)
            ItemsView().tabItem {
                Image(systemName: "square.on.square")
                Text("Items")
            }.tag(3)
            BuildingsView().tabItem {
                Image(systemName: "house")
                Text("Buildings")
            }.tag(4)
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
