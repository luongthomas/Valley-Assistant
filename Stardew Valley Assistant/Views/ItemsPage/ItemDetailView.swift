//
//  ItemDetailView.swift
//  Stardew Valley Assistant
//
//  Created by Thomas Luong on 9/24/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct ItemDetailView: View {
    var item: BasicItem
    
    var body: some View {
        Text("\(item.name)")
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        ItemDetailView(item: BasicItem(id: 0, name: "Rock", value: 100, obtainMethod: "Store", description: "A hard mineral."))
    }
}
