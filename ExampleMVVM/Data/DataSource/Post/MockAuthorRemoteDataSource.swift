//
//  MockAuthorRemoteDataSource.swift
//  ExampleMVVM
//
//  Created by V002822 on 4/21/25.
//


protocol AuthorRemoteDataSource {
    func fetchAuthors(completion: @escaping ([Author]) -> Void)
}

// MockAuthorRemoteDataSource.swift
import Foundation

final class MockAuthorRemoteDataSource: AuthorRemoteDataSource {
    func fetchAuthors(completion: @escaping ([Author]) -> Void) {
        let authors = Author.mockData() 
        completion(authors)
    }
}
