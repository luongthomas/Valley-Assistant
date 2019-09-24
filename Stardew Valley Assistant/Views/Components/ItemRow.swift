//
//  ItemRow.swift
//  Stardew Valley Assistant
//
//  Created by Thomas Luong on 9/24/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct ItemRow: View {
    var item: Item

    var body: some View {
        HStack {
            NavigationLink(destination: ItemDetailView(item: item)) {
                Text(item.name)
            }
        }
    }
}
