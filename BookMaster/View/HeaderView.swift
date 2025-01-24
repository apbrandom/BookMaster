//
//  HeaderView.swift
//  BookMaster
//
//  Created by Vadim Vinogradov on 1/23/25.
//

import SwiftUI

struct HeaderView: View {
    
    var currentDate: Date
    
    var body: some View {
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
        }
        .hSpaing(.leading)
        .padding()
    }
}

//#Preview {
//    HeaderView()
//}
