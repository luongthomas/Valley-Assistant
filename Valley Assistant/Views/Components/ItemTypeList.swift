//
//  ItemTypeList.swift
//  Valley Assistant
//
//  Created by Thomas Luong on 9/24/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct ItemTypeList: View {
    @State private var searchTerm = ""
    var itemType: ItemType
    
    var body: some View {
        VStack {
            List {
                SearchBar(text: $searchTerm)
                
                ForEach(items.filter {
                    validElement(item: $0)
                }, id: \.self) { item in
                    NavigationLink(destination: ItemDetailView(item: item)) {
                        Text(item.name.rawValue.capitalized)
                    }
                }
            }.navigationBarTitle("\(itemType.rawValue.capitalized)")
        }
    }
    
    private func validElement(item: Item) -> Bool {
        let containsSubString = self.searchTerm.isEmpty ? true : item.name.rawValue.localizedCaseInsensitiveContains(self.searchTerm)
        
        if containsSubString && (item.type == self.itemType || self.itemType == .all) {
            return true
        } else {
            return false
        }
    }
}
