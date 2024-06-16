//
//  ViewController.swift
//  StoryboardDDayApp
//
//  Created by racoon on 6/13/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var eventTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(forName: .INSERT_DATE_DATA, object: nil, queue: .main) { _ in
            self.eventTableView.reloadData()
        }

    }


}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyEvents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: EventTableViewCell.self), for: indexPath) as! EventTableViewCell
        
        let target = dummyEvents[indexPath.row]
        
        cell.iconImageView.image = target.iconImage
        cell.dateLabel.text = target.dateString
        cell.daysLabel.text = target.daysString
        cell.containerView.backgroundColor = target.backgroundColor
        cell.titleLabel.text = target.title
        
        cell.dateLabel.textColor = target.fontColor
        cell.daysLabel.textColor = target.fontColor
        cell.titleLabel.textColor = target.fontColor
        
        return cell
    }
    
    
}
