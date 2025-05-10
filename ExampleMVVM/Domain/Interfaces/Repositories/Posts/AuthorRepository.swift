//
//  AuthorRepository.swift
//  ExampleMVVM
//
//  Created by V002822 on 4/21/25.
//

// AuthorRepository.swift
protocol AuthorRepository {
    func fetchAuthors(completion: @escaping ([Author]) -> Void)
}
