//
//  HomePageViewController.swift
//  ExampleMVVM
//
//  Created by V002822 on 4/16/25.
//

import UIKit

class HomePageViewController: UIViewController, FilterCellDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func Notification(_ sender: Any) {
        let notiVC = NotificationViewController()
        navigationController?.pushViewController(notiVC, animated: true)
    }

    private var viewModel: HomePageViewModel!
    private var selectedCategory: String = "All"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        
        
        //Delete line between Cell
        tableView.separatorStyle = .none
        
        //Remove space top ViewController
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        //Hide right indicator
        tableView.showsVerticalScrollIndicator = false

        //Register Cell
        tableView.register(UINib(nibName: "TrendingCell", bundle: nil), forCellReuseIdentifier: "TrendingCell")
        tableView.register(UINib(nibName: "FilterCell", bundle: nil), forCellReuseIdentifier: "FilterCell")
        tableView.register(UINib(nibName: "ListCell", bundle: nil), forCellReuseIdentifier: "ListCell")
        tableView.register(UINib(nibName: "HeaderCell", bundle: nil), forCellReuseIdentifier: "HeaderCell")
        tableView.register(UINib(nibName: "SearchCell", bundle: nil), forCellReuseIdentifier: "SearchCell")
        
        // Create MockPostRemoteDataSource
        let remoteDataSource = MockPostRemoteDataSource()

        // Create PostRepositoryImpl, add MockPostRemoteDataSource
        let repository = PostRepositoryImpl(remoteDataSource: remoteDataSource)
        
        // Create PostUseCaseImpl, truyen vao repository
        let useCase = PostUseCaseImpl(repository: repository)
        
        // Create ViewModel with PostUseCaseImpl
        viewModel = HomePageViewModel(useCase: useCase)
        
        // Fetch data
        viewModel.fetchPosts()
    }
    
    private func bind() {
        viewModel.filteredPosts.observe(on: self) { [weak self] _ in
            self?.tableView.reloadData()
        }
        
        viewModel.trendingPost.observe(on: self) { [weak self] _ in
            self?.tableView.reloadData()
        }
        
        viewModel.category.observe(on: self) { [weak self] _ in
            self?.tableView.reloadData()
        }
    }
}

extension HomePageViewController: UITableViewDataSource {
    
    func filterCell(_ cell: FilterCell, didSelectCategory category: String) {
        selectedCategory = category
        viewModel.filterPosts(by: category)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 + viewModel.filteredPosts.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0: // SearchCell
            let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! SearchCell
            cell.delegate = self
            return cell
            
        case 1: // Header: Trending
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell", for: indexPath) as! HeaderCell
            cell.bind(title: "Trending", actionText: "See all")
            return cell
            
        case 2: // Trending Cell
            let cell = tableView.dequeueReusableCell(withIdentifier: "TrendingCell", for: indexPath) as! TrendingCell
            if let trendingPost = viewModel.trendingPost.value {
                let trendingVM = HomePageItemViewModel(post: trendingPost)
                cell.bind(viewModel: trendingVM)
            }
            return cell
            
        case 3: // Header: Latest
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell", for: indexPath) as! HeaderCell
            cell.bind(title: "Latest", actionText: "See all")
            return cell
            
        case 4: // Filter Cell
            let cell = tableView.dequeueReusableCell(withIdentifier: "FilterCell", for: indexPath) as! FilterCell
            cell.bind(categories: viewModel.category.value, selectedCategory: selectedCategory)
            cell.delegate = self
            return cell
            
        default: // List Cell
            let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListCell
            let postVM = viewModel.listPostItem(at: indexPath.row - 5)
            cell.bind(viewModel: postVM)
            return cell
        }
    }
}

extension HomePageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0: return 48 //  SearchCell
        case 1, 3: return 40 // HeaderCell
        case 2: return UITableView.automaticDimension // TrendingCell
        case 4: return 40 // FilterCell
        default: return 125 // ListCell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Trending Cell
        if indexPath.row == 2 {
            if let post = viewModel.trendingPost.value {
                navigateToDetail(with: post)
            }
        }

        // List Cell
        if indexPath.row >= 5 {
            let postVM = viewModel.listPostItem(at: indexPath.row - 5)
            navigateToDetail(with: postVM.data)
        }
    }

    private func navigateToDetail(with post: Post) {
        let detailVC = DetailViewController()
        detailVC.post = post
        detailVC.hidesBottomBarWhenPushed = true 
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}



extension HomePageViewController: SearchCellDelegate {
    func didTapSearchButton() {
        let searchVC = SearchPageViewController(nibName: "SearchPageViewController", bundle: nil)
        
        let nav = UINavigationController(rootViewController: searchVC)
        nav.modalPresentationStyle = .fullScreen
        nav.modalTransitionStyle = .coverVertical
        
        self.present(nav, animated: true)
    }
}

