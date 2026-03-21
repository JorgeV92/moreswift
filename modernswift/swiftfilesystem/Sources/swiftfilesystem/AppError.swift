import Foundation

enum AppError: Error, CustomStringConvertible {
    case helpRequested
    case invalidArgument(String)

    case nonHTTPResponse(url: URL)
    case httpStatus(code: Int, url: URL, bodySnippet: String?)

    case networkFailed(url: URL, underlying: Error)
    case decodingFailed(typeName: String, url: URL, underlying: Error)

    case cacheDirectoryCreationFailed(url: URL, underlying: Error)
    case cacheReadFailed(url: URL, underlying: Error)
    case cacheWriteFailed(url: URL, underlying: Error)
    case cacheDeleteFailed(url: URL, underlying: Error)

    var description: String {
        switch self {
        case .helpRequested:
            return "Help requested."

        case .invalidArgument(let message):
            return "Invalid argument: \(message)"

        case .nonHTTPResponse(let url):
            return "Expected HTTPURLResponse but got a non-HTTP response for \(url.absoluteString)"

        case .httpStatus(let code, let url, let bodySnippet):
            let snippetInfo = bodySnippet.map { "\nBody snippet:\n\($0)" } ?? ""
            return "HTTP \(code) for \(url.absoluteString)\(snippetInfo)"

        case .networkFailed(let url, let underlying):
            return "Network request failed for \(url.absoluteString): \(underlying)"

        case .decodingFailed(let typeName, let url, let underlying):
            return "Decoding failed for \(typeName) from \(url.absoluteString): \(underlying)"

        case .cacheDirectoryCreationFailed(let url, let underlying):
            return "Failed to create cache directory \(url.path): \(underlying)"

        case .cacheReadFailed(let url, let underlying):
            return "Failed to read cache file \(url.path): \(underlying)"

        case .cacheWriteFailed(let url, let underlying):
            return "Failed to write cache file \(url.path): \(underlying)"

        case .cacheDeleteFailed(let url, let underlying):
            return "Failed to delete cache file \(url.path): \(underlying)"
        }
    }
}
