//
//  VillagerView.swift
//  Valley Assistant
//
//  Created by Thomas Luong on 9/21/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct VillagerView: View {
    var body: some View {
        NavigationView {
            List(villagers, id: \.self) { villager in
                VillagerRow(villager: villager)
            }.navigationBarTitle("Villagers")
        }
        .environment(\.horizontalSizeClass, .compact)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct VillagerView_Previews: PreviewProvider {
    static var previews: some View {
        VillagerView()
    }
}
