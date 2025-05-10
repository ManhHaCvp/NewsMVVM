//
//  NotificationCell.swift
//  ExampleMVVM
//
//  Created by V002822 on 5/8/25.
//

import UIKit

class NotificationCell: UITableViewCell {

    @IBOutlet weak var statusButtonWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var statusButton: StatusButton!
    @IBOutlet weak var NotificationView: UIView!

    override func layoutSubviews() {
        super.layoutSubviews()

        thumbnailImage.layer.cornerRadius = thumbnailImage.frame.size.width / 2
        thumbnailImage.clipsToBounds = true
        self.layer.cornerRadius = 8
        NotificationView.layer.cornerRadius = 8

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func bind(viewModel: NotificationItemViewModel) {
        message.text = viewModel.data.message
        timeLabel.text = viewModel.data.time.timeAgoDisplay()

        if viewModel.data.isFollowed {
            statusButtonWidthConstraint.priority = UILayoutPriority(500)
            statusButton.isHidden = false
        } else {
            statusButtonWidthConstraint.priority = UILayoutPriority(1000)
            statusButton.isHidden = true
        }

        statusButton.isHidden = !viewModel.data.isFollowed
        statusButton.configure(type: .follow, isActive: !viewModel.data.isFollowed)
        statusButton.backgroundColor = UIColor.systemGray5

        if let imageURL = viewModel.data.imageURL, let url = URL(string: imageURL) {
            URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                guard let self = self, let data = data, error == nil,
                      let image = UIImage(data: data) else { return }

                DispatchQueue.main.async {
                    self.thumbnailImage.image = image
                }
            }.resume()
        } else {
            thumbnailImage.image = UIImage(named: "placeholder")
        }
    }

}
