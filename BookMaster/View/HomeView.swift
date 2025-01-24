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
    @State private var currentWeekIndex: Int = 0
    @State private var issWeekCreated: Bool = true
    @State private var weekSlider = [[Date.WeekDay]]()
    @State private var isToggled: Bool = false
     
    //MARK: Свойства View
    @Namespace private var animation
    @State private var showApprovalView: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HeaderView(currentDate: currentDate)
        }
    }
}

#Preview {
    HomeView()
}
