import UIKit

let targetDate = Date(year: 1990, month: 5, day: 11, hour: 17, minute: 30, second: 0)
let event = Event(title: "Hello world", date: targetDate, backgroundColor: UIColor.systemPink, fontColor: UIColor.systemGray2, icon: "wedding")

event.daysString
