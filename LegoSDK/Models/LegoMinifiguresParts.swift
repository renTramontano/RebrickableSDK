import Foundation

public struct LegoMinifiguresParts: Codable, Hashable {
    public let count: Int
    public let next: URL?
    public let previous: URL?
    public let results: [LegoMinifiguresPart]

    public init(count: Int, next: URL?, previous: URL?, results: [LegoMinifiguresPart]) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
    }
}
