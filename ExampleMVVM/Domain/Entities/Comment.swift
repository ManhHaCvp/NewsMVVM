//
//  Comment.swift
//  ExampleMVVM
//
//  Created by V002822 on 5/9/25.
//

import Foundation

struct CommentItem {
    let id: UUID
    let imageURL: String?
    let message: String
    let name: String
    let time: Date
}

extension CommentItem {
    static func mockData() -> [CommentItem] {
        return [
            CommentItem(
                id: UUID(),
                imageURL: "https://randomuser.me/api/portraits/men/11.jpg",
                message: "Great article on climate change!",
                name: "John Doe",
                time: Date(year: 2025, month: 5, day: 8, hour: 10, minute: 15, second: 0)
            ),
            CommentItem(
                id: UUID(),
                imageURL: "https://randomuser.me/api/portraits/women/22.jpg",
                message: "Thanks for sharing this news.",
                name: "Jane Smith",
                time: Date(year: 2025, month: 5, day: 8, hour: 9, minute: 45, second: 0)
            ),
            CommentItem(
                id: UUID(),
                imageURL: nil,
                message: "I disagree with the author.",
                name: "Alex Johnson",
                time: Date(year: 2025, month: 5, day: 7, hour: 14, minute: 30, second: 0)
            )
        ]
    }
}


