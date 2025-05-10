//
//  PostRepositoryImpl.swift
//  ExampleMVVM
//
//  Created by V002822 on 4/17/25.
//

final class PostRepositoryImpl: PostRepository {
    private let remoteDataSource: PostRemoteDataSource

    init(remoteDataSource: PostRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    func fetchPosts(completion: @escaping ([Post]) -> Void) {
        remoteDataSource.getPosts(completion: completion)
    }
}
