//
//  SwiftUIView.swift
//  BookMaster
//
//  Created by Vadim Vinogradov on 1/23/25.
//

import SwiftUI

struct MatchedGeometryEffectExample: View {
    @Namespace private var animation 
    @State private var isExpanded: Bool = false

    var body: some View {
        VStack {
            if isExpanded {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(Color.blue)
                    .frame(width: 300, height: 300)
                    .matchedGeometryEffect(id: "rectangle", in: animation)
            } else {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(Color.blue)
                    .frame(width: 100, height: 100)
                    .matchedGeometryEffect(id: "rectangle", in: animation)
            }
            Button("Toggle") {
                withAnimation {
                    isExpanded.toggle()
                }
            }
        }
    }
}

#Preview {
    MatchedGeometryEffectExample()
}
