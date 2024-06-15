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
    
    let daysString: String?
    let dateString: String?
    let iconImage: UIImage?
    
    init(title: String, date: Date, backgroundColor: UIColor, fontColor: UIColor, icon: String) {
        self.title = title
        self.date = date
        self.backgroundColor = backgroundColor
        self.fontColor = fontColor
        self.icon = icon
        
        if let days = date.days(from: Date.today) {
            daysString = days >= 0 ? "D -\(abs(days))" :  "D +\(abs(days))"
        } else {
            daysString = nil
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        
        dateString = dateFormatter.string(from: date)
        iconImage = UIImage(named: icon)

        
    }
}


var dummyEvents = [
    Event(title: "크리스마스", date: Date(year: 2024, month: 12, day: 25, hour: 0, minute: 0, second: 0), backgroundColor: .systemBlue, fontColor: .white, icon: "love"),
    Event(title: "재원이 결혼식", date: Date(year: 2024, month: 5, day: 12, hour: 11, minute: 0, second: 0), backgroundColor: .systemPink, fontColor: .white, icon: "wedding"),
    Event(title: "일본 여행", date: Date(year: 2024, month: 5, day: 15), backgroundColor: .green, fontColor: .black, icon: "travel")
]
