//
//  NotificationRepositoryImpl.swift
//  ExampleMVVM
//
//  Created by V002822 on 5/8/25.
//

final class NotificationRepositoryImpl: NotificationRepository {
    private let remoteDataSource: NotificationRemoteDataSource

    init(remoteDataSource: NotificationRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    func fetchNotifications(completion: @escaping ([NotificationItem]) -> Void) {
        remoteDataSource.getNotifications(completion: completion)
    }
}
