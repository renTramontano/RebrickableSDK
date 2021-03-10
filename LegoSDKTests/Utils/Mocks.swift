import Foundation
import LegoSDK

extension Int {
    static func mock() -> Int {
        return Int.random(in: 0...100)
    }
}

extension Bool {
    static func mock() -> Bool {
        return Bool.random()
    }
}

extension URL {
    static func mock(string: String = String.mock()) -> URL {
        return URL(string: string)!
    }
}

extension String {
    static func mock() -> String {
        UUID().uuidString
    }
}

extension LegoColors {
    static func mock() -> LegoColors {
        LegoColors(count: Int.mock(),
                   next: URL.mock(),
                   previus: URL.mock(),
                   results: [LegoColor.mock()])
    }
}

extension LegoColor {
    static func mock() -> LegoColor {
        LegoColor(id: Int.mock(),
                  name: String.mock(),
                  is_trans: Bool.mock())
    }
}

extension LegoElement {
    static func mock() -> LegoElement {
        LegoElement(part: LegoPart.mock(),
                    color: LegoColor.mock(),
                    element_id: String.mock(),
                    design_id: String.mock(),
                    element_img_url: URL.mock(),
                    part_img_url: URL.mock())
    }
}

extension LegoSets {
    static func mock() -> LegoSets {
        LegoSets(count: Int.mock(),
                 next: URL.mock(),
                 previous: URL.mock(),
                 results: [LegoSet.mock()])
    }
}

extension LegoSet {
    static func mock() -> LegoSet {
        LegoSet(set_num: String.mock(),
                name: String.mock(),
                year: Int.mock(),
                theme_id: Int.mock(),
                num_parts: Int.mock(),
                set_img_url: URL.mock(),
                set_url: URL.mock(),
                last_modified_dt: String.mock())
    }
}

extension LegoPartCategories {
    static func mock() -> LegoPartCategories {
        LegoPartCategories(count: Int.mock(),
                           next: URL.mock(),
                           previous: URL.mock(),
                           results: [LegoPartCategory.mock()])
    }
}

extension LegoPartCategory {
    static func mock() -> LegoPartCategory {
        LegoPartCategory(id: Int.mock(),
                         name: String.mock(),
                         part_count: Int.mock())
    }
}

extension LegoParts {
    static func mock() -> LegoParts {
        LegoParts(count: Int.mock(),
                  next: URL.mock(),
                  previous: URL.mock(),
                  results: [LegoPart.mock()])
    }
}

extension LegoPart {
    static func mock() -> LegoPart {
        LegoPart(part_num: String.mock(),
                 name: String.mock(),
                 part_cat_id: Int.mock(),
                 part_url: URL.mock(),
                 part_img_url: URL.mock(),
                 external_ids: [:],
                 print_of: String.mock())
    }
}

extension LegoInventoryParts {
    static func mock() -> LegoInventoryParts {
        LegoInventoryParts(count: Int.mock(),
                           next: URL.mock(),
                           previous: URL.mock(),
                           results: [LegoInventoryPart.mock()])
    }
}

extension LegoInventoryPart {
    static func mock() -> LegoInventoryPart {
        LegoInventoryPart(id: Int.mock(),
                          inv_part_id: Int.mock(),
                          part: LegoPart.mock(),
                          color: LegoColor.mock(),
                          set_num: String.mock(),
                          quantity: Int.mock(),
                          is_spare: Bool.mock(),
                          element_id: String.mock(),
                          num_sets: Int.mock())
    }
}

extension LegoThemes {
    static func mock() -> LegoThemes {
        LegoThemes(count: Int.mock(),
                   next: URL.mock(),
                   previous: URL.mock(),
                   results: [LegoTheme.mock()])
    }
}

extension LegoTheme {
    static func mock() -> LegoTheme {
        LegoTheme(id: Int.mock(),
                  parent_id: Int.mock(),
                  name: String.mock())
    }
}
