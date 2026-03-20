import Foundation

struct User: Sendable, CustomStringConvertible {
  let id: Int
  let name: String
  var description: String { "User(id: \(id), name: \(name))" }
}

enum DemoError: Error { case notFound }

func fetchUser(id: Int) async throws -> User {
  try await Task.sleep(nanoseconds: 200_000_000) // 0.2s
  if id == 404 { throw DemoError.notFound }
  return User(id: id, name: "User\(id)")
}

@main
struct DemoAsyncLet {
  static func main() async {
    do {
      async let a = fetchUser(id: 1)
      async let b = fetchUser(id: 2)

      // Await both as a tuple so the work stays parallel.
      let (userA, userB) = try await (a, b)
      print([userA, userB])
    } catch {
      print("error:", error)
    }
  }
}
