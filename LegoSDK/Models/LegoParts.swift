import Foundation

public struct LegoParts: Codable, Hashable {
    public let count: Int
    public let next: URL?
    public let previous: URL?
    public let results: [LegoPart]

    public init(count: Int, next: URL?, previous: URL?, results: [LegoPart]) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
    }
}
