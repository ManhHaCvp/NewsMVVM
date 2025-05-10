
import Foundation

struct Post {
    let category: String
    let title: String
    let author: String
    let time: Date
    let detail: String
    let imageURL: String?
    let channelIconName: String
    let isTrending: Bool
}

extension Post {
    static func mockData() -> [Post] {
        return [
            Post(
                category: "Sports",
                title: "Mạnh ghi bàn quyết định giúp Argentina vô địch",
                author: "Phạm Văn Thể Thao",
                time: Date(year: 2025, month: 04, day: 22, hour: 17, minute: 3, second: 30),
                detail: """
        Trong trận chung kết đầy kịch tính, Messi đã ghi bàn thắng quyết định giúp Argentina lên ngôi vô địch.Trong trận chung kết đầy kịch tính, Messi đã ghi bàn thắng quyết định giúp Argentina lên ngôi vô địch.Trong trận chung kết đầy kịch tính, Messi đã ghi bàn thắng quyết định giúp Argentina lên ngôi vô địch.

        Bàn thắng được ghi ở phút 89 sau một pha phối hợp đẹp mắt từ giữa sân, kết thúc bằng cú dứt điểm tinh tế.Bàn thắng được ghi ở phút 89 sau một pha phối hợp đẹp mắt từ giữa sân, kết thúc bằng cú dứt điểm tinh tế.Bàn thắng được ghi ở phút 89 sau một pha phối hợp đẹp mắt từ giữa sân, kết thúc bằng cú dứt điểm tinh tế.

        Người hâm mộ khắp nơi trên thế giới đã đổ ra đường ăn mừng chiến thắng lịch sử này.Người hâm mộ khắp nơi trên thế giới đã đổ ra đường ăn mừng chiến thắng lịch sử này.Người hâm mộ khắp nơi trên thế giới đã đổ ra đường ăn mừng chiến thắng lịch sử này.
    """,
                imageURL: "https://bna.1cdn.vn/2025/04/17/67ffd8bd85f54015075b2e0c.jpg",
                channelIconName: "Facebook",
                isTrending: true
            ),
            Post(
                category: "Politics",
                title: "Hội nghị thượng đỉnh G7 bàn về biến đổi khí hậu",
                author: "Nguyễn Chính Trị",
                time: Date(year: 2025, month: 04, day: 22, hour: 12, minute: 30, second: 0),
                detail: """
        Các lãnh đạo thế giới đã thống nhất hành động chống biến đổi khí hậu tại hội nghị lần này.

        Thỏa thuận mới yêu cầu các nước cắt giảm 50% lượng khí thải trước năm 2030.

        Các quốc gia đang phát triển sẽ nhận được hỗ trợ tài chính và công nghệ từ nhóm G7.
    """,
                imageURL: "https://bna.1cdn.vn/2025/04/17/67ffd8bd85f54015075b2e0c.jpg",
                channelIconName: "Facebook",
                isTrending: false
            ),
            Post(
                category: "Business",
                title: "Apple công bố doanh thu kỷ lục quý I",
                author: "Trần Doanh Nhân",
                time: Date(year: 2025, month: 04, day: 22, hour: 10, minute: 30, second: 0),
                detail: """
        Apple vừa công bố doanh thu quý I vượt xa kỳ vọng của giới phân tích phố Wall.

        Các dòng sản phẩm mới như iPhone và MacBook đã đóng góp lớn vào mức tăng trưởng này.

        Cổ phiếu Apple ngay lập tức tăng 5% sau khi báo cáo tài chính được công bố.
    """,
                imageURL: "https://bna.1cdn.vn/2025/04/17/67ffd8bd85f54015075b2e0c.jpg",
                channelIconName: "Facebook",
                isTrending: false
            ),
            Post(
                category: "Health",
                title: "5 thói quen tốt cho sức khoẻ tim mạch",
                author: "Lê Sức Khoẻ",
                time: Date(year: 2025, month: 04, day: 22, hour: 13, minute: 30, second: 0),
                detail: """
        Duy trì chế độ ăn giàu rau xanh, trái cây và giảm muối sẽ giúp bảo vệ tim mạch.

        Thường xuyên vận động tối thiểu 30 phút mỗi ngày giúp giảm nguy cơ bệnh tim.

        Kiểm soát căng thẳng và duy trì giấc ngủ đều đặn cũng đóng vai trò rất quan trọng.
    """,
                imageURL: "https://bna.1cdn.vn/2025/04/17/67ffd8bd85f54015075b2e0c.jpg",
                channelIconName: "Facebook",
                isTrending: false
            ),
            Post(
                category: "Travel",
                title: "Top 10 điểm đến không thể bỏ lỡ mùa hè này",
                author: "Hoàng Du Lịch",
                time: Date(year: 2025, month: 04, day: 22, hour: 9, minute: 30, second: 0),
                detail: """
        Maldives với những bãi biển xanh ngọc và khu nghỉ dưỡng sang trọng là lựa chọn hàng đầu.

        Paris mùa hè rực rỡ với các lễ hội ngoài trời và không khí nhộn nhịp khắp nơi.

        Santorini (Hy Lạp) nổi bật với những ngôi nhà trắng tinh khôi nhìn ra biển Aegean.
    """,
                imageURL: "https://bna.1cdn.vn/2025/04/17/67ffd8bd85f54015075b2e0c.jpg",
                channelIconName: "Facebook",
                isTrending: false
            ),
            Post(
                category: "Science",
                title: "NASA phát hiện hành tinh có thể có sự sống",
                author: "Bùi Khoa Học",
                time: Date(year: 2024, month: 12, day: 22, hour: 11, minute: 30, second: 0),
                detail: """
        Hành tinh mới mang tên Kepler-1649c được cho là có kích thước và nhiệt độ tương tự Trái Đất.

        Các nhà khoa học cho rằng đây có thể là ứng cử viên tốt nhất cho sự sống ngoài hệ mặt trời.

        NASA sẽ tiếp tục theo dõi và nghiên cứu thêm về bầu khí quyển của hành tinh này.
    """,
                imageURL: "https://bna.1cdn.vn/2025/04/17/67ffd8bd85f54015075b2e0c.jpg",
                channelIconName: "Facebook",
                isTrending: false
            ),
            Post(
                category: "Europe",
                title: "Châu Âu tăng cường hợp tác năng lượng sạch",
                author: "Đặng Châu Âu",
                time: Date(year: 2024, month: 04, day: 22, hour: 8, minute: 30, second: 0),
                detail: """
        Liên minh châu Âu vừa ký kết thỏa thuận hợp tác với nhiều quốc gia nhằm phát triển năng lượng tái tạo.

        Các dự án điện gió và năng lượng mặt trời sẽ được đẩy mạnh trong 10 năm tới.
    
        Mục tiêu của EU là đạt mức phát thải bằng 0 vào năm 2050.
    """,
                imageURL: "https://bna.1cdn.vn/2025/04/17/67ffd8bd85f54015075b2e0c.jpg",
                channelIconName: "Facebook",
                isTrending: false
            )
        ]
    }
}


extension Date {
    func timeAgoDisplay() -> String {
        let secondsAgo = Int(Date().timeIntervalSince(self))

        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        let week = 7 * day
        let month = 30 * day
        let year = 365 * day

        switch secondsAgo {
        case ..<minute:
            return "\(secondsAgo) giây trước"
        case ..<hour:
            return "\(secondsAgo / minute) phút trước"
        case ..<day:
            return "\(secondsAgo / hour) giờ trước"
        case ..<week:
            return "\(secondsAgo / day) ngày trước"
        case ..<month:
            return "\(secondsAgo / week) tuần trước"
        case ..<year:
            return "\(secondsAgo / month) tháng trước"
        default:
            return "\(secondsAgo / year) năm trước"
        }
    }
}
