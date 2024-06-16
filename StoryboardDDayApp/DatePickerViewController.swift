//
//  DatePickerViewController.swift
//  StoryboardDDayApp
//
//  Created by racoon on 6/16/24.
//

import UIKit

class DatePickerViewController: UIViewController {
    
    @IBOutlet weak var daysLabel: UILabel!
    @IBOutlet weak var selectedDateLabel: UILabel!
    @IBOutlet weak var changeStyleButton: UIBarButtonItem!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func onPressChangeStyleButton(_ sender: UIBarButtonItem) {
        
        let datePickerStyle = datePicker.datePickerStyle
        
        if datePickerStyle == .inline {
            datePicker.preferredDatePickerStyle = .wheels
            changeStyleButton.image = UIImage(systemName: "calendar")
        } else {
            datePicker.preferredDatePickerStyle = .inline
            changeStyleButton.image = UIImage(systemName: "line.3.horizontal.decrease.circle")
        }
        
    }

    @IBAction func onChangeDate(_ sender: UIDatePicker) {
        if let days = datePicker.date.days(from: Date.today) {
            daysLabel.text = days >= 0 ? "D - \(abs(days))" :  "D +\(abs(days))"
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        
        selectedDateLabel.text = formatter.string(from: datePicker.date)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onChangeDate(datePicker)
        // Do any additional setup after loading the view.
    }

}
