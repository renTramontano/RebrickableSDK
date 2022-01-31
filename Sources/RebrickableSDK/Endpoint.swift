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
    static let users = "users"
    static let allParts = "allparts"
    static let build = "build"
    static let lostParts = "lost_parts"

    static let colorsUrl = baseUrl.appendingDirPath(colors)
    static let elementsUrl = baseUrl.appendingDirPath(elements)
    static let minifigsUrl = baseUrl.appendingDirPath(minifigs)
    static let partCategoriesUrl = baseUrl.appendingDirPath(partCategories)
    static let partsUrl = baseUrl.appendingDirPath(parts)
    static let setsUrl = baseUrl.appendingDirPath(sets)
    static let themesUrl = baseUrl.appendingDirPath(themes)

    static let tokenUrl = baseUrl.appendingDirPath(token)
    static let usersUrl = baseUrl.appendingDirPath(users)

    static func colors(page: Int?, pageSize: Int?) -> URL {
        colorsUrl
            .appendingQueryItem(name: "page", value: page)
            .appendingQueryItem(name: "page_size", value: pageSize)
    }

    static func color(with id: Int) -> URL {
        colorsUrl.appendingDirPath("\(id)")
    }

    static func element(with id: String) -> URL {
        elementsUrl.appendingDirPath("\(id)")
    }

    static func minifigs(inSetNum: String?, inThemeId: String?, page: Int?, pageSize: Int?) -> URL {
        minifigsUrl
            .appendingQueryItem(name: "in_set_num", value: inSetNum)
            .appendingQueryItem(name: "in_theme_id", value: inThemeId)
            .appendingQueryItem(name: "page", value: page)
            .appendingQueryItem(name: "page_size", value: pageSize)
    }

    static func minifig(with figNum: String) -> URL {
        minifigsUrl.appendingDirPath("\(figNum)")
    }

    static func minifigParts(figNum: String, page: Int?, pageSize: Int?) -> URL {
        minifigsUrl
            .appendingDirPath("\(figNum)")
            .appendingDirPath(parts)
            .appendingQueryItem(name: "page", value: page)
            .appendingQueryItem(name: "page_size", value: pageSize)
    }

    static func minifigSets(figNum: String, page: Int?, pageSize: Int?) -> URL {
        minifigsUrl
            .appendingDirPath("\(figNum)")
            .appendingDirPath(sets)
            .appendingQueryItem(name: "page", value: page)
            .appendingQueryItem(name: "page_size", value: pageSize)
    }

    static func partCategories(page: Int?, pageSize: Int?) -> URL {
        partCategoriesUrl
            .appendingQueryItem(name: "page", value: page)
            .appendingQueryItem(name: "page_size", value: pageSize)
    }

    static func partCategory(with id: Int) -> URL {
        partCategoriesUrl.appendingDirPath("\(id)")
    }

    static func part(with partNum: String) -> URL {
        partsUrl.appendingDirPath("\(partNum)")
    }

    static func partColors(partNum: String, page: Int?, pageSize: Int?) -> URL {
        partsUrl
            .appendingDirPath("\(partNum)")
            .appendingDirPath(colors)
            .appendingQueryItem(name: "page", value: page)
            .appendingQueryItem(name: "page_size", value: pageSize)
    }

    static func sets(themeId: String?, page: Int?, pageSize: Int?) -> URL {
        setsUrl
            .appendingQueryItem(name: "theme_id", value: themeId)
            .appendingQueryItem(name: "page", value: page)
            .appendingQueryItem(name: "page_size", value: pageSize)
    }

    static func set(partNum: String, colorId: String, page: Int?, pageSize: Int?) -> URL {
        partsUrl
            .appendingDirPath("\(partNum)")
            .appendingDirPath(colors)
            .appendingDirPath("\(colorId)")
            .appendingDirPath(sets)
            .appendingQueryItem(name: "page", value: page)
            .appendingQueryItem(name: "page_size", value: pageSize)
    }

    static func set(setNum: String) -> URL {
        setsUrl.appendingDirPath("\(setNum)")
    }

    static func inventoryMinifigs(setNum: String, page: Int?, pageSize: Int?) -> URL {
        setsUrl
            .appendingDirPath("\(setNum)")
            .appendingDirPath(minifigs)
            .appendingQueryItem(name: "page", value: page)
            .appendingQueryItem(name: "page_size", value: pageSize)
    }

    static func inventoryParts(setNum: String, page: Int?, pageSize: Int?) -> URL {
        setsUrl
            .appendingDirPath("\(setNum)")
            .appendingDirPath(parts)
            .appendingQueryItem(name: "page", value: page)
            .appendingQueryItem(name: "page_size", value: pageSize)
    }

    static func themes(page: Int?, pageSize: Int?) -> URL {
        themesUrl
            .appendingQueryItem(name: "page", value: page)
            .appendingQueryItem(name: "page_size", value: pageSize)
    }

    static func theme(with id: Int) -> URL {
        themesUrl.appendingDirPath("\(id)")
    }

    static func allParts(token: String, page: Int?, pageSize: Int?) -> URL {
        usersUrl
            .appendingDirPath(token)
            .appendingDirPath(allParts)
            .appendingQueryItem(name: "page", value: page)
            .appendingQueryItem(name: "page_size", value: pageSize)
    }

    static func build(token: String, setNum: String) -> URL {
        usersUrl
            .appendingDirPath(token)
            .appendingDirPath(build)
            .appendingDirPath(setNum)
    }

    static func lostParts(token: String, page: Int?, pageSize: Int?) -> URL {
        usersUrl
            .appendingDirPath(token)
            .appendingDirPath(lostParts)
            .appendingQueryItem(name: "page", value: page)
            .appendingQueryItem(name: "page_size", value: pageSize)
    }
}
