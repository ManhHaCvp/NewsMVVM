//
//  MockTopicRemoteDataSource.swift
//  ExampleMVVM
//
//  Created by V002822 on 4/21/25.
//

protocol TopicRemoteDataSource {
    func getTopics(completion: @escaping ([Topic]) -> Void)
}

final class MockTopicRemoteDataSource: TopicRemoteDataSource {
    func getTopics(completion: @escaping ([Topic]) -> Void) {
        completion(Topic.mockData())
    }
}
