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
        self.rkManager = RKManager(selectedDate: Day(season: .winter, day: 2))
    }
    
    var body: some View {
        ZStack {
            VStack (alignment: .leading) {
                HStack {
                    VStack (alignment: .leading) {
                        Text(rkManager.getPrintableCurrentDate()).font(.largeTitle)
                        Text(rkManager.getWeekday()).font(.subheadline)
                    }
                    Spacer()
                    calendarButton
                }.padding(.bottom, 50)
                
                getTodayList(dateManager: rkManager)
                .border(Color.gray, width: 0.0)
                
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
        }).sheet(isPresented: $isPresented) {
            CalendarView(rkManager: self.rkManager)
        }
    }
    
    func listHeader(headerText: String) -> some View {
        Text(headerText)
    }
    
    var addTaskButton: some View {
        Button(action: {
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
    
    func getTodayList(dateManager: RKManager) -> some View {
        var todayBirthdays = [Event]()
        var todayFestivals = [Event]()
        var todayTasks = [Event]()

        if let birthdayOnDate = birthdays.first(where:({$0.date == dateManager.selectedDate})) {
            todayBirthdays.append(birthdayOnDate)
        }
        
        if let festivalOnDate = festivals.first(where:({$0.date == dateManager.selectedDate})) {
            todayFestivals.append(festivalOnDate)
        }
        
        let tasksOnDate = tasks.filter(({$0.date == dateManager.selectedDate}))
        todayTasks += tasksOnDate
        
        return List {
            if !todayBirthdays.isEmpty {
                Section(header: listHeader(headerText: "Birthdays")) {
                    Text("\(todayBirthdays.first!.name)")
                }
            }
            if !todayFestivals.isEmpty {
                Section(header: listHeader(headerText: "Festivals")) {
                    Text("\(todayFestivals.first!.name)")
                }
            }
            
            if !todayTasks.isEmpty {
                Section(header: listHeader(headerText: "Tasks")) {
                    ForEach(todayTasks, id: \.id) { task in
                        Text("\(task.name)")
                    }
                }
            }
            EmptyView()
        }
        
    }
}
