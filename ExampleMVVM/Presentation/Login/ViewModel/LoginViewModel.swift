//
//  LoginViewModel.swift
//  ExampleMVVM
//
//  Created by V002822 on 4/15/25.
//

import Foundation

class LoginViewModel {
    var username: Observable<String?> = Observable(nil)
    var password: Observable<String?> = Observable(nil)
    var rememberMe: Observable<Bool> = Observable(false)
    var isLoginSuccess: Observable<Bool> = Observable(false)
    var errorUsernameMessage: Observable<String?> = Observable(nil)
    var errorPasswordMessage: Observable<String?> = Observable(nil)

    private let loginUseCase: LoginUseCase
    private let getUserInfoUseCase: GetUserInfoUseCase
    
    init(loginUseCase: LoginUseCase, getUserInfoUseCase: GetUserInfoUseCase) {
        self.loginUseCase = loginUseCase
        self.getUserInfoUseCase = getUserInfoUseCase

    }

    func login() {
        loginUseCase.execute(username: self.username.value ?? "", password: self.password.value ?? "", rememberMe: self.rememberMe.value) { [weak self] result in
            switch result {
            case .success(_):
                self?.isLoginSuccess.value = true
            case .failure:
                self?.isLoginSuccess.value = false
            }
        }
    }

    func getUserInfo() {
        getUserInfoUseCase.execute { [weak self] result in
            switch result {
            case .success(let (account, rememberMe)):
                self?.username.value = account.username
                self?.password.value = account.password
                self?.rememberMe.value = rememberMe
            case .failure:
                print("User info not found.")
                break
            }
        }
    }

    func updateUsername(_ username: String) {
        self.username.value = username
    }
    
    func updatePassword(_ password: String) {
        self.password.value = password
    }
    
    func updateRememberMe(_ rememberMe: Bool) {
        self.rememberMe.value = rememberMe
    }
}




//print("Account found: \(account.username)")
