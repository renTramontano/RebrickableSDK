import Foundation

public struct LegoInventorySet: Hashable, Codable {
    public let id: Int
    public let set_num: String
    public let set_name: String
    public let quantity: Int
    public let set_img_url: URL?

    public init(id: Int, set_num: String, set_name: String, quantity: Int, set_img_url: URL?) {
        self.id = id
        self.set_num = set_num
        self.set_name = set_name
        self.quantity = quantity
        self.set_img_url = set_img_url
    }
}
