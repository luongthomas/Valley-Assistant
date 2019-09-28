//
//  RKCell.swift
//  Stardew Valley Assistant
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
    
    var body: some View {
        GeometryReader { geometry in
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
                ZStack {
                    Spacer()
                    Color.black.opacity(0.001)
                }
            }
            .background(self.rkDate.getBackgroundColor())
        }
    }
    
    func getSizeBasedOnRotation(geometry: GeometryProxy, idealCellWidth: CGFloat) -> CellSize {
        if geometry.size.height > geometry.size.width {
            return CellSize(minWidth: idealCellWidth, maxWidth: geometry.size.width/3, minHeight: idealCellWidth/3, maxHeight: geometry.size.width/3, idealHeight: idealCellWidth)
        } else {
            return CellSize(minWidth: idealCellWidth, maxWidth: geometry.size.width/3, minHeight: idealCellWidth/3, maxHeight: geometry.size.width/3, idealHeight: idealCellWidth)
        }
    }
    
    struct CellSize {
        var minWidth: CGFloat? = nil
        var maxWidth: CGFloat? = nil
        var idealWidth: CGFloat? = nil
        
        var minHeight: CGFloat? = nil
        var maxHeight: CGFloat? = nil
        var idealHeight: CGFloat? = nil
    }
}
