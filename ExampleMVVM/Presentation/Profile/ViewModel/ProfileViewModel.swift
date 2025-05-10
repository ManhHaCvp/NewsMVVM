//
//  ProfileViewModel.swift
//  ExampleMVVM
//
//  Created by V002822 on 5/5/25.
//

class ProfileViewModel {
    private let postUseCase: PostUseCase

    var posts: Observable<[Post]> = Observable([])

    init(postUseCase: PostUseCase) {
        self.postUseCase = postUseCase
    }

    func fetchPosts() {
        postUseCase.fetchPosts { [weak self] posts in
            self?.posts.value = posts
        }
    }

    func numberOfItems() -> Int {
        return posts.value.count
    }

    func item(at index: Int) -> Post {
        return posts.value[index]
    }
}
