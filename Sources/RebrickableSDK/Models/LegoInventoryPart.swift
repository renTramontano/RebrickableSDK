import Foundation

public struct LegoInventoryPart: Hashable, Codable {
    public let id: Int
    public let inv_part_id: Int
    public let part: LegoPart
    public let color: LegoColor
    public let set_num: String
    public let quantity: Int
    public let is_spare: Bool
    public let element_id: String?
    public let num_sets: Int
    
    public init(id: Int, inv_part_id: Int, part: LegoPart, color: LegoColor, set_num: String, quantity: Int, is_spare: Bool, element_id: String?, num_sets: Int) {
        self.id = id
        self.inv_part_id = inv_part_id
        self.part = part
        self.color = color
        self.set_num = set_num
        self.quantity = quantity
        self.is_spare = is_spare
        self.element_id = element_id
        self.num_sets = num_sets
    }
}
