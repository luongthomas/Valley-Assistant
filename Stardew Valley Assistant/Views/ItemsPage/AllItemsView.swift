//
//  AllItemsView.swift
//  Stardew Valley Assistant
//
//  Created by Thomas Luong on 9/23/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct AllItemsView: View {
    @State private var searchTerm = ""
    
    var body: some View {
        VStack {
            List {
                SearchBar(text: $searchTerm)
                
                ForEach(items.filter {
                    self.searchTerm.isEmpty ? true : $0.name.rawValue.localizedCaseInsensitiveContains(self.searchTerm)
                }, id: \.id) { item in
                    NavigationLink(destination: ItemDetailView(item: item)) {
                        Text(item.name.rawValue.capitalized)
                    }
                }
            }.navigationBarTitle("All Items")
        }
    }
}

struct AllItemsView_Previews: PreviewProvider {
    static var previews: some View {
        AllItemsView()
    }
}
