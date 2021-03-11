import Foundation

struct Endpoint {
    private static let scheme = "https://"
    private static let rebrickableHostName = "rebrickable.com"
    private static let apiLegoV3 = "/api/v3/lego"
    private static let baseUrl = scheme + rebrickableHostName + apiLegoV3

    static let colors = baseUrl + "/colors/"
    static let elements = baseUrl + "/elements/"
    static let minifigs = baseUrl + "/minifigs/"
    static let partCategories = baseUrl + "/part_categories/"
    static let parts = baseUrl + "/parts/"
    static let sets = baseUrl + "/sets/"
    static let themes = baseUrl + "/themes/"

    static let token = baseUrl + "/_token/"

    static func color(with id: Int) -> String {
        colors + "\(id)/"
    }
    
    static func elements(with id: String) -> String {
        elements + "\(id)/"
    }

    static func minifig(with setNum: String) -> String {
        minifigs + "\(setNum)/"
    }

    static func minifigParts(with setNum: String) -> String {
        minifig(with: setNum) + "parts/"
    }

    static func minifigSets(with setNum: String) -> String {
        minifig(with: setNum) + "sets/"
    }

    static func partCategory(with id: Int) -> String {
        partCategories + "\(id)/"
    }

    static func part(with partNum: String) -> String {
        parts + "\(partNum)/"
    }

    static func partColors(partNum: String) -> String {
        parts + "\(partNum)" + "/colors/"
    }

    static func set(partNum: String, colorId: String) -> String {
        partColors(partNum: partNum) + "\(colorId)" + "/sets/"
    }

    static func set(setNum: String) -> String {
        sets + "\(setNum)/"
    }

    static func inventoryMinifigs(with setNum: String) -> String {
        set(setNum: setNum) + "/minifigs/"
    }

    static func inventoryParts(with setNum: String) -> String {
        set(setNum: setNum) + "/parts/"
    }

    static func theme(with id: Int) -> String {
        themes + "\(id)/"
    }
}
