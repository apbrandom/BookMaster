//
//  ContentView.swift
//  BookMaster
//
//  Created by Vadim Vinogradov on 11/19/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeView()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.BG)
    }
}

#Preview {
    ContentView()
}
