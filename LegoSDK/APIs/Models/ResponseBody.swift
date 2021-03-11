import Foundation

public struct ResponseBody<T: Codable & Hashable>: Codable, Hashable {
    public let count: Int
    public let next: URL?
    public let previous: URL?
    public let results: [T]

    public init(count: Int, next: URL?, previous: URL?, results: [T]) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
    }
}
