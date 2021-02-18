import Foundation

struct Endpoint {
    private static let scheme = "https://"
    private static let rebrickableHostName = "rebrickable.com"
    private static let apiLegoV3 = "/api/v3/lego"
    private static let baseUrl = scheme + rebrickableHostName + apiLegoV3

    static let getLegoColors = baseUrl + "/colors/"
    static let getLegoSets = baseUrl + "/sets/"
    static let getLegoMinifigures = baseUrl + "/minifigs/"
}
