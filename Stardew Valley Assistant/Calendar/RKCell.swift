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
        .frame(width: cellWidth, height: cellWidth, alignment: .topLeading)
        .font(.system(size: 15))
        .background(rkDate.getBackgroundColor())
//        .padding(.top, 5)
//        .padding(.leading, 5)
    }
}

//#if DEBUG
//struct RKCell_Previews : PreviewProvider {
//    static var previews: some View {
//        Group {
//            RKCell(rkDate: RKDate(date: Date(), rkManager: RKManager(calendar: Calendar.current),isSelected: false), cellWidth: CGFloat(UIScreen.main.bounds.width/8))
//                .previewDisplayName("Control")
//            RKCell(rkDate: RKDate(date: Date(), rkManager: RKManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60*60*24*365), mode: 0), isDisabled: true, isToday: false, isSelected: false, isBetweenStartAndEnd: false), cellWidth: CGFloat(UIScreen.main.bounds.width/8))
//                .previewDisplayName("Disabled Date")
//            RKCell(rkDate: RKDate(date: Date(), rkManager: RKManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60*60*24*365), mode: 0), isDisabled: false, isToday: true, isSelected: false, isBetweenStartAndEnd: false), cellWidth: CGFloat(UIScreen.main.bounds.width/8))
//                .previewDisplayName("Today")
//            RKCell(rkDate: RKDate(date: Date(), rkManager: RKManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60*60*24*365), mode: 0), isDisabled: false, isToday: false, isSelected: true, isBetweenStartAndEnd: false), cellWidth: CGFloat(UIScreen.main.bounds.width/8))
//                .previewDisplayName("Selected Date")
//            RKCell(rkDate: RKDate(date: Date(), rkManager: RKManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60*60*24*365), mode: 0), isDisabled: false, isToday: false, isSelected: false, isBetweenStartAndEnd: true), cellWidth: CGFloat(UIScreen.main.bounds.width/8))
//                .previewDisplayName("Between Two Dates")
//        }
//        .previewLayout(.fixed(width: 300, height: 70))
//            .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
//    }
//}
//#endif
