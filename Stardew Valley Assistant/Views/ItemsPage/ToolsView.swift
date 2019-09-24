//
//  ToolsView.swift
//  Stardew Valley Assistant
//
//  Created by Thomas Luong on 9/23/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct ToolsView: View {
    @State private var searchTerm = ""
    
    var body: some View {
        VStack {
            List {
                SearchBar(text: $searchTerm)
                
                ForEach(items.filter {
                    validElement(item: $0)
                }, id: \.id) { item in
                    NavigationLink(destination: ItemDetailView(item: item)) {
                        Text(item.name)
                    }
                }
            }.navigationBarTitle("Tools")
        }
    }
    
    private func validElement(item: Item) -> Bool {
        let containsSubString = self.searchTerm.isEmpty ? true : item.name.localizedCaseInsensitiveContains(self.searchTerm)
        
        if containsSubString && item.type == .tool {
            return true
        } else {
            return false
        }
    }
}

struct ToolsView_Previews: PreviewProvider {
    static var previews: some View {
        ToolsView()
    }
}
