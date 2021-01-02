//
//  VillagerDetail.swift
//  Valley Assistant
//
//  Created by Thomas Luong on 9/23/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct VillagerDetailView: View {
    var villager: Villager

    let affinities = ["Loves", "Likes", "Neutrals"]
    
    @State var selectedAffinity = 0
    
    
    
//    HStack {
//        if let image = UIImage(named: "\(name)_Icon.png") {
//            Image(uiImage: image)
//        } else {
//            Image(uiImage: UIImage(named: "\(name).png")!)
//                .resizable()
//                .frame(width: 32, height: 32)
//        }
    
    
    var body: some View {
        let name = villager.name.rawValue.capitalized
        VStack(alignment: .leading) {

            HStack(alignment: VerticalAlignment.center) {
                Text(name)
                    .fontWeight(.bold)
                    .font(.title)
                Spacer()
                Image(uiImage: UIImage(named: "\(name).png")!)
                    .resizable()
                    .frame(width: 100, height: 100)
            }
            HStack(alignment: .top) {
                Text("Birthday: \(villager.birthday.season.description.capitalized)  \(villager.birthday.day)")
                .font(.subheadline)
                Spacer()
                Text("Address: \(villager.address.description.camelCaps)")
                    .font(.subheadline)
                
                NavigationLink(destination: ScheduleView(villager: villager)) {
                    Text("Schedule")
                }
            }

            Spacer()
            
            Picker(selection: $selectedAffinity, label: EmptyView()) {
                ForEach(0..<affinities.count) { index in
                    Text(self.affinities[index]).tag(index)
                }
            }.pickerStyle(SegmentedPickerStyle())
            List {
                ForEach(getItemsForAffinityOfVillager(affinity: affinities[selectedAffinity], villager: villager), id: \.self) { name in
                    ItemRow(item: items.first(where: {
                        $0.name == name
                    })!)
                }
            }
        }
        .padding()
        .navigationBarTitle("", displayMode: .inline)
    }
    
    private func getItemsForAffinityOfVillager(affinity: String, villager: Villager) -> [ItemName] {
        if affinity == "Loves" {
            return villager.loves.map({$0})
        } else if affinity == "Likes" {
            return villager.likes.map({$0})
        } else {
            return villager.neutral.map({$0})
        }
    }
}
