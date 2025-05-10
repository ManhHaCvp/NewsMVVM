//
//  NotificationViewController.swift
//  ExampleMVVM
//
//  Created by V002822 on 5/8/25.
//

import UIKit

class NotificationViewController: UIViewController {

    private var viewModel: NotificationViewModel!
    private var itemViewModels: [NotificationItemViewModel] = []

    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
//        tableView.delegate = self
        tableView.register(UINib(nibName: "NotificationCell", bundle: nil), forCellReuseIdentifier: "NotificationCell")

        let notificationUseCase = NotificationUseCaseImpl(repository: NotificationRepositoryImpl(remoteDataSource: MockNotificationRemoteDataSource()))

        viewModel = NotificationViewModel(useCase: notificationUseCase)

        viewModel.loadNotifications { [weak self] in
            guard let self = self else { return }
            self.itemViewModels = self.viewModel.notifications.map { NotificationItemViewModel(notification: $0) }
            DispatchQueue.main.async {
                self.tableView.reloadData() 
            }
        }

        //Delete line between Cell
        tableView.separatorStyle = .none
    }
}

extension NotificationViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sectionedNotifications.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.sectionedNotifications[section].items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationCell", for: indexPath) as? NotificationCell else {
            return UITableViewCell()
        }
        let item = viewModel.sectionedNotifications[indexPath.section].items[indexPath.row]
        let itemVM = NotificationItemViewModel(notification: item)
        cell.bind(viewModel: itemVM)
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let date = viewModel.sectionedNotifications[section].date
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d"
//        formatter.dateStyle = .full
//        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
}

