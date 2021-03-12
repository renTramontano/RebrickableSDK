import Foundation

struct Endpoint {
    static let scheme = "https://"
    static let rebrickableHostName = "rebrickable.com"
    static let apiLegoV3 = "/api/v3/lego"
    static let base = scheme + rebrickableHostName + apiLegoV3
    static let baseUrl = URL(string: base)!

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

    static func colors(page: Int?, pageSize: Int?) -> URL {
        colorsUrl
            .appendingQueryItem(name: "page", value: page)
            .appendingQueryItem(name: "page_size", value: pageSize)
    }

    static func color(with id: Int) -> URL {
        colorsUrl.appendingPath("\(id)")
    }
    
    static func element(with id: String) -> URL {
        elementsUrl.appendingPath("\(id)")
    }

    static func minifigs(page: Int?, pageSize: Int?) -> URL {
        minifigsUrl
            .appendingQueryItem(name: "page", value: page)
            .appendingQueryItem(name: "page_size", value: pageSize)
    }

    static func minifig(figNum: String, page: Int?, pageSize: Int?) -> URL {
        minifigsUrl
            .appendingPath("\(figNum)")
            .appendingQueryItem(name: "page", value: page)
            .appendingQueryItem(name: "page_size", value: pageSize)
    }

    static func minifigParts(figNum: String, page: Int?, pageSize: Int?) -> URL {
        minifigsUrl
            .appendingPath("\(figNum)")
            .appendingPath(parts)
            .appendingQueryItem(name: "page", value: page)
            .appendingQueryItem(name: "page_size", value: pageSize)
    }

    static func minifigSets(figNum: String, page: Int?, pageSize: Int?) -> URL {
        minifigsUrl
            .appendingPath("\(figNum)")
            .appendingPath(sets)
            .appendingQueryItem(name: "page", value: page)
            .appendingQueryItem(name: "page_size", value: pageSize)
    }

    static func partCategories(page: Int?, pageSize: Int?) -> URL {
        partCategoriesUrl
            .appendingQueryItem(name: "page", value: page)
            .appendingQueryItem(name: "page_size", value: pageSize)
    }

    static func partCategory(with id: Int) -> URL {
        partCategoriesUrl.appendingPath("\(id)")
    }

    static func part(with partNum: String) -> URL {
        partsUrl.appendingPath("\(partNum)")
    }

    static func partColors(partNum: String, page: Int?, pageSize: Int?) -> URL {
        partsUrl
            .appendingPath("\(partNum)")
            .appendingPath(colors)
            .appendingQueryItem(name: "page", value: page)
            .appendingQueryItem(name: "page_size", value: pageSize)
    }

    static func sets(page: Int?, pageSize: Int?) -> URL {
        setsUrl
            .appendingQueryItem(name: "page", value: page)
            .appendingQueryItem(name: "page_size", value: pageSize)
    }

    static func set(partNum: String, colorId: String, page: Int?, pageSize: Int?) -> URL {
        partsUrl
            .appendingPath("\(partNum)")
            .appendingPath("\(colorId)")
            .appendingPath(sets)
            .appendingQueryItem(name: "page", value: page)
            .appendingQueryItem(name: "page_size", value: pageSize)
    }

    static func set(setNum: String) -> URL {
        setsUrl.appendingPath("\(setNum)")
    }

    static func inventoryMinifigs(setNum: String, page: Int?, pageSize: Int?) -> URL {
        setsUrl
            .appendingPath("\(setNum)")
            .appendingPath(minifigs)
            .appendingQueryItem(name: "page", value: page)
            .appendingQueryItem(name: "page_size", value: pageSize)
    }

    static func inventoryParts(setNum: String, page: Int?, pageSize: Int?) -> URL {
        setsUrl
            .appendingPath("\(setNum)")
            .appendingPath(parts)
            .appendingQueryItem(name: "page", value: page)
            .appendingQueryItem(name: "page_size", value: pageSize)
    }

    static func themes(page: Int?, pageSize: Int?) -> URL {
        themesUrl
            .appendingQueryItem(name: "page", value: page)
            .appendingQueryItem(name: "page_size", value: pageSize)
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
