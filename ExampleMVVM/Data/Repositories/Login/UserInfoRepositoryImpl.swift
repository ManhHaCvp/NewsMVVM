//
//  UserInfoRepositoryImpl.swift
//  ExampleMVVM
//
//  Created by V002822 on 4/23/25.
//

class UserInfoRepositoryImpl: UserInfoRepository {
    private let remoteDataSource: LoginRemoteDataSource

    init(remoteDataSource: LoginRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    func getUserInfo(completion: @escaping (Result<(Account, Bool), Error>) -> Void) {
        remoteDataSource.getUserInfo(completion: completion)
    }
}
