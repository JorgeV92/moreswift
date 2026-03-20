import Foundation

func listPhotos(inGallery name: String) async throws -> [String] {
    try await Task.sleep(for: .seconds(2))
    return ["IMG001", "IMG99", "IMG0404"]
}

let photos = try await listPhotos(inGallery: "A Rainy Weekend")

let handle = FileHandle.standardInput
for try await line in handle.bytes.lines {
    print(line)
}
