//
//  SearchPageViewController.swift
//  ExampleMVVM
//
//  Created by V002822 on 4/21/25.
//

import UIKit

enum SearchTab: Int, CaseIterable {
    case news
    case topics
    case author

    var title: String {
        switch self {
        case .news: return "News"
        case .topics: return "Topics"
        case .author: return "Author"
        }
    }
}

class SearchPageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    private var viewModel: SearchPageViewModel!
 
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tabCollectionView: UICollectionView!
    

    private var tabs: [SearchTab] = SearchTab.allCases
     private var selectedTab: SearchTab = .news

     override func viewDidLoad() {
         super.viewDidLoad()
         
         //Register Cell
         let listCellNib = UINib(nibName: "ListCell", bundle: nil)
         tableView.register(listCellNib, forCellReuseIdentifier: "ListCell")
         let topicCellNib = UINib(nibName: "TopicCell", bundle: nil)
         tableView.register(topicCellNib, forCellReuseIdentifier: "TopicCell")
         let nib = UINib(nibName: "TabCell", bundle: nil)
         tabCollectionView.register(nib, forCellWithReuseIdentifier: "TabCell")

         //Create UseCase
         let postUseCase = PostUseCaseImpl(repository: PostRepositoryImpl(remoteDataSource: MockPostRemoteDataSource()))
         let topicUseCase = TopicUseCaseImpl(repository: TopicRepositoryImpl(remoteDataSource: MockTopicRemoteDataSource()))
         let authorUseCase = AuthorUseCaseImpl(repository: AuthorRepositoryImpl(remoteDataSource: MockAuthorRemoteDataSource()))

         //Add UC to ViewModel
         viewModel = SearchPageViewModel(postUseCase: postUseCase, topicUseCase: topicUseCase, authorUseCase: authorUseCase)

         //Observable
         setupBindings()

         //Fetch Data
         viewModel.fetchAllData()

         searchTextField.delegate = self
         tabCollectionView.delegate = self
         tabCollectionView.dataSource = self
         tableView.delegate = self
         tableView.dataSource = self
         
         //Delete line between Cell
         tableView.separatorStyle = .none
         
         // Setup collection view
         if let layout = tabCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
             layout.scrollDirection = .horizontal
             layout.minimumLineSpacing = 10
             layout.minimumInteritemSpacing = 10
             tabCollectionView.showsHorizontalScrollIndicator = false
         }
         
         // Remove space top ViewController
         navigationController?.setNavigationBarHidden(true, animated: true)
         
         //Hide right indicator
         tableView.showsVerticalScrollIndicator = false

         // Style textField
         searchTextField.layer.borderWidth = 1
         searchTextField.layer.borderColor = UIColor.black.cgColor
         searchTextField.layer.cornerRadius = 8
         searchTextField.clipsToBounds = true
         
         // Auto Focus
         searchTextField.becomeFirstResponder()
         
         // Left sight
         let searchIcon = UIImageView(image: UIImage(systemName: "magnifyingglass"))
         searchIcon.tintColor = .gray
         searchIcon.contentMode = .scaleAspectFit
         searchIcon.frame = CGRect(x: 10, y: 5, width: 20, height: 20)
         let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 36, height: 30))
         leftPaddingView.addSubview(searchIcon)
         searchTextField.leftView = leftPaddingView
         searchTextField.leftViewMode = .always

         // Right sight
         let clearButton = UIButton(type: .custom)
         clearButton.setImage(UIImage(systemName: "xmark"), for: .normal)
         clearButton.tintColor = .gray
         clearButton.frame = CGRect(x: 0, y: 0, width: 24, height: 24) // Adjust size
         clearButton.addTarget(self, action: #selector(didTapClose), for: .touchUpInside)
         // Add padding on the right side
         let rightPadding = UIView(frame: CGRect(x: 0, y: 0, width: 32, height: 24))
         rightPadding.addSubview(clearButton)
         searchTextField.rightView = rightPadding
         searchTextField.rightViewMode = .always
     }

    //Observable
    private func setupBindings() {
        viewModel.filteredPosts.observe(on: self) { [weak self] _ in
            self?.tableView.reloadData()
        }
        viewModel.filteredTopics.observe(on: self) { [weak self] _ in
            self?.tableView.reloadData()
        }
        viewModel.filteredAuthors.observe(on: self) { [weak self] _ in
            self?.tableView.reloadData()
        }
    }

    //Close modal
     @objc func didTapClose() {
         self.dismiss(animated: true, completion: nil)
     }

     // MARK: Tabs
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return tabs.count
     }

     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabCell", for: indexPath) as! TabCell
         let tab = tabs[indexPath.item]
         let isSelected = selectedTab == tab
         cell.bind(text: tab.title, isSelected: isSelected)
         return cell
     }

     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         selectedTab = tabs[indexPath.item]
         viewModel.selectedTab = selectedTab
         collectionView.reloadData()
         tableView.reloadData()
     }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let tab = tabs[indexPath.item]
        let font = UIFont.systemFont(ofSize: 16, weight: .medium)
        let text = tab.title
        let width = text.size(withAttributes: [.font: font]).width + 5 
        return CGSize(width: width, height: collectionView.bounds.height)
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems(in: selectedTab)
    }


    //MARK: Checkget data
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch selectedTab {
        case .news:
            if let post = viewModel.item(at: indexPath.row, in: .news) as? Post {
                let detailVC = DetailViewController()
                detailVC.post = post
                navigationController?.pushViewController(detailVC, animated: true)
            }

        default:
            break 
        }
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch selectedTab {
        case .news:
            guard let post = viewModel.item(at: indexPath.row, in: SearchTab.news) as? Post,
                  let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as? ListCell else {
                return UITableViewCell()
            }
            cell.bind(viewModel: HomePageItemViewModel(post: post))
            return cell
	
        case .topics:
            guard let topic = viewModel.item(at: indexPath.row, in: SearchTab.topics) as? Topic,
                  let cell = tableView.dequeueReusableCell(withIdentifier: "TopicCell", for: indexPath) as? TopicCell else {
                return UITableViewCell()
            }
            cell.bind(viewModel: TopicListItemViewModel(topic: topic))
            return cell

        case .author:
            guard let author = viewModel.item(at: indexPath.row, in: SearchTab.author) as? Author,
                  let cell = tableView.dequeueReusableCell(withIdentifier: "TopicCell", for: indexPath) as? TopicCell else {
                return UITableViewCell()
            }
            cell.bindAuthor(viewModel: AuthorListItemViewModel(author: author))
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch selectedTab {
        case .news:
            return 125
        case .topics, .author:
            return 80 
        }
    }
    
    // MARK: - UITextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // get current text
        guard let searchText = textField.text else { return true }

        viewModel.search(text: searchText)
//        tableView.reloadData()
        
        return true
    }



}
