//
//  Comment.swift
//  ExampleMVVM
//
//  Created by V002822 on 5/9/25.
//

protocol CommentRemoteDataSource {
    func getComments(completion: @escaping ([CommentItem]) -> Void)
}

final class MockCommentRemoteDataSource: CommentRemoteDataSource {
    func getComments(completion: @escaping ([CommentItem]) -> Void) {
        completion(CommentItem.mockData())
    }
}
