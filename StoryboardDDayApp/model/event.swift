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
    
    enum Category: String, CaseIterable {
        case birthday
        case briefcase
        case diet
        case love
        case wedding
        case exam
        case travel
        case baseball
        case basketball
        case football
        
        var title: String {
            switch self {
            case .birthday:
               return "셍일"
            case .briefcase:
                return "업무"
            case .diet:
                return "다이어트"
            case .love:
                return "데이트"
            case .wedding:
                return "결혼"
            case .exam:
                return "시험"
            case .travel:
                return "여행"
            case .baseball:
                return "야구"
            case .basketball:
                return "농구"
            case .football:
                return "축구"
            }
        }
    }
    
    init(title: String, date: Date, backgroundColor: UIColor, fontColor: UIColor, icon: String) {
        self.title = title
        self.date = date
        self.backgroundColor = backgroundColor
        self.fontColor = fontColor
        self.icon = icon
        
        if let days = date.days(from: Date.today) {
            daysString = days >= 0 ? "D - \(abs(days))" :  "D + \(abs(days))"
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
