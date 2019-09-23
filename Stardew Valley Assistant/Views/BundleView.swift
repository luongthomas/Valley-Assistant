//
//  BundleView.swift
//  Stardew Valley Assistant
//
//  Created by Thomas Luong on 9/23/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct BundleView: View {
    
    let areas = ["Crafts Room", "Pantry", "Fish Tank", "Boiler Room", "Bulletin Board", "Vault"]
    
    @State var selectedArea = 0
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    Picker(selection: $selectedArea, label: EmptyView()) {
                        ForEach(0..<areas.count) { index in
                            Text(self.areas[index]).tag(index)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Spacer()
                
                List {
                    Text("hello")
                }
                
            }.navigationBarTitle("Bundles")
        }.padding()
    }
}

struct BundleView_Previews: PreviewProvider {
    static var previews: some View {
        BundleView()
    }
}
