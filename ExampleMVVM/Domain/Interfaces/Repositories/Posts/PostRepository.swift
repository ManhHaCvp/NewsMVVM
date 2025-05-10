//
//  PostRepository.swift
//  ExampleMVVM
//
//  Created by V002822 on 4/17/25.
//

protocol PostRepository {
    func fetchPosts(completion: @escaping ([Post]) -> Void)
}
