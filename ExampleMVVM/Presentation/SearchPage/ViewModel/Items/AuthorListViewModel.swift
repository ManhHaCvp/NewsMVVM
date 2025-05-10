////
////  AuthorListViewModel.swift
////  ExampleMVVM
////
////  Created by V002822 on 4/21/25.
////
//
//// AuthorListViewModel.swift
//import Foundation
//
//final class AuthorListViewModel {
//    private let useCase: AuthorUseCase
//    private var allAuthors: [Author] = []
//    private var filteredAuthors: [Author] = []
//
//    var onUpdate: (() -> Void)?
//
//    init(useCase: AuthorUseCase) {
//        self.useCase = useCase
//    }
//
//    func fetchAuthors() {
//        useCase.fetchAuthors { [weak self] authors in
//            guard let self = self else { return }
//            self.allAuthors = authors
//            self.filteredAuthors = authors
//            self.onUpdate?()
//        }
//    }
//
//    func filterActiveAuthors() {
//        filteredAuthors = allAuthors.filter { $0.isActive }
//        onUpdate?()
//    }
//
//    var authorCount: Int {
//        return filteredAuthors.count
//    }
//
//    func authorItem(at index: Int) -> AuthorListItemViewModel {
//        guard index >= 0 && index < filteredAuthors.count else {
//            fatalError("Index out of range")
//        }
//        return AuthorListItemViewModel(author: filteredAuthors[index])
//    }
//}
