//
//  DefaultLoginRepository.swift
//  ExampleMVVM
//
//  Created by V002822 on 4/15/25.
//


class LoginRepositoryImpl: LoginRepository {
    private let remoteDataSource: LoginRemoteDataSource

    init(remoteDataSource: LoginRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    func login(username: String, password: String, rememberMe: Bool, completion: @escaping (Result<Account, Error>) -> Void) {
        remoteDataSource.login(username: username, password: password, rememberMe: rememberMe, completion: completion)
    }
}
