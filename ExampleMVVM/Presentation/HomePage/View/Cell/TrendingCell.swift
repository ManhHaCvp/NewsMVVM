//
//  TrendingCell.swift
//  ExampleMVVM
//
//  Created by V002822 on 4/17/25.
//

import UIKit

class TrendingCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var channelIconImageView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        thumbnailImageView.layer.cornerRadius = 8
        thumbnailImageView.contentMode = .scaleAspectFill
        thumbnailImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bind(viewModel: HomePageItemViewModel) {
        titleLabel.text = viewModel.data.title
        authorLabel.text = viewModel.data.author
        timeLabel.text = viewModel.data.time.timeAgoDisplay()
        categoryLabel.text = viewModel.data.category
        channelIconImageView.image = UIImage(named: viewModel.data.channelIconName)

        if let imageURL = viewModel.data.imageURL, let url = URL(string: imageURL) {
            URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                guard let self = self, let data = data, error == nil,
                      let image = UIImage(data: data) else { return }

                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
            }.resume()
        } else {
            thumbnailImageView.image = UIImage(named: "placeholder")
        }
    }
    
}
