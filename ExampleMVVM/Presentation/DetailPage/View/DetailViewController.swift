//
//  DetailViewController.swift
//  ExampleMVVM
//
//  Created by V002822 on 4/28/25.
//

import UIKit

class DetailViewController: UIViewController {
    var post: Post?
    private var isLiked = false
    private var isNoted = false
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var heartButton: UIButton!
    
    @IBOutlet weak var bookmarkButton: UIButton!
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func heartButtonTapped(_ sender: Any) {
        isLiked.toggle()
        print("Heart button tapped. \(isLiked)")
        updateButtonAppearance()
    }
    
    @IBAction func bookmarkButtonTapped(_ sender: Any) {
        isNoted.toggle()
        updateButtonAppearanceBM()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
//        tableView.register(UINib(nibName: "DetailContentCell", bundle: nil), forCellReuseIdentifier: "DetailContentCell")
        tableView.register(UINib(nibName: "PostCell", bundle: nil), forCellReuseIdentifier: "PostCell")
//        tableView.register(UINib(nibName: "CommentCell", bundle: nil), forCellReuseIdentifier: "CommentCell")


        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 400

        //Hide right indicator
        tableView.showsVerticalScrollIndicator = false

    }
}

extension DetailViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return post == nil ? 0 : 1//  => 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let post = post else { return UITableViewCell() }

        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
            let viewModel = HomePageItemViewModel(post: post)
            cell.bind(viewModel: viewModel)
            return cell

//        case 1:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath) as! CommentCell
//            return cell

        default:
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
//        case 0: return 850
        case 0: return UITableView.automaticDimension
        default: return 50
        }
//        return UITableView.automaticDimension
    }

    private func updateButtonAppearance() {
        let imageName = isLiked ? "heart.fill" : "heart"
        let image = UIImage(systemName: imageName)?.withRenderingMode(.alwaysTemplate)
        heartButton.setImage(image, for: .normal)
        heartButton.tintColor = isLiked ? .systemRed : .systemGray

        print("Heart button: \(isLiked ? "Liked" : "Unliked")")
    }

    private func updateButtonAppearanceBM() {
        let imageName = isNoted ? "bookmark.fill" : "bookmark"
        let image = UIImage(systemName: imageName)?.withRenderingMode(.alwaysTemplate)
        bookmarkButton.setImage(image, for: .normal)
        bookmarkButton.tintColor = isNoted ? .systemBlue : .systemGray
    }


}

