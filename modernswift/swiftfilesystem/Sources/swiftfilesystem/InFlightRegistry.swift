import Foundation

@available(macOS 13.0, *)
actor InFlightRegistry {
    private var tasks: [String: Task<Data, Error>] = [:]

    func data(
        forKey key: String,
        create: @escaping @Sendable () async throws -> Data 
    ) async throws -> Data {
        if let existing = tasks[key] {
            return try await existing.value
        }

        let task = Task {
            try await create() 
        }
        tasks[key] = task

        defer { tasks[key] = nil }

        return try await task.value
    }
}