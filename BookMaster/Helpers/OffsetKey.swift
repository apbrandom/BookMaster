//
//  OffsetKey.swift
//  BookMaster
//
//  Created by Vadim Vinogradov on 11/20/24.
//

//OffsetKey используется для передачи значения смещения (CGFloat) от дочернего представления к родительскому через систему предпочтений (PreferenceKey) в SwiftUI.

import SwiftUI

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
