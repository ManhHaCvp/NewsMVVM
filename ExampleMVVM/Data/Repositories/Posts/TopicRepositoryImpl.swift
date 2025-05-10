//
//  TopicRepositoryImpl.swift
//  ExampleMVVM
//
//  Created by V002822 on 4/21/25.
//

final class TopicRepositoryImpl: TopicRepository {
    private let remoteDataSource: TopicRemoteDataSource

    init(remoteDataSource: TopicRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    func fetchTopics(completion: @escaping ([Topic]) -> Void) {
        remoteDataSource.getTopics(completion: completion)
    }
}
