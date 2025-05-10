//
//  TopicCell.swift
//  ExampleMVVM
//
//  Created by V002822 on 4/21/25.
//

import UIKit

class TopicCell: UITableViewCell, StatusButtonDelegate {


    @IBOutlet weak var statusButton: StatusButton!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var thumbnailImage: UIImageView!
    override func awakeFromNib() {
          super.awakeFromNib()
          
          selectionStyle = .none
          
          thumbnailImage.layer.cornerRadius = 4
          thumbnailImage.contentMode = .scaleAspectFill
          thumbnailImage.clipsToBounds = true
      }

      override func setSelected(_ selected: Bool, animated: Bool) {
          super.setSelected(selected, animated: animated)
      }

      func bind(viewModel: TopicListItemViewModel) {
          titleLabel.text = viewModel.title
          contentLabel.text = viewModel.content
          statusButton.configure(type: .save, isActive: viewModel.isActive, delegate: self)

          
          if let imageURL = viewModel.thumbnailImageURL, let url = URL(string: imageURL) {
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
    
    func bindAuthor(viewModel: AuthorListItemViewModel) {
        titleLabel.text = viewModel.name
        contentLabel.text = viewModel.content
        statusButton.configure(type: .follow, isActive: viewModel.isActive, delegate: self)

        if let imageURL = viewModel.thumbnailImage, let url = URL(string: imageURL) {
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

    
    func onClickButton() {
        print("Status button clicked - TopicCell")
    }
  }
