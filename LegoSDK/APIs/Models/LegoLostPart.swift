import Foundation

public struct LegoLostPart: Hashable, Codable {
    public let lost_part_id: Int
    public let lost_quantity: Int
    public let inv_part: LegoInventoryPart

    public init(lost_part_id: Int, lost_quantity: Int, inv_part: LegoInventoryPart) {
        self.lost_part_id = lost_part_id
        self.lost_quantity = lost_quantity
        self.inv_part = inv_part
    }
}
