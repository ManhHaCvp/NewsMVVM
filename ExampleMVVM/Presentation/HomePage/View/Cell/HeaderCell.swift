//
//  HeaderCell.swift
//  ExampleMVVM
//
//  Created by V002822 on 4/17/25.
//

import UIKit

class HeaderCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var actionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bind(title: String, actionText: String?) {
        titleLabel.text = title
        actionLabel.text = actionText
        actionLabel.isHidden = (actionText == nil)
    }
    
}
