//
//  event.swift
//  StoryboardDDayApp
//
//  Created by racoon on 6/14/24.
//

import UIKit

struct Event {
    let title: String
    let date: Date
    
    let backgroundColor: UIColor
    let fontColor: UIColor
    let icon: String
    
    var daysString: String? {
        guard let days = date.days(from: Date.today) else {
            return nil
        }
        
        if days >= 0 {
            return "D -\(abs(days))"
        } else {
            return "D +\(abs(days))"
        }
    }
    
    var dateString: String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        
        return dateFormatter.string(from: date)
    }
    
    var iconImage: UIImage? {
        return UIImage(named: icon)
    }
}


var dummyEvents = [
    Event(title: "크리스마스", date: Date(year: 2024, month: 12, day: 25, hour: 0, minute: 0, second: 0), backgroundColor: .systemBlue, fontColor: .white, icon: "love"),
    Event(title: "재원이 결혼식", date: Date(year: 2024, month: 5, day: 12, hour: 11, minute: 0, second: 0), backgroundColor: .systemPink, fontColor: .white, icon: "wedding"),
    Event(title: "일본 여행", date: Date(year: 2024, month: 5, day: 15), backgroundColor: .green, fontColor: .black, icon: "travel")
]
