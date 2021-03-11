import Foundation

public struct LegoPartColor: Codable, Hashable {
    public let color_id: Int
    public let color_name: String
    public let num_sets: Int
    public let num_set_parts: Int
    public let part_img_url: URL?
    
    public init(color_id: Int, color_name: String, num_sets: Int, num_set_parts: Int, part_img_url: URL?) {
        self.color_id = color_id
        self.color_name = color_name
        self.num_sets = num_sets
        self.num_set_parts = num_set_parts
        self.part_img_url = part_img_url
        
    }
}
