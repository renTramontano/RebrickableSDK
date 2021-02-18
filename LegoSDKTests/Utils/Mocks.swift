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

extension LegoMinifigures {
    static func mock() -> LegoMinifigures {
        LegoMinifigures(count: Int.mock(),
                        next: URL.mock(),
                        previous: URL.mock(),
                        results: [LegoMinifigure.mock()])
    }
}

extension LegoMinifigure {
    static func mock() -> LegoMinifigure {
        LegoMinifigure(set_num: String.mock(),
                       name: String.mock(),
                       num_parts: Int.mock(),
                       set_img_url: URL.mock(),
                       set_url: URL.mock(),
                       last_modified_dt: String.mock())
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
