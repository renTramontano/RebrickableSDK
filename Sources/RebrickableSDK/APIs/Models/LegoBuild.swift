import Foundation

public struct LegoBuild: Codable, Hashable {
    public let user: Int
    public let inventory: Int
    public let num_missing: Int
    public let num_ignored: Int
    public let num_owned_less_ignored: Int
    public let total_parts: Int
    public let total_parts_less_ignored: Int

    public init(user: Int, inventory: Int, num_missing: Int, num_ignored: Int, num_owned_less_ignored: Int, total_parts: Int, total_parts_less_ignored: Int) {
        self.user = user
        self.inventory = inventory
        self.num_missing = num_missing
        self.num_ignored = num_ignored
        self.num_owned_less_ignored = num_owned_less_ignored
        self.total_parts = total_parts
        self.total_parts_less_ignored = total_parts_less_ignored
    }
}
