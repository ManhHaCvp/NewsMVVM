////
////  TopicListViewModel.swift
////  ExampleMVVM
////
////  Created by V002822 on 4/21/25.
////
//
//final class TopicListViewModel {
//    private let useCase: TopicUseCase
//    private var allTopics: [Topic] = []
//    private var filteredTopics: [Topic] = []
//
//    var onUpdate: (() -> Void)?
//
//    init(useCase: TopicUseCase) {
//        self.useCase = useCase
//    }
//
//    func fetchTopics() {
//        useCase.fetchTopics { [weak self] topics in
//            guard let self = self else { return }
//            self.allTopics = topics
//            self.filteredTopics = topics
//            print("Fetched topics: \(topics)") 
//            self.onUpdate?()
//        }
//    }
//
//    func filterActiveTopics() {
//        filteredTopics = allTopics.filter { $0.isActive }
//        onUpdate?()
//    }
//
//    var topicCount: Int {
//        return filteredTopics.count
//    }
//
//    func topicItem(at index: Int) -> TopicListItemViewModel {
//        guard index >= 0 && index < filteredTopics.count else {
//            fatalError("Index out of range")
//        }
//        return TopicListItemViewModel(topic: filteredTopics[index])
//    }
//}
