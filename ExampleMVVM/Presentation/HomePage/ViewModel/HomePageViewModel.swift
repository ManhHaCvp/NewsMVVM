final class HomePageViewModel {
    private let useCase: PostUseCase
    private(set) var allPosts: [Post] = []
//    private(set) var trendingPost: Post?
//    private var filteredPosts: [Post] = []

    var category: Observable<[String]> = Observable([])
    var filteredPosts: Observable<[Post]> = Observable([])
    var trendingPost: Observable<Post?> = Observable(.none)

    init(useCase: PostUseCase) {
        self.useCase = useCase
    }

    func fetchPosts() {
        useCase.fetchPosts { [weak self] posts in
            guard let self = self else { return }

            self.allPosts = posts
            self.trendingPost.value = posts.first(where: { $0.isTrending == true })
            self.filteredPosts.value = posts
            
            // Extract unique categories 
            let uniqueCategories = Set(posts.map { $0.category }).sorted()
            self.category.value = ["All"] + uniqueCategories
        }
    }

    func filterPosts(by category: String) {
        if category == "All" {
            filteredPosts.value = allPosts
        } else {
            filteredPosts.value = allPosts.filter { $0.category == category }
        }
    }
    
    func listPostItem(at index: Int) -> HomePageItemViewModel {
        guard index >= 0 && index < filteredPosts.value.count else {
            fatalError("Index out of range in listPostItem: \(index)")
        }
        return HomePageItemViewModel(post: filteredPosts.value[index])
    }

}
