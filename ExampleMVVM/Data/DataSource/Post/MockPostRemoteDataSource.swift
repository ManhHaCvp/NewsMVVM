//
//  MockPostRemoteDataSource.swift
//  ExampleMVVM
//
//  Created by V002822 on 4/17/25.
//

protocol PostRemoteDataSource {
    func getPosts(completion: @escaping ([Post]) -> Void)
}

final class MockPostRemoteDataSource: PostRemoteDataSource {
    func getPosts(completion: @escaping ([Post]) -> Void) {
        completion(Post.mockData())
    }
}
