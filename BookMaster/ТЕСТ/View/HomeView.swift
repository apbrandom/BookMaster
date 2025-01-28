//
//  HomeView.swift
//  BookMaster
//
//  Created by Vadim Vinogradov on 11/22/24.
//

import SwiftUI

struct HomeView: View {
    
    //MARK: - Свойства
    //MARK: Свойства календаря
    @State private var currentDate: Date = .init()
    @State private var issWeekCreated: Bool = true
    @State private var isToggled: Bool = false
    @State private var weekSlider = [[Date.WeekDay]]()
    @State private var currentWeekIndex: Int = 0
    
    //MARK: Свойства View
    @Namespace private var animation
    @State private var showApprovalView: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            //MARK: HeaderVIew
            HeaderView()
            //
            ScrollView { }
        }
        .onAppear {
            let currentWeek = Date().fetchWeek()
            if let firstDate = currentWeek.first?.date {
                weekSlider.append(firstDate.createPreviousWeek())
            }
            weekSlider.append(currentWeek)
            if let lastDate = currentWeek.last?.date {
                weekSlider.append(lastDate.createNextWeek())
            }
        }
    }
    
    @ViewBuilder
    func HeaderView() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 5) {
                Text(currentDate.format("MMMM"))
                    .foregroundStyle(.blue)
                Text(currentDate.format("yyyy"))
                    .foregroundStyle(.gray)
            }
            .font(.title.bold())
            
            Text(currentDate.formatted(date: .complete, time: .omitted))
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
            
            TabView(selection: $currentWeekIndex) {
                ForEach(weekSlider.indices, id: \.self) { index in
                    WeekView(weekSlider[index])
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(height: 100)
        }
        .hSpaing(.leading)
        .padding()
        .background(.white)
        .overlay(alignment: .topTrailing) {
            Image(systemName: "plus")
                .resizable()
                .frame(width: 24, height: 24)
                .scaledToFit()
                .clipShape(.circle)
                .offset(x: -19)
        }
    }
    
    @ViewBuilder
    func WeekView(_ week: [Date.WeekDay]) -> some View {
        HStack(spacing: 0) {
            ForEach(week) { weekDay in
                VStack(spacing: 5) {
                    Text(weekDay.date.format("E"))
                        .font(.callout)
                        .fontWeight(.medium)
                        .textScale(.secondary)
                    Text(weekDay.date.format("dd"))
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundStyle(isSameDate(weekDay.date, currentDate) ? .white : .gray)
                        .frame(width: 32, height: 32)
                        .background {
                            if isSameDate(weekDay.date, currentDate) {
                                Circle()
                                    .fill(.darkBlue)
                            } else {
                                
                            }
                            if weekDay.date.isToday {
                                Circle()
                                    .fill(.darkBlue)
                                    .frame(width: 8, height: 8)
                                    .vSpaing(.bottom)
                                    .offset(y: 12)
                            }
                        }
                }
                .hSpaing(.center)
                .onTapGesture {
                    currentDate = weekDay.date
                }
            }
        }
        .background() {
            GeometryReader { geometry in
                let minX = geometry.frame(in: .global).minX
                
                Color
                    .clear
                    .preference(key: OffsetKey.self, value: minX)
                    .onPreferenceChange(OffsetKey.self) { value in
//                                                if value.rounded() == 15 && createNextWeek {
                        paginateWeek()
                    }
            }
        }
    }
    
    func paginateWeek() {
        if weekSlider.indices.contains(currentWeekIndex) {
            if let firstDate = weekSlider[currentWeekIndex].first?.date,
               currentWeekIndex == 0 {
                let previousWeek = firstDate.createPreviousWeek()
                if !previousWeek.isEmpty {
                    weekSlider.insert(previousWeek, at: 0)
                }
                if weekSlider.count > 1 {
                    weekSlider.removeLast()
                }
                currentWeekIndex -= 1
            }
        }
        
        if weekSlider.indices.contains(currentWeekIndex),
           let lastDate = weekSlider[currentWeekIndex].last?.date,
           currentWeekIndex == weekSlider.count - 1 {
            let nextWeek = lastDate.createNextWeek()
            if !nextWeek.isEmpty {
                weekSlider.append(nextWeek)
            }
            currentWeekIndex = weekSlider.count - 2
        }
    }
}


#Preview {
    HomeView()
}
