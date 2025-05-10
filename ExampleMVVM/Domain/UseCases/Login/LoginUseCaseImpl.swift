//
//  LoginUseCase.swift
//  ExampleMVVM
//
//  Created by V002822 on 4/15/25.
//

import Foundation

protocol LoginUseCase {
    func execute(username: String, password: String, rememberMe: Bool, completion: @escaping (Result<Account, Error>) -> Void)
}

class LoginUseCaseImpl: LoginUseCase {
    private let loginRepository: LoginRepository

    init(loginRepository: LoginRepository) {
        self.loginRepository = loginRepository
    }

    func execute(username: String, password: String, rememberMe: Bool, completion: @escaping (Result<Account, Error>) -> Void) {
        loginRepository.login(username: username, password: password, rememberMe: rememberMe,  completion: completion)
    }
}

