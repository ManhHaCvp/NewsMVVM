//
//  AuthorUseCaseImpl.swift
//  ExampleMVVM
//
//  Created by V002822 on 4/21/25.
//

protocol AuthorUseCase {
    func fetchAuthors(completion: @escaping ([Author]) -> Void)
}

// AuthorUseCaseImpl.swift
import Foundation

final class AuthorUseCaseImpl: AuthorUseCase {
    private let repository: AuthorRepository

    init(repository: AuthorRepository) {
        self.repository = repository
    }

    func fetchAuthors(completion: @escaping ([Author]) -> Void) {
        repository.fetchAuthors { authors in
            completion(authors)
        }
    }
}
