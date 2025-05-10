	//
//  NotificationItem.swift
//  ExampleMVVM
//
//  Created by V002822 on 5/8/25.
//

import Foundation

struct NotificationSection {
    let date: Date
    let items: [NotificationItem]
}

struct NotificationItem {
    let id: UUID
    let imageURL: String?
    let message: String
    let time: Date
    let isFollowed: Bool
}

extension NotificationItem {
    static func mockData() -> [NotificationItem] {
        return [
            NotificationItem(
                id: UUID(),
                imageURL: "https://randomuser.me/api/portraits/women/1.jpg",
                message: "BBC News has posted new europe news “Ukraine’s President ...”",
                time: Date(year: 2025, month: 05, day: 8, hour: 11, minute: 30, second: 0),
                isFollowed: false
            ),
            NotificationItem(
                id: UUID(),
                imageURL: "https://randomuser.me/api/portraits/women/1.jpg",
                message: "Selena Gomez is now following you",
                time: Date(year: 2025, month: 05, day: 8, hour: 11, minute: 30, second: 0),
                isFollowed: true
            ),
            NotificationItem(
                id: UUID(),
                imageURL: "https://randomuser.me/api/portraits/men/1.jpg",
                message: "Omar Merditz comment to your news “Minting Your First NFT: ...”",
                time: Date(year: 2025, month: 05, day: 7, hour: 11, minute: 30, second: 0),
                isFollowed: false
            ),
            NotificationItem(
                id: UUID(),
                imageURL: "https://randomuser.me/api/portraits/women/2.jpg",
                message: "Justin Bieber is now following you",
                time: Date(year: 2025, month: 05, day: 7, hour: 11, minute: 30, second: 0),
                isFollowed: true
            ),
            NotificationItem(
                id: UUID(),
                imageURL: "https://randomuser.me/api/portraits/women/1.jpg",
                message: "VTV News has posted new europe news “Koala's survive status in...”",
                time: Date(year: 2025, month: 05, day: 7, hour: 11, minute: 30, second: 0),
                isFollowed: false
            )
        ]
    }
}


