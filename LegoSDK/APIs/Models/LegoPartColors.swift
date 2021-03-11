import Foundation

public struct LegoPartColors: Codable, Hashable {
    public let count: Int
    public let next: URL?
    public let previous: URL?
    public let results: [LegoPartColor]

    public init(count: Int, next: URL?, previous: URL?, results: [LegoPartColor]) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
    }
}
