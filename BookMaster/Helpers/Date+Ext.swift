//
//  Untitled.swift
//  BookMaster
//
//  Created by Vadim Vinogradov on 11/19/24.
//

import Foundation

extension Date {
    
    /// Проверяет, является ли дата сегодняшним днем.
    var isToday: Bool {
        Calendar.current.isDateInToday(self)
    }
    
    /// Сравнивает текущий объект `Date` с указанной датой по часам.
    /// Возвращает true, если часы совпадают.
    var isTheSameHourAs: Bool {
        Calendar.current.compare(self, to: Date(), toGranularity: .hour) == .orderedSame
    }
    
    /// Проверяет, находится ли дата в прошедшем часе относительно текущего времени.
    var isPastHour: Bool {
        Calendar.current.compare(self, to: Date(), toGranularity: .hour) == .orderedAscending
    }
    /// Проверяет, находится ли дата в будущем часу относительно текущего времени.
    var isFutureHour: Bool {
        Calendar.current.compare(self, to: Date(), toGranularity: .hour) == .orderedDescending
    }
    
    /// Форматирует дату в строку с использованием заданного формата.
    func format(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    /// Возвращает массив дней недели, включая текущую дату.
    /// - Parameter date: Дата, с которой начинается неделя (по умолчанию - сегодня).
    /// - Returns: Массив объектов `WeekDay`, представляющих дни текущей недели.
    func fetchWeek(_ date: Date = Date()) -> [WeekDay] {
        let calendar = Calendar.current
        let startOfWeek = calendar.startOfDay(for: date)
        var weekDays: [WeekDay] = []
        let weekForMonth = calendar.dateInterval(of: .weekOfMonth, for: startOfWeek)
        
        guard let startOfweek = weekForMonth?.start else { return weekDays }
        
        (0..<7).forEach { index in
            if let weekDayDate = calendar.date(byAdding: .day, value: index, to: startOfweek) {
                let weekDay = WeekDay(date: weekDayDate)
                weekDays.append(weekDay)
            }
        }
        return weekDays
    }
    
    func createNextWeek() -> [WeekDay] {
        let calendar = Calendar.current
        let startOfWeek = calendar.startOfDay(for: self)
        guard let nextWeekStart = calendar.date(byAdding: .day, value: 1, to: startOfWeek) else { return [] }
        return fetchWeek(nextWeekStart)
        
    }
    
    func createPreviousWeek() -> [WeekDay] {
        let calendar = Calendar.current
        let startOfWeek = calendar.startOfDay(for: self)
        guard let previousWeekStart = calendar.date(byAdding: .day, value: -1, to: startOfWeek) else { return [] }
        return fetchWeek(previousWeekStart)
    }

        func createWeek() -> [WeekDay] {
            let calendar = Calendar.current
            let startOfWeek = calendar.dateInterval(of: .weekOfYear, for: self)?.start ?? calendar.startOfDay(for: self)
            return (0..<7).compactMap { offset in
                guard let weekDayDate = calendar.date(byAdding: .day, value: offset, to: startOfWeek) else { return nil }
                return WeekDay(date: weekDayDate)
            }
        }

    struct WeekDay: Identifiable {
        var id: UUID = UUID()
        let date: Date
    }
    
}

