//
//  Author.swift
//  ExampleMVVM
//
//  Created by V002822 on 4/21/25.
//

import Foundation

struct Author {
    let name: String
    let content: String
    let isActive: Bool
    let thumbnailImage: String?
}

extension Author {
    static func mockData() -> [Author] {
        return [
            Author(
                name: "Phạm Văn Thể Thao",
                content: "1.2M followers",
                isActive: true,
                thumbnailImage: "https://randomuser.me/api/portraits/men/1.jpg"
            ),
            Author(
                name: "Nguyễn Chính Trị",
                content: "890K followers",
                isActive: true,
                thumbnailImage: "https://randomuser.me/api/portraits/men/2.jpg"
            ),
            Author(
                name: "Trần Doanh Nhân",
                content: "750K followers",
                isActive: true,
                thumbnailImage: "https://randomuser.me/api/portraits/men/3.jpg"
            ),
            Author(
                name: "Lê Sức Khoẻ",
                content: "2.1M followers",
                isActive: false,
                thumbnailImage: "https://randomuser.me/api/portraits/women/1.jpg"
            ),
            Author(
                name: "Hoàng Du Lịch",
                content: "1.7M followers",
                isActive: true,
                thumbnailImage: "https://randomuser.me/api/portraits/men/4.jpg"
            ),
            Author(
                name: "Bùi Khoa Học",
                content: "950K followers",
                isActive: true,
                thumbnailImage: "https://randomuser.me/api/portraits/men/5.jpg"
            ),
            Author(
                name: "Đặng Châu Âu",
                content: "1.3M followers",
                isActive: false,
                thumbnailImage: "https://randomuser.me/api/portraits/women/2.jpg"
            )
        ]
    }
}
