import Foundation

@main
struct DemoCancellation {
  static func main() async {
    let worker = Task(priority: .userInitiated) {
      do {
        for i in 1...10 {
          try Task.checkCancellation()
          print("work step \(i)")
          try await Task.sleep(nanoseconds: 200_000_000)
        }
        return "completed"
      } catch is CancellationError {
        return "cancelled"
      } catch {
        return "failed: \(error)"
      }
    }

    // Cancel after ~0.6s
    Task {
      try? await Task.sleep(nanoseconds: 600_000_000)
      worker.cancel()
    }

    let result = await worker.value
    print("worker result:", result)
  }
}
