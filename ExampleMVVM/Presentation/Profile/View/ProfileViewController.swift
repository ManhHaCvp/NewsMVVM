//
//  ProfileViewController.swift
//  ExampleMVVM
//
//  Created by V002822 on 4/16/25.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editProfileButton: UIButton!
    @IBAction func editTapped(_ sender: Any) {
        let editVC = EditProfileViewController()
        navigationController?.pushViewController(editVC, animated: true)
    }
    @IBOutlet weak var settingButton: UIButton!
    @IBAction func settingButtonTapped(_ sender: Any) {
        let settingsVC = SettingsViewController()
        navigationController?.pushViewController(settingsVC, animated: true)
    }
    private let tabs = ["News", "Recent"]
    private var selectedTabIndex = 0
    private var viewModel: ProfileViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(true, animated: true)

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "TabCell", bundle: nil), forCellWithReuseIdentifier: "TabCell")

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ListCell", bundle: nil), forCellReuseIdentifier: "ListCell")

        let postUseCase = PostUseCaseImpl(repository: PostRepositoryImpl(remoteDataSource: MockPostRemoteDataSource()))
        viewModel = ProfileViewModel(postUseCase: postUseCase)
        viewModel.fetchPosts()

        //Delete line between Cell
        tableView.separatorStyle = .none
        
        //Hide right indicator
        tableView.showsVerticalScrollIndicator = false

    }
}

extension ProfileViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabs.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabCell", for: indexPath) as? TabCell else {
            return UICollectionViewCell()
        }
        let text = tabs[indexPath.item]
        let isSelected = indexPath.item == selectedTabIndex
        cell.bind(text: text, isSelected: isSelected)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedTabIndex = indexPath.item
        collectionView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let font = UIFont.systemFont(ofSize: 16, weight: .medium)
        let text = tabs[indexPath.item]
        let width = text.size(withAttributes: [.font: font]).width + 5
        return CGSize(width: width, height: collectionView.bounds.height)
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        let post = viewModel.item(at: indexPath.row)
        cell.bind(viewModel: HomePageItemViewModel(post: post))
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}

