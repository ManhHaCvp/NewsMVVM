import Foundation

final class SearchPageViewModel {
    private let postUseCase: PostUseCase
    private let topicUseCase: TopicUseCase
    private let authorUseCase: AuthorUseCase

    // fetch data each tab
    private(set) var allPosts: [Post] = []
    private(set) var allTopics: [Topic] = []
    private(set) var allAuthors: [Author] = []

    var filteredPosts: Observable<[Post]> = Observable([])
    var filteredTopics: Observable<[Topic]> = Observable([])
    var filteredAuthors: Observable<[Author]> = Observable([])

    var selectedTab: SearchTab = .news
    var onUpdate: (() -> Void)?

    // UseCase
    init(postUseCase: PostUseCase, topicUseCase: TopicUseCase, authorUseCase: AuthorUseCase) {
        self.postUseCase = postUseCase
        self.topicUseCase = topicUseCase
        self.authorUseCase = authorUseCase
    }

    // fetch data
    func fetchAllData() {
        fetchPosts()
        fetchTopics()
        fetchAuthors()
    }

    private func fetchPosts() {
        postUseCase.fetchPosts { [weak self] posts in
            guard let self = self else { return }
            self.allPosts = posts
            self.filteredPosts.value = posts
            self.onUpdate?()
        }
    }

    private func fetchTopics() {
        topicUseCase.fetchTopics { [weak self] topics in
            guard let self = self else { return }
            self.allTopics = topics
            self.filteredTopics.value = topics
            self.onUpdate?()
        }
    }

    private func fetchAuthors() {
        authorUseCase.fetchAuthors { [weak self] authors in
            guard let self = self else { return }
            self.allAuthors = authors
            self.filteredAuthors.value = authors
            self.onUpdate?()
        }
    }

    // Filter data
    func search(text: String) {
        switch selectedTab {
        case .news:
            filteredPosts.value = text.isEmpty ? allPosts : allPosts.filter {
                $0.title.localizedCaseInsensitiveContains(text)
            }
        case .topics:
            filteredTopics.value = text.isEmpty ? allTopics : allTopics.filter {
                $0.title.localizedCaseInsensitiveContains(text)
            }
        case .author:
            filteredAuthors.value = text.isEmpty ? allAuthors : allAuthors.filter {
                $0.name.localizedCaseInsensitiveContains(text)
            }
        }
        onUpdate?()
    }

    // Return number item
    func numberOfItems(in tab: SearchTab) -> Int {
        switch tab {
        case .news:
            return filteredPosts.value.count
        case .topics:
            return filteredTopics.value.count
        case .author:
            return filteredAuthors.value.count
        }
    }

    func item(at index: Int, in tab: SearchTab) -> Any? {
        switch tab {
        case .news:
            guard index < filteredPosts.value.count else { return nil }
            return filteredPosts.value[index]
        case .topics:
            guard index < filteredTopics.value.count else { return nil }
            return filteredTopics.value[index]
        case .author:
            guard index < filteredAuthors.value.count else { return nil }
            return filteredAuthors.value[index]
        }
    }
}



