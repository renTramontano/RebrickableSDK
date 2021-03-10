import Foundation

public struct LegoSet: Codable, Hashable {
    public let set_num: String
    public let name: String
    public let year: Int?
    public let theme_id: Int?
    public let num_parts: Int
    public let set_img_url: URL?
    public let set_url: URL?
    public let last_modified_dt: String
    
    public init(set_num: String, name: String, year: Int?, theme_id: Int?, num_parts: Int, set_img_url: URL?, set_url: URL?, last_modified_dt: String) {
        self.set_num = set_num
        self.name = name
        self.year = year
        self.theme_id = theme_id
        self.num_parts = num_parts
        self.set_img_url = set_img_url
        self.set_url = set_url
        self.last_modified_dt = last_modified_dt
    }
}
