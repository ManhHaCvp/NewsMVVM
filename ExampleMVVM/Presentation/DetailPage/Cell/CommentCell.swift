//
//  CommentCell.swift
//  ExampleMVVM
//
//  Created by V002822 on 4/29/25.
//

import UIKit

class CommentCell: UITableViewCell {

    @IBOutlet weak var bookmarkButton: UIButton!
    @IBOutlet weak var heartButton: UIButton!

    private var isLiked = false
    private var isNoted = false

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    @IBAction func heartButtonTapped(_ sender: Any) {
        isLiked.toggle()
        updateButtonAppearance()
    }
    
    @IBAction func bookmarkButtonTapped(_ sender: Any) {
        isNoted.toggle()
        updateButtonAppearanceBM()
    }

    private func updateButtonAppearance() {
        let imageName = isLiked ? "heart.fill" : "heart"
        let tintColor = isLiked ? UIColor.systemRed : UIColor.systemGray
        heartButton.setImage(UIImage(systemName: imageName), for: .normal)
        heartButton.tintColor = tintColor
    }

    private func updateButtonAppearanceBM() {
        let imageName = isNoted ? "bookmark.fill" : "bookmark"
        let tintColor = isNoted ? UIColor.systemBlue : UIColor.systemGray
        bookmarkButton.setImage(UIImage(systemName: imageName), for: .normal)
        bookmarkButton.tintColor = tintColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
