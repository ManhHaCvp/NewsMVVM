//
//  TopicRepository.swift
//  ExampleMVVM
//
//  Created by V002822 on 4/21/25.
//

protocol TopicRepository {
    func fetchTopics(completion: @escaping ([Topic]) -> Void)
}
