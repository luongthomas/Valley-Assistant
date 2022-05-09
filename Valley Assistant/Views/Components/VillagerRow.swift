//
//  VillagerRow.swift
//  Valley Assistant
//
//  Created by Thomas Luong on 9/24/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct VillagerRow: View {
    var villager: Villager
    
    var body: some View {
        let name = villager.name.rawValue.capitalized
        
        HStack {
            if let image = UIImage(named: "\(name)_Icon.png") {
                Image(uiImage: image)
            } else {
                Image(uiImage: UIImage(named: "\(name).png")!)
                    .resizable()
                    .frame(width: 32, height: 32)
            }
            NavigationLink(destination: VillagerDetailView(villager: villager)) {
                Text(villager.name.rawValue.capitalized)
            }
        }
    }
}
