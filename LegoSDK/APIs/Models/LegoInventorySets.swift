import Foundation

public struct LegoInventorySets: Codable, Hashable {
    public let count: Int
    public let next: URL?
    public let previous: URL?
    public let results: [LegoInventorySet]

    public init(count: Int, next: URL?, previous: URL?, results: [LegoInventorySet]) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
    }
}
