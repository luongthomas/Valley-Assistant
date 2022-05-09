//
//  PurchasableList.swift
//  Valley Assistant
//
//  Created by Thomas Luong on 10/8/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct PurchasableList: View {
    @State private var purchaseSeason = 0
    @State private var searchTerm = ""
    
    let seasons: [Season] = [.all, .spring, .summer, .fall, .winter]
    var building: Building
    
    var body: some View {
        VStack {
            Picker(selection: $purchaseSeason, label: EmptyView()) {
                ForEach(0..<seasons.count, id:\.self) { index in
                    Text(self.seasons[index].rawValue.capitalized).tag(index)
                }
            }.pickerStyle(SegmentedPickerStyle())
            
            List {
                SearchBar(text: $searchTerm)
                ForEach(
                    filterViaSeasonAndSearch(items: building.purchasable!, seasonFilter: seasons[purchaseSeason])
                , id: \.self) { purchasable in
                    
                    PurchasableRow(purchasable: purchasable)
                }
            }
            .navigationBarTitle("\(building.name.rawValue.camelCaps) Purchasables")
        }
    }
    
    private func filterViaSeasonAndSearch(items: [Purchasable], seasonFilter: Season) -> [Purchasable] {
        var validElements: [Purchasable]
        
        if seasonFilter == .all {
            validElements = items
        } else {
            validElements = items.filter({
                var itemSeason = [Season]()
                
                if let season = $0.availableSeason {
                    itemSeason.append(contentsOf: season)
                } else {
                    itemSeason.append(.all)
                }
                
                return itemSeason.contains(seasonFilter)
            })
        }
        
        return validElements.filter {
            self.searchTerm.isEmpty ? true : $0.name.rawValue.localizedCaseInsensitiveContains(self.searchTerm)
        }
    }
}
