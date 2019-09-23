//
//  ContentView.swift
//  Stardew Valley Assistant
//
//  Created by Thomas Luong on 9/19/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 1
    
    var body: some View {
        TabView(selection: $selection) {
            HomeView().tabItem {
                Image(systemName: "house")
                Text("Home")
                
            }.tag(1)
            VillagerView().tabItem {
                Image(systemName: "person")
                Text("Villagers")
            }.tag(2)
            BundleView().tabItem {
                Image(systemName: "square.on.square")
                Text("Bundles")
            }.tag(3)
            Text("Museum").tabItem {
                Image(systemName: "book")
                Text("Museum")
            }.tag(4)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
