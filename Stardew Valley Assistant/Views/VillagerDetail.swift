//
//  VillagerDetail.swift
//  Stardew Valley Assistant
//
//  Created by Thomas Luong on 9/23/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct VillagerDetail: View {
    var villager: Villager

    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text(villager.name)
                    .font(.title)

                HStack(alignment: .top) {
                    Text("Birthday: \(villager.birthday.season.description)  \(villager.birthday.day)")
                        .font(.subheadline)
                    Spacer()
                    Text("Address: \(villager.address.description)")
                        .font(.subheadline)
                }
            }
            .padding()

            Spacer()
        }
    }
}

//struct VillagerDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        VillagerDetail()
//    }
//}
