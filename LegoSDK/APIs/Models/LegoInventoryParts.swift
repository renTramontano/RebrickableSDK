import Foundation

public struct LegoInventoryParts: Codable, Hashable {
    public let count: Int
    public let next: URL?
    public let previous: URL?
    public let results: [LegoInventoryPart]
    
    public init(count: Int, next: URL?, previous: URL?, results: [LegoInventoryPart]) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
    }
}
