//
//  MockNotificationRemoteDataSource.swift
//  ExampleMVVM
//
//  Created by V002822 on 5/8/25.
//

protocol NotificationRemoteDataSource {
    func getNotifications(completion: @escaping ([NotificationItem]) -> Void)
}

final class MockNotificationRemoteDataSource: NotificationRemoteDataSource {
    func getNotifications(completion: @escaping ([NotificationItem]) -> Void) {
        completion(NotificationItem.mockData())
    }
}
