//
//  NotificationUseCaseImpl.swift
//  ExampleMVVM
//
//  Created by V002822 on 5/8/25.
//

protocol NotificationUseCase {
    func fetchNotifications(completion: @escaping ([NotificationItem]) -> Void)
}

final class NotificationUseCaseImpl: NotificationUseCase {
    private let repository: NotificationRepository

    init(repository: NotificationRepository) {
        self.repository = repository
    }

    func fetchNotifications(completion: @escaping ([NotificationItem]) -> Void) {
        repository.fetchNotifications(completion: completion)
    }
}
