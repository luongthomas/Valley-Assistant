//
//  RKCell.swift
//  Stardew Valley Assistant
//
//  Created by Thomas Luong on 9/19/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//
import SwiftUI

struct RKCell: View {
    
    var rkDate: RKDate
    
    var cellWidth: CGFloat
    
    var body: some View {
        Text("\(rkDate.date.day)")
        .fontWeight(rkDate.getFontWeight())
        .foregroundColor(rkDate.getTextColor())
        .frame(minWidth: cellWidth, idealWidth: cellWidth, maxWidth: CGFloat(UIScreen.main.bounds.width/7), minHeight: 0,
               idealHeight: cellWidth, maxHeight: CGFloat(UIScreen.main.bounds.width/3), alignment: .topLeading)
        .font(.system(size: 15))
        .background(rkDate.getBackgroundColor())
//        .padding(.top, 5)
//        .padding(.leading, 5)
    }
}
