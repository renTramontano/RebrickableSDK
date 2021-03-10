import Foundation

public struct LegoElement: Codable, Hashable {
    public let part: LegoPart
    public let color: LegoColor
    public let element_id: String
    public let design_id: String
    public let element_img_url: URL?
    public let part_img_url: URL?

    public init(part: LegoPart, color: LegoColor, element_id: String, design_id: String, element_img_url: URL?, part_img_url: URL?) {
        self.part = part
        self.color = color
        self.element_id = element_id
        self.design_id = design_id
        self.element_img_url = element_img_url
        self.part_img_url = part_img_url
    }
}
