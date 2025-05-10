//
//  SearchCell.swift
//  ExampleMVVM
//
//  Created by V002822 on 4/21/25.
//

import UIKit

protocol SearchCellDelegate: AnyObject {
    func didTapSearchButton()
}

class SearchCell: UITableViewCell {
    @IBOutlet weak var searchButton: UIButton!
    
    weak var delegate: SearchCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        // Configure search button
        searchButton.backgroundColor = .white
        searchButton.layer.borderWidth = 1
        searchButton.layer.borderColor = UIColor.black.cgColor
        searchButton.layer.cornerRadius = 8
        searchButton.clipsToBounds = true
        searchButton.contentHorizontalAlignment = .left
        
        // Left icon - magnifying glass
        let leftIcon = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        leftIcon.tintColor = .gray
        leftIcon.contentMode = .scaleAspectFit
        leftIcon.frame = CGRect(x: 12, y: 14, width: 20, height: 20) // Adjust icon position

        // Right icon - custom image
        let rightIcon = UIImageView(image: UIImage(named: "Static"))
        rightIcon.tintColor = .gray
        rightIcon.contentMode = .scaleAspectFit
        rightIcon.frame = CGRect(x: searchButton.frame.width - 36, y: 14, width: 20, height: 24)
        rightIcon.autoresizingMask = [.flexibleLeftMargin]

        // Add icons to button
        searchButton.addSubview(leftIcon)
        searchButton.addSubview(rightIcon)
        
        // Add action
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc private func searchButtonTapped() {
        delegate?.didTapSearchButton()
    }
    
}
