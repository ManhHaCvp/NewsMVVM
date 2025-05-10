//
//  TopicListItemViewModel.swift
//  ExampleMVVM
//
//  Created by V002822 on 4/21/25.
//

import Foundation

struct TopicListItemViewModel {
    let title: String
    let content: String
    let isActive: Bool
    let thumbnailImageURL: String?

    init(topic: Topic) {
        self.title = topic.title
        self.content = topic.content
        self.isActive = topic.isActive
        self.thumbnailImageURL = topic.thumbnailImage
    }
}
