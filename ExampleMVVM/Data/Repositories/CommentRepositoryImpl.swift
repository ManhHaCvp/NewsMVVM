//
//  CommentRepositoryImpl.swift
//  ExampleMVVM
//
//  Created by V002822 on 5/9/25.
//

final class CommentRepositoryImpl: CommentRepository {
    private let remoteDataSource: CommentRemoteDataSource

    init(remoteDataSource: CommentRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    func fetchComments(completion: @escaping ([CommentItem]) -> Void) {
        remoteDataSource.getComments(completion: completion)
    }
}
