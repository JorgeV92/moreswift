import Foundation

enum JSONPlaceholderAPI {
    static let baseURL = URL(string: "https://jsonplaceholder.typicode.com")!

    enum Limits {
        static let posts = 100
        static let users = 10
        static let comments = 500
    }

    static func post(id: Int) -> URL {
        baseURL 
            .appendingPathComponent("posts")
            .appendingPathComponent(String(id))
    }

    static func user(id: Int) -> URL {
        baseURL
            .appendingPathComponent("users")
            .appendingPathComponent(String(id))
    }

    static func comment(id: Int) -> URL {
        baseURL
            .appendingPathComponent("comments")
            .appendingPathComponent(String(id))
    }
}