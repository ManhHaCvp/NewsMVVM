//
//  MockDataLogin.swift
//  ExampleMVVM
//
//  Created by V002822 on 4/15/25.
//

import Foundation

protocol LoginRemoteDataSource {
    func login(username: String, password: String, rememberMe: Bool, completion: @escaping (Result<Account, Error>) -> Void)
    func getUserInfo(completion: @escaping (Result<(Account, Bool), Error>) -> Void)
}

class MockLoginRemoteDataSource: LoginRemoteDataSource {
    private let mockAccounts: [Account] = [
        Account(username: "manh", password: "1234", token: "token_manh", fullName: "Manh Ha"),
        Account()
    ]
    
    func login(username: String, password: String, rememberMe: Bool, completion: @escaping (Result<Account, Error>) -> Void) {
        if let account = self.mockAccounts.first(where: {
            $0.username == username && $0.password == password
        }) {
            DispatchQueue.global().async {
                if rememberMe {
                    UserDefaults.standard.set(username, forKey: "username")
                    UserDefaults.standard.set(password, forKey: "password")
                    UserDefaults.standard.set(rememberMe, forKey: "rememberMe")
                } else {
                    UserDefaults.standard.removeObject(forKey: "username")
                    UserDefaults.standard.removeObject(forKey: "password")
                    UserDefaults.standard.removeObject(forKey: "rememberMe")
                }
            }
            completion(.success(account))
        } else {
            completion(.failure(NSError(domain: "LoginError", code: 401, userInfo: [NSLocalizedDescriptionKey: "Sai thong tin"])))
        }
    }
    
    func getUserInfo(completion: @escaping (Result<(Account, Bool), Error>) -> Void) {
        let isRememberMeSelected = UserDefaults.standard.bool(forKey: "rememberMe")
        
        guard isRememberMeSelected,
              let username = UserDefaults.standard.string(forKey: "username"),
              let password = UserDefaults.standard.string(forKey: "password"),
              let account = self.mockAccounts.first(where: {
                  $0.username == username && $0.password == password
              }) else {
            completion(.failure(NSError(domain: "UserInfoError", code: 404, userInfo: [NSLocalizedDescriptionKey: "Not Found"])))
            return
        }

        completion(.success((account, isRememberMeSelected)))
    }
}
