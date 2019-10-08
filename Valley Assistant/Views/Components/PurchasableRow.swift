//
//  PurchasableRow.swift
//  Valley Assistant
//
//  Created by Thomas Luong on 10/7/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct PurchasableRow: View {
    var purchasable: Purchasable

    var body: some View {
        HStack {
            NavigationLink(destination: ItemDetailView(item:
                items.first(where: { $0.name == purchasable.name })!
            )) {
                HStack() {
                    Text(purchasable.name.rawValue.capitalized)
                    Spacer()
                    Text("\(purchasable.price)")
                }
            }
        }
    }
}
