//
//  UserInfoRepository.swift
//  ExampleMVVM
//
//  Created by V002822 on 4/23/25.
//
import Foundation

protocol UserInfoRepository {
    func getUserInfo(completion: @escaping (Result<(Account, Bool), Error>) -> Void)
}
