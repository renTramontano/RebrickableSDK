import Foundation

public struct LegoSets: Codable, Hashable {
    public let count: Int
    public let next: URL?
    public let previous: URL?
    public let results: [LegoSet]
    
    public init(count: Int, next: URL?, previous: URL?, results: [LegoSet]) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
    }
}
