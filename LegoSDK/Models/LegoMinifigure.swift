import Foundation

public struct LegoMinifigure: Hashable, Codable {
    public let set_num: String
    public let name: String
    public let num_parts: Int
    public let set_img_url: URL?
    public let set_url: URL?
    public let last_modified_dt: String

    public init(set_num: String, name: String, num_parts: Int, set_img_url: URL?, set_url: URL?, last_modified_dt: String) {
        self.set_num = set_num
        self.name = name
        self.num_parts = num_parts
        self.set_img_url = set_img_url
        self.set_url = set_url
        self.last_modified_dt = last_modified_dt
    }
}
