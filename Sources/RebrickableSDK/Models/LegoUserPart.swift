import Foundation

public struct LegoUserPart: Codable, Hashable {
    public let quantity: Int
    public let part: LegoPart
    public let color: LegoColor

    public init(quantity: Int, part: LegoPart, color: LegoColor) {
        self.quantity = quantity
        self.part = part
        self.color = color
    }
}
