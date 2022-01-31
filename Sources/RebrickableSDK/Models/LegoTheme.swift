import Foundation

public struct LegoTheme: Codable, Hashable {
    public let id: Int
    public let parent_id: Int?
    public let name: String
    
    public init(id: Int, parent_id: Int?, name: String) {
        self.id = id
        self.parent_id = parent_id
        self.name = name
    }
}
