//
//  AuthorListItemViewModel.swift
//  ExampleMVVM
//
//  Created by V002822 on 4/21/25.
//

// AuthorListItemViewModel.swift
import Foundation

struct AuthorListItemViewModel {
    let name: String
    let content: String
    let isActive: Bool
    let thumbnailImage: String?

    init(author: Author) {
        self.name = author.name
        self.content = author.content
        self.isActive = author.isActive
        self.thumbnailImage = author.thumbnailImage
    }
}
