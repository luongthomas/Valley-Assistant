//
//  HomeView.swift
//  Valley Assistant
//
//  Created by Thomas Luong on 9/19/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @State var isPresented = false
    @EnvironmentObject var rkManager: RKManager
    @EnvironmentObject var eventHolder: EventHolder
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack (alignment: .leading) {
                    getTodayList(dateManager: rkManager)
                }
                
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        addTaskButton
                    }
                }
            }.padding()
            .navigationBarTitle(Text("\(rkManager.getWeekday()), \(rkManager.getPrintableCurrentDate())"))
            .navigationBarItems(leading: menuButton, trailing: calendarButton)
        }.onAppear {
            // TODO: Bug where calendar view doesn't show birthdays in list right away
            let birthdayEvents = events.generateBirthdayEvents()
            birthdays.append(contentsOf: birthdayEvents)
        }
        .environment(\.horizontalSizeClass, .compact)
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
            CalendarView(rkManager: self.rkManager, eventHolder: self.eventHolder)
        }
    }
    
    var menuButton: some View {
        Button(action: {
            self.isPresented = true
        }, label: {
            Image(systemName: "gear")
            .resizable()
            .frame(width: 30, height: 30)
            .aspectRatio(1, contentMode: .fit)
        }).sheet(isPresented: $isPresented) {
            CalendarView(rkManager: self.rkManager, eventHolder: self.eventHolder)
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
                    EventRow(event: todayBirthdays.first!)
                }
            }
            if !todayFestivals.isEmpty {
                Section(header: listHeader(headerText: "Festivals")) {
                    EventRow(event: todayFestivals.first!)
                }
            }
            
            if !todayTasks.isEmpty {
                Section(header: listHeader(headerText: "Tasks")) {
                    ForEach(todayTasks, id: \.id) { task in
                        EventRow(event: task)
                    }
                }
            }
            
            if todayTasks.isEmpty && todayBirthdays.isEmpty && todayFestivals.isEmpty {
                Section(header: listHeader(headerText: "Tasks")) {
                    Text("Nothing planned today")
                }
            }
        }
    }
}
