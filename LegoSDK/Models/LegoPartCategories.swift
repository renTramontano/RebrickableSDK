import Foundation

public struct LegoPartCategories: Codable, Hashable {
    public let count: Int
    public let next: URL?
    public let previous: URL?
    public let results: [LegoPartCategory]

    public init(count: Int, next: URL?, previous: URL?, results: [LegoPartCategory]) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
    }
}
