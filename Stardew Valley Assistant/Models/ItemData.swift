//
//  ItemData.swift
//  Stardew Valley Assistant
//
//  Created by Thomas Luong on 9/24/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import Foundation

struct ItemData {
    var items = [BasicItem]()
    
    init() {
        let url = Bundle.main.url(forResource: "items", withExtension: ".json")!
        do {
            let json = try Data(contentsOf: url)
            self.items = try JSONDecoder().decode([BasicItem].self, from: json)
        } catch {
            print(error)
        }
    }
}
