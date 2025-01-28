//
//  TimeSlotCell.swift
//  BookMaster
//
//  Created by Vadim Vinogradov on 1/28/25.
//

import SwiftUI

struct TimeSlotCell: View {
    @State var observed: Observed
    
    var body: some View {
        VStack {
            Text(observed.timeLabel)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.green)
    }
}

extension TimeSlotCell {
    @Observable
    class Observed {
        var timeSlot: TimeSlot
        var timeLabel: String {
            "\(timeSlot.date.formatted(date: .omitted, time: .shortened)) - \(timeSlot.endDate.formatted(date: .omitted, time: .shortened))"
        }
        
        var isFreeDescription: String {
            guard timeSlot.masterID == nil else {
                return "Время занято"
            }
            
            if timeSlot.clientID == currentUserId {
                return "Вы заняли это время"
            }
            
            return "Свободно"
        }
        
        init(timeSlot: TimeSlot) {
            self.timeSlot = timeSlot
        }
    }
}

#Preview {
    TimeSlotCell(observed: .init(timeSlot: .init(date: .now, masterID: TimeSlot.mockMasterID)))
}
