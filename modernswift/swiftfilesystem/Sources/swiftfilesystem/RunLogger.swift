import Foundation

actor RunLogger {
    struct Counters: Sendable {
        var cacheHits: Int = 0
        var cacheMisses: Int = 0
        var downloads: Int = 0
        var bytesDownloaded: Int = 0
    }

    private let startedAt = Date()
    private var counters = Counters()

    func log(_ message: String) {
        let elapsed = Date().timeIntervalSince(startedAt)
        let prefix = String(format: "[%7.2fs]", elapsed)
        print("\(prefix) \(message)")
    }

    func recordCacheHit(key: String) {
        counters.cacheHits += 1
        log("CACHE HIT \(key)")
    }

    func recordCacheMiss(key: String) {
        counters.cacheMisses += 1
        log("CACHE MISS \(key)")
    }

    func recordDownload(key: String, bytes: Int) {
        counters.downloads += 1
        counters.bytesDownloaded += bytes
        log("DOWNLOADED \(key) (\(bytes) bytes)")
    }

    func summary() {
        log("SUMMARY: cacheHits=\(counters.cacheHits), cacheMisses=\(counters.cacheMisses), downloads=\(counters.downloads), bytesDownloaded=\(counters.bytesDownloaded)")
    }
}