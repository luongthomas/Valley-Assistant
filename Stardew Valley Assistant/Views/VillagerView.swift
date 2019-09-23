//
//  VillagerView.swift
//  Stardew Valley Assistant
//
//  Created by Thomas Luong on 9/21/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct VillagerView: View {
    var body: some View {
        NavigationView {
            List(villagers, id: \.id) { villager in
                NavigationLink(destination: VillagerDetail(villager: villager)) {
                    VillagerRow(villager: villager)
                }
            }.navigationBarTitle("Villagers")
        }
    }
}

struct VillagerView_Previews: PreviewProvider {
    static var previews: some View {
        VillagerView()
    }
}

struct VillagerRow: View {
    var villager: Villager

    var body: some View {
        HStack {
//            landmark.image
//                .resizable()
//                .frame(width: 50, height: 50)
            Text(villager.name)
        }
    }
}
