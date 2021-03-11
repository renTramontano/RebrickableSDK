import Foundation

struct Endpoint {
    private static let scheme = "https://"
    private static let rebrickableHostName = "rebrickable.com"
    private static let apiLegoV3 = "/api/v3/lego"
    private static let base = scheme + rebrickableHostName + apiLegoV3
    private static let baseUrl = URL(string: base)!

    static let colors = "colors"
    static let elements = "elements"
    static let minifigs = "minifigs"
    static let partCategories = "part_categories"
    static let parts = "parts"
    static let sets = "sets"
    static let themes = "themes"
    static let token = "_token"

    static let colorsUrl = baseUrl.appendingPath(colors)
    static let elementsUrl = baseUrl.appendingPath(elements)
    static let minifigsUrl = baseUrl.appendingPath(minifigs)
    static let partCategoriesUrl = baseUrl.appendingPath(partCategories)
    static let partsUrl = baseUrl.appendingPath(parts)
    static let setsUrl = baseUrl.appendingPath(sets)
    static let themesUrl = baseUrl.appendingPath(themes)

    static let tokenUrl = baseUrl.appendingPath(token)

    static func color(with id: Int) -> URL {
        colorsUrl.appendingPath("\(id)")
    }
    
    static func elements(with id: String) -> URL {
        elementsUrl.appendingPath("\(id)")
    }

    static func minifig(with setNum: String) -> URL {
        minifigsUrl.appendingPath("\(setNum)")
    }

    static func minifigParts(with setNum: String) -> URL {
        minifig(with: setNum).appendingPath(parts)
    }

    static func minifigSets(with setNum: String) -> URL {
        minifig(with: setNum).appendingPath(sets)
    }

    static func partCategory(with id: Int) -> URL {
        partCategoriesUrl.appendingPath("\(id)")
    }

    static func part(with partNum: String) -> URL {
        partsUrl.appendingPath("\(partNum)")
    }

    static func partColors(partNum: String) -> URL {
        part(with: partNum).appendingPath(colors)
    }

    static func set(partNum: String, colorId: String) -> URL {
        partColors(partNum: partNum)
            .appendingPath("\(colorId)")
            .appendingPath(sets)
    }

    static func set(setNum: String) -> URL {
        setsUrl.appendingPath("\(setNum)")
    }

    static func inventoryMinifigs(with setNum: String) -> URL {
        set(setNum: setNum).appendingPath(minifigs)
    }

    static func inventoryParts(with setNum: String) -> URL {
        set(setNum: setNum).appendingPath(parts)
    }

    static func theme(with id: Int) -> URL {
        themesUrl.appendingPath("\(id)")
    }
}

fileprivate extension URL {
    func appendingPath(_ path: String) -> URL {
        appendingPathComponent(path, isDirectory: true)
    }
}
