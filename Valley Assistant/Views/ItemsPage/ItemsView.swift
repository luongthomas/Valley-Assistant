//
//  ItemsView.swift
//  Valley Assistant
//
//  Created by Thomas Luong on 9/23/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct ItemsView: View {
    @Binding public var resetNavigationID: UUID
    
    let categories: [ItemType] = [.all, .tools, .food, .fish, .crops, .weapons, .crafting, .minerals]

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(categories, id: \.self) { category in
                        NavigationLink(destination: ItemTypeList(itemType: category)) {
                            Text(category.rawValue.capitalized)
                        }
                    }
                }
            }
            .navigationBarTitle("Items")
        }
        .id(self.resetNavigationID)
        .environment(\.horizontalSizeClass, .compact)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

