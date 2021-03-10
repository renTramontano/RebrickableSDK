import Foundation

public struct LegoPartCategory: Codable, Hashable {
    public let id: Int
    public let name: String
    public let part_count: Int
    
    public init(id: Int, name: String, part_count: Int) {
        self.id = id
        self.name = name
        self.part_count = part_count
    }
}
