//
//  CommentUseCaseImpl.swift
//  ExampleMVVM
//
//  Created by V002822 on 5/9/25.
//

protocol CommentUseCase {
    func fetchComments(completion: @escaping ([CommentItem]) -> Void)
}

final class CommentUseCaseImpl: CommentUseCase {
    private let repository: CommentRepository

    init(repository: CommentRepository) {
        self.repository = repository
    }

    func fetchComments(completion: @escaping ([CommentItem]) -> Void) {
        repository.fetchComments(completion: completion)
    }
}
