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
    let category: Category
    
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
    
    init(title: String, date: Date, backgroundColor: UIColor, fontColor: UIColor, category: Category) {
        self.title = title
        self.date = date
        self.backgroundColor = backgroundColor
        self.fontColor = fontColor
        self.category = category
        
        switch category {
        case .birthday:
            if let days = date.upcomingBirthDay.days(from: Date.today) {
                daysString = days >= 0 ? "D - \(abs(days))" :  "D + \(abs(days))"
            } else {
                daysString = nil
            }
            
        default:
            if let days = date.days(from: Date.today) {
                daysString = days >= 0 ? "D - \(abs(days))" :  "D + \(abs(days))"
            } else {
                daysString = nil
            }
            
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        
        dateString = dateFormatter.string(from: date)
        iconImage = UIImage(named: category.rawValue)

        
    }
    
    init(composeDate: ComposeData) {
        self.init(title: composeDate.title!, date: composeDate.date!, backgroundColor: composeDate.backgroundColor!, fontColor: composeDate.fontColor!, category: composeDate.category!)
    }
}


var dummyEvents = [
    Event(title: "크리스마스", date: Date(year: 2024, month: 12, day: 25, hour: 0, minute: 0, second: 0), backgroundColor: .systemBlue, fontColor: .white, category: .love),
    Event(title: "재원이 결혼식", date: Date(year: 2024, month: 5, day: 12, hour: 11, minute: 0, second: 0), backgroundColor: .systemPink, fontColor: .white, category: .wedding),
    Event(title: "일본 여행", date: Date(year: 2024, month: 5, day: 15), backgroundColor: .green, fontColor: .black, category: .travel),
    Event(title: "생일", date: Date(year: 2024, month: 5, day: 11), backgroundColor: .cyan, fontColor: .black, category: .birthday)
]
