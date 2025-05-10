//
//  NotificationViewModel.swift
//  ExampleMVVM
//
//  Created by V002822 on 5/8/25.
//

import Foundation

final class NotificationViewModel {
    private let useCase: NotificationUseCase
    private(set) var notifications: [NotificationItem] = []
    private(set) var sectionedNotifications: [NotificationSection] = []

    init(useCase: NotificationUseCase) {
        self.useCase = useCase
    }

//    func loadNotifications(completion: @escaping () -> Void) {
//        useCase.fetchNotifications { [weak self] items in
//            self?.notifications = items
//            completion()
//        }
//    }
//}

func loadNotifications(completion: @escaping () -> Void) {
    useCase.fetchNotifications { [weak self] items in
        guard let self = self else { return }

        self.notifications = items
        self.sectionedNotifications = Dictionary(grouping: items) { item in
            Calendar.current.startOfDay(for: item.time)
        }
        .map { NotificationSection(date: $0.key, items: $0.value) }
        .sorted(by: { $0.date > $1.date })

        completion()
    }
}
}
