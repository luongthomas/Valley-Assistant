//
//  RKCell.swift
//  Valley Assistant
//
//  Created by Thomas Luong on 9/19/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//
import SwiftUI

// Solution to have tapable Spacer areas
// https://stackoverflow.com/questions/57191013/swiftui-cant-tap-in-spacer-of-hstack


struct RKCell: View {
    var rkDate: RKDate
    var cellWidth: CGFloat
    @ObservedObject var rkManager: RKManager
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text("\(self.rkDate.date.day)")
                            .fontWeight(self.rkDate.getFontWeight())
                            .foregroundColor(self.rkDate.getTextColor())
                        .font(.system(size: 15))
                        
                        ZStack {
                            Spacer()
                            Color.black.opacity(0.001)
                        }
                    }
                    
                    // Used to Push the number to the left
                    ZStack {
                        Spacer()
                        Color.black.opacity(0.001)
                    }
                }
                .frame(maxHeight: cellWidth)
                .background(self.rkDate.getBackgroundColor())
                
                // Symbols to appear in the cell representing events
                HStack {
                    self.getImageForDay(date: self.rkDate.date)
                }
            }
        }
    }
    
    func getImageForDay(date: Day) -> some View {
        if birthdays.first(where:({$0.date == date})) != nil {
            return AnyView(Image(systemName: "heart.fill"))
        } else if festivals.first(where:({$0.date == date})) != nil {
            return AnyView(Image(systemName: "app.gift"))
        } else if tasks.first(where:({$0.date == date})) != nil {
            return AnyView(Image(systemName: "list.number"))
        } else {
            return AnyView((EmptyView()))
        }
    }
}
