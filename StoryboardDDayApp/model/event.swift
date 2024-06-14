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
}
