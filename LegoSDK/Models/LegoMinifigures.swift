import Foundation

public struct LegoMinifigures: Codable, Hashable {
    public let count: Int
    public let next: URL?
    public let previous: URL?
    public let results: [LegoMinifigure]

    public init(count: Int, next: URL?, previous: URL?, results: [LegoMinifigure]) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
    }
}
