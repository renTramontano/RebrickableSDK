import Foundation

public struct LegoColors: Codable, Hashable {
    public let count: Int
    public let next: URL?
    public let previus: URL?
    public let results: [LegoColor]
    
    public init(count: Int, next: URL?, previus: URL?, results: [LegoColor]) {
        self.count = count
        self.next = next
        self.previus = previus
        self.results = results
    }
}
