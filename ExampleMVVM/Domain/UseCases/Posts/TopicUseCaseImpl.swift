//
//  TopicUseCaseImpl.swift
//  ExampleMVVM
//
//  Created by V002822 on 4/21/25.
//

protocol TopicUseCase {
    func fetchTopics(completion: @escaping ([Topic]) -> Void)
}

final class TopicUseCaseImpl: TopicUseCase {
    private let repository: TopicRepository

    init(repository: TopicRepository) {
        self.repository = repository
    }

    func fetchTopics(completion: @escaping ([Topic]) -> Void) {
        repository.fetchTopics(completion: completion)
    }
}
