//
//  Booking.swift
//  BookMaster
//
//  Created by Vadim Vinogradov on 1/28/25.
//

import Foundation

class TimeSlot: Identifiable {
    var id: UUID = UUID()
    var clientID: UUID?
    var date: Date
    var masterID: UUID
    
    init(date: Date, masterID: UUID) {
        self.date = date
        self.masterID = masterID
    }
    

}

extension TimeSlot {
    static let mockMasterID: UUID = UUID()
    
    static var mockData: [TimeSlot] {
        var data: [TimeSlot] = []
        for _ in 0..<10 {
            data.append(TimeSlot(date: Date(), masterID: UUID()))
        }
        return data
    }
}
