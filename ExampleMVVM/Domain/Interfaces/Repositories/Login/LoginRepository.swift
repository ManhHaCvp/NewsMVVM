//
//  LoginRepository.swift
//  ExampleMVVM
//
//  Created by V002822 on 4/15/25.
//

import Foundation

protocol LoginRepository {
    func login(username: String, password: String, rememberMe: Bool, completion: @escaping (Result<Account, Error>) -> Void)
}
