//
//  NotificationRepository.swift
//  ExampleMVVM
//
//  Created by V002822 on 5/8/25.
//

protocol NotificationRepository {
    func fetchNotifications(completion: @escaping ([NotificationItem]) -> Void)
}
