import Foundation

public struct LegoThemes: Codable, Hashable {
    public let count: Int
    public let next: URL?
    public let previous: URL?
    public let results: [LegoTheme]
    
    public init(count: Int, next: URL?, previous: URL?, results: [LegoTheme]) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
    }
}
