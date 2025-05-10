//
//  CategoryCell.swift
//  ExampleMVVM
//
//  Created by V002822 on 4/17/25.
//

import UIKit

class CategoryCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var containerView: UIView!

    @IBOutlet weak var underlineView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func bind(text: String, isSelected: Bool) {
        titleLabel.text = text
//        titleLabel.textColor = isSelected ? .black : .darkGray
        titleLabel.textColor = isSelected ? UIColor.label : UIColor.secondaryLabel
        underlineView.isHidden = !isSelected
    }



}
