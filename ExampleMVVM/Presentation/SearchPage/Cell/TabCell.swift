//
//  TabCell.swift
//  ExampleMVVM
//
//  Created by V002822 on 4/21/25.
//

import UIKit

class TabCell: UICollectionViewCell {

    
    @IBOutlet weak var underlineView: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        underlineView.backgroundColor = .systemBlue
        underlineView.layer.cornerRadius = 1
    }

    func bind(text: String, isSelected: Bool) {
        titleLabel.text = text
//        titleLabel.textColor = isSelected ? .black : .darkGray
        titleLabel.textColor = isSelected ? UIColor.label : UIColor.secondaryLabel
        underlineView.isHidden = !isSelected
    }
}
