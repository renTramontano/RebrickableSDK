import Foundation

public struct LegoPart: Codable, Hashable {
    public let part_num: String
    public let name: String
    public let part_cat_id: Int
    public let part_url: URL
    public let part_img_url: URL?
    public let external_ids: [String: [String]]
    public let print_of: String?
    
    public init(part_num: String, name: String, part_cat_id: Int, part_url: URL, part_img_url: URL?, external_ids: [String: [String]], print_of: String?) {
        self.part_num = part_num
        self.name = name
        self.part_cat_id = part_cat_id
        self.part_url = part_url
        self.part_img_url = part_img_url
        self.external_ids = external_ids
        self.print_of = print_of
    }
}
