import Foundation 

struct Post: Codable, Sendable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

struct Comment: Codable, Sendable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}

struct User: Codable, Sendable {
    struct Address: Codable, Sendable {
        struct Geo: Codable, Sendable {
            let lat: String
            let lng: String
        }

        let street: String
        let suite: String
        let city: String
        let zipcode: String
        let geo: Geo
    }

    struct Company: Codable, Sendable {
        let name: String
        let catchPhrase: String
        let bs: String
    }

    let id: Int
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone: String
    let website: String
    let company: Company
}