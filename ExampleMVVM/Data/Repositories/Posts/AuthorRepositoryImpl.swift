//
//  AuthorRepositoryImpl.swift
//  ExampleMVVM
//
//  Created by V002822 on 4/21/25.
//

// AuthorRepositoryImpl.swift
import Foundation

final class AuthorRepositoryImpl: AuthorRepository {
    private let remoteDataSource: AuthorRemoteDataSource

    init(remoteDataSource: AuthorRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    func fetchAuthors(completion: @escaping ([Author]) -> Void) {
        remoteDataSource.fetchAuthors { authors in
            completion(authors)
        }
    }
}
