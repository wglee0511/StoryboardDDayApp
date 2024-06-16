//
//  DateUtil.swift
//  StoryboardDDayApp
//
//  Created by racoon on 6/14/24.
//

import Foundation

extension Date {
    
    init(
        year: Int,
        month: Int,
        day: Int,
        hour: Int? = nil,
        minute: Int? = nil,
        second: Int? = nil
    ) {
        let calendar = Calendar.autoupdatingCurrent
        let components = DateComponents(year: year, month: month, day: day, hour: hour, minute: minute, second: second)
        
        self = calendar.date(from: components) ?? Date()
    }
    
    func days(from date: Date) -> Int? {
        let calendar = Calendar.autoupdatingCurrent
        
        let from = calendar.startOfDay(for: date)
        let to = calendar.startOfDay(for: self)
        
        let countedDays = calendar.dateComponents([.day], from: from, to: to).day
        
        return countedDays
    }
    
    static var today: Date {
        let calendar = Calendar.autoupdatingCurrent
        
        return calendar.startOfDay(for: .now)
    }
    
    var upcomingBirthDay: Date {
        let calendar = Calendar.autoupdatingCurrent
        let thisYear = calendar.component(.year, from: Self.today)
        
        var component = calendar.dateComponents([.month, .day], from: self)
        component.year = thisYear
        
        var targetData = calendar.date(from: component)
        
        if let targetData, targetData < Self.today {
            component.year = thisYear + 1
            return calendar.date(from: component) ?? self
        }
        
        return targetData ?? self
    }
    
}
