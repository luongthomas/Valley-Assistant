//
//  HomeView.swift
//  Stardew Valley Assistant
//
//  Created by Thomas Luong on 9/19/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @State var isPresented = false
    
    let rkManager: RKManager
    
    init() {
        let startDate = Date(timeIntervalSince1970: 1801468800) // February 2027
        self.rkManager = RKManager(calendar: Calendar.current, minimumDate: startDate, maximumDate: .distantFuture, mode: 0)
    }
    
    var body: some View {
        ZStack {
            VStack (alignment: .leading) {
                HStack {
                    VStack (alignment: .leading) {
                        Text("Spring 1").font(.largeTitle)
                        Text("Sunday")
                    }
                    Spacer()
                    calendarButton
                }.padding(.bottom, 50)
                
                List {
                    Section(header: listHeader(headerText: "Birthdays")) {
                        Text("Birthday 1")
                    }
                    Spacer(minLength: 1)
                    Section(header: listHeader(headerText: "Festivals")) {
                        Text("Festival 1")
                    }
                    Spacer(minLength: 1)
                    Section(header: listHeader(headerText: "Tasks")) {
                        Text("Task 1")
                        Text("Task 2")
                        Text("Task 3")
                        Text("Task 4")
                        Text("Task 5")
                    }
                    Spacer(minLength: 1)
                }.border(Color.gray, width: 0.0)
                
            }.padding()
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    addTaskButton
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

private extension HomeView {
    
    var calendarButton: some View {
        Button(action: {
            self.isPresented = true
        }, label: {
            Image(systemName: "calendar")
            .resizable()
            .frame(width: 30, height: 30)
            .aspectRatio(1, contentMode: .fit)
        }).popover(isPresented: $isPresented) {
            CalendarView(rkManager: self.rkManager)
        }
    }
    
    func listHeader(headerText: String) -> some View {
        Text(headerText)
    }
    
    var addTaskButton: some View {
        Button(action: {
//            self.items.append(Item(value: "Item"))
            print("h")
        }, label: {
            Text("+")
            .font(.system(.largeTitle))
            .frame(width: 60, height: 54)
            .foregroundColor(Color.white)
            .padding(.bottom, 7)
        })
        .background(Color.blue)
        .cornerRadius(38.5)
        .padding()
        .shadow(color: Color.black.opacity(0.3),
                radius: 3,
                x: 3,
                y: 3)
    }
}
