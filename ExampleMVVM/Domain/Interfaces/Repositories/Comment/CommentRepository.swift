//
//  CommentRepository.swift
//  ExampleMVVM
//
//  Created by V002822 on 5/9/25.
//

protocol CommentRepository {
    func fetchComments(completion: @escaping ([CommentItem]) -> Void)
}
