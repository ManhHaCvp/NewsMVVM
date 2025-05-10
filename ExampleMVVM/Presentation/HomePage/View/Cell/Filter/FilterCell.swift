//
//  FilterCell.swift
//  ExampleMVVM
//
//  Created by V002822 on 4/17/25.
//

protocol FilterCellDelegate: AnyObject {
    func filterCell(_ cell: FilterCell, didSelectCategory category: String)
}

import UIKit

class FilterCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    private var categories: [String] = []
    
    private var selectedCategory: String = "All"
//    var onCategorySelected: ((String) -> Void)?
    
    weak var delegate: FilterCellDelegate?


    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none

        collectionView.dataSource = self
        collectionView.delegate = self

        let nib = UINib(nibName: "CategoryCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "CategoryCell")

        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 8
            layout.minimumInteritemSpacing = 8
        }
    }

    func bind(categories: [String], selectedCategory: String) {
        self.categories = categories
        self.selectedCategory = selectedCategory
        collectionView.reloadData()
    }

}

extension FilterCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        let category = categories[indexPath.item]
        cell.bind(text: category, isSelected: category == selectedCategory)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let text = categories[indexPath.item]
        let font = UIFont.systemFont(ofSize: 14)
        let width = text.size(withAttributes: [.font: font]).width + 20
        return CGSize(width: width, height: 30)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selected = categories[indexPath.item]
        selectedCategory = selected
        collectionView.reloadData()
//        onCategorySelected?(selected)
        delegate?.filterCell(self, didSelectCategory: selected)
    }
}


//func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//    let selected = categories[indexPath.item]
//    selectedCategory = selected
//    collectionView.reloadData()
//    delegate?.onClickButton(selected: selected)
//}
//
//
//}
//
//extension FilterCell: StatusButtonDelegate {
//func onClickButton(selected: String) {
//    
//}
//
//
//}
