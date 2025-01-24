//
//  View+Ext.swift
//  BookMaster
//
//  Created by Vadim Vinogradov on 11/19/24.
//

import Foundation
import SwiftUI

extension View {
    @ViewBuilder
    func hSpaing(_ aligment: Alignment ) -> some View {
        self.frame(maxWidth: .infinity, alignment: aligment)
    
    }
    
    @ViewBuilder
    func vSpaing(_ aligment: Alignment ) -> some View {
        self.frame(maxHeight: .infinity, alignment: aligment)
    }
    
    func isSameDate(_ date1: Date, _ date2: Date) -> Bool {
        Calendar.current.isDate(date1, inSameDayAs: date2)
    }
}
