//
//  CommentPostCell.swift
//  ExampleMVVM
//
//  Created by V002822 on 5/9/25.
//

import UIKit

class CommentPostCell: UITableViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var thumbnailImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
