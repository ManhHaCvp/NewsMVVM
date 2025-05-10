//
//  Topic.swift
//  ExampleMVVM
//
//  Created by V002822 on 4/21/25.
//

import Foundation

struct Topic {
    let title: String
    let content: String
    let isActive: Bool
    let thumbnailImage: String?
}


extension Topic {
    static func mockData() -> [Topic] {
        return [
            Topic(
                title: "Sports",
                content: "Các bài viết liên quan đến thể thao và sự kiện thể thao toàn cầu",
                isActive: false,
                thumbnailImage: "https://bna.1cdn.vn/2025/04/17/67ffd8bd85f54015075b2e0c.jpg"
            ),
            Topic(
                title: "Politics",
                content: "Thông tin chính trị, hội nghị và phân tích chiến lược",
                isActive: false,
                thumbnailImage: "https://bna.1cdn.vn/2025/04/17/67ffd8bd85f54015075b2e0c.jpg"
            ),
            Topic(
                title: "Business",
                content: "Tin tức kinh doanh, thị trường và tài chính",
                isActive: false,
                thumbnailImage: "https://bna.1cdn.vn/2025/04/17/67ffd8bd85f54015075b2e0c.jpg"
            ),
            Topic(
                title: "Health",
                content: "Lời khuyên sức khỏe, nghiên cứu y học và chăm sóc cơ thể",
                isActive: false,
                thumbnailImage: "https://bna.1cdn.vn/2025/04/17/67ffd8bd85f54015075b2e0c.jpg"
            ),
            Topic(
                title: "Travel",
                content: "Gợi ý du lịch, kinh nghiệm và điểm đến hấp dẫn",
                isActive: true,
                thumbnailImage: "https://bna.1cdn.vn/2025/04/17/67ffd8bd85f54015075b2e0c.jpg"
            ),
            Topic(
                title: "Science",
                content: "Khám phá khoa học, vũ trụ và công nghệ mới",
                isActive: true,
                thumbnailImage: "https://bna.1cdn.vn/2025/04/17/67ffd8bd85f54015075b2e0c.jpg"
            ),
            Topic(
                title: "Europe",
                content: "Thông tin và sự kiện tại các quốc gia châu Âu",
                isActive: false,
                thumbnailImage: "https://bna.1cdn.vn/2025/04/17/67ffd8bd85f54015075b2e0c.jpg"
            )
        ]
    }
}
