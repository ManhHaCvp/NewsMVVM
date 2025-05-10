//import Foundation
//import UIKit
//
//
//class CategoryCollectionView: UICollectionView {
//    
//    weak var parentDelegate: CategoryCollectionViewDelegate?
//    private var categories: [String] = []
//    
//    private var selectedCategory: String = "All"
////    var onCategorySelected: ((String) -> Void)?
//    
////    func setData(parentDelegate: CategoryCollectionViewDelegate, categories: [String]) {
////        self.categories = categories
////        self.parentDelegate = parentDelegate
////        self.delegate = self
////        self.dataSource = self
////        
////        let nib = UINib(nibName: "CategoryCell", bundle: nil)
////        self.register(nib, forCellWithReuseIdentifier: "CategoryCell")
////
////        if let layout = self.collectionViewLayout as? UICollectionViewFlowLayout {
////            layout.scrollDirection = .horizontal
////            layout.minimumLineSpacing = 0
////            layout.minimumInteritemSpacing = 0
////        }
////    }
//}
//
//extension CategoryCollectionView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return categories.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
//        let category = categories[indexPath.item]
//        cell.bind(text: category, isSelected: category == selectedCategory)
//        return cell
//    }
//
//    // Tính size theo nội dung hoặc cố định
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let text = categories[indexPath.item]
//        let font = UIFont.systemFont(ofSize: 14)
//        let width = text.size(withAttributes: [.font: font]).width + 20
//        return CGSize(width: width, height: 30)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let selected = categories[indexPath.item]
//        selectedCategory = selected
//        collectionView.reloadData()
//        parentDelegate?.onClickCategory(selected: selected)
//    }
//
//}
//
//protocol CategoryCollectionViewDelegate: class {
//    func onClickCategory(selected: String)
//    
//}

import UIKit

protocol CategoryCollectionViewDelegate: AnyObject {
    func onClickCategory(selected: String)
}

class CategoryCollectionView: UICollectionView {

    weak var parentDelegate: CategoryCollectionViewDelegate?
    private var categories: [String] = []
    private var selectedCategory: String = "All"

    func setData(parentDelegate: CategoryCollectionViewDelegate, categories: [String]) {
        self.categories = categories
        self.parentDelegate = parentDelegate
        self.delegate = self
        self.dataSource = self
        self.reloadData()
    }
}

extension CategoryCollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabCell", for: indexPath) as! TabCell
        let category = categories[indexPath.item]
        cell.bind(text: category, isSelected: category == selectedCategory)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selected = categories[indexPath.item]
        selectedCategory = selected
        collectionView.reloadData()
        parentDelegate?.onClickCategory(selected: selected)
    }
}
