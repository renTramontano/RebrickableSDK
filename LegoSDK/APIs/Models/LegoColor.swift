import Foundation

public struct LegoColor: Codable, Hashable {
    public let id: Int
    public let name: String?
    public let is_trans: Bool
    
    public init(id: Int, name: String?, is_trans: Bool) {
        self.id = id
        self.name = name
        self.is_trans = is_trans
    }
}
