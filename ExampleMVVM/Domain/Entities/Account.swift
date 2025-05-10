import Foundation

struct Account {
    let username: String?
    let password: String?
    let token: String?
    let fullName: String?
    
    init(username: String? = nil, password: String? = nil, token: String? = nil, fullName: String? = nil) {
        self.username = username
        self.password = password
        self.token = token
        self.fullName = fullName
    }
}
