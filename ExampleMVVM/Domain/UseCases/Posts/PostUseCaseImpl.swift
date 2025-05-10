//
//  PostUseCaseImpl.swift
//  ExampleMVVM
//
//  Created by V002822 on 4/17/25.
//

protocol PostUseCase {
    func fetchPosts(completion: @escaping ([Post]) -> Void)
}

final class PostUseCaseImpl: PostUseCase {
    private let repository: PostRepository

    init(repository: PostRepository) {
        self.repository = repository
    }

    func fetchPosts(completion: @escaping ([Post]) -> Void) {
        repository.fetchPosts(completion: completion)
    }
}
