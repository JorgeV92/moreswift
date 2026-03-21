import Foundation 

struct CLIOptions: Sendable {
    var posts: Int = 20
    var users: Int = 10
    var comments: Int = 40

    var ttlSeconds: Int = 600

    var forceRefresh: Bool = false

    init(arguments: [String]) throws {
        var it = arguments.dropFirst().makeIterator()

        while let arg = it.next() {
            switch arg {
            case "--help", "-h":
                throw AppError.helpRequested

            case "--posts":
                posts = try Self.readInt(flag: arg, iterator: &it)

            case "--users":
                users = try Self.readInt(flag: arg, iterator: &it)

            case "--comments":
                comments = try Self.readInt(flag: arg, iterator: &it)

            case "--ttl":
                ttlSeconds = try Self.readInt(flag: arg, iterator: &it)

            case "--force-refresh":
                forceRefresh = true

            default:
                throw AppError.invalidArgument("Unknown flag \(arg)")
            }
        }
    }
    
    private static func readInt(
        flag: String,
        iterator: inout Array<String>.SubSequence.Iterator
    ) throws -> Int {
        guard let raw = iterator.next() else {
            throw AppError.invalidArgument("Missing value for \(flag)")
        }
        guard let value = Int(raw), value >= 0 else {
            throw AppError.invalidArgument("Expected a non-negative integer for \(flag), got \(raw)")
        }
        return value
    }
}

extension CLIOptions {
    static var usage: String {
        """
        swift-concurrency-demo

        Usage:
          swift run swift-concurrency-demo -- [options]

        Options:
          --posts <n>         Number of post IDs to fetch (default: 20)
          --users <n>         Number of user IDs to fetch (default: 10)
          --comments <n>      Number of comment IDs to fetch (default: 40)
          --ttl <seconds>     Cache TTL in seconds (default: 600)
          --force-refresh     Ignore cache and always download
          --help, -h          Show this help

        Example:
          swift run swift-concurrency-demo -- --posts 20 --users 10 --comments 50 --ttl 300
        """
    }
}