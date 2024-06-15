//
//  EventTableViewCell.swift
//  StoryboardDDayApp
//
//  Created by racoon on 6/14/24.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var daysLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 20
        containerView.clipsToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
