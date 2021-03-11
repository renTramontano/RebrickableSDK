import Foundation
import Combine

public final class LegoAPI {
    private var apiManger: APIManager

    public init(apiKey: String) {
        apiManger = APIManager(apiKey: apiKey)
    }

    public func getLegoColors(page: Int? = nil, pageSize: Int? = nil) -> AnyPublisher<PageResponse<LegoColor>, LegoError> {
        get(endpoint: Endpoint.colors.toUrl.appending(page: page, pageSize: pageSize))
    }

    public func getLegoColor(with id: Int) -> AnyPublisher<LegoColor, LegoError> {
        get(endpoint: Endpoint.color(with: id).toUrl)
    }

    public func getLegoElement(with id: String) -> AnyPublisher<LegoElement, LegoError> {
        get(endpoint: Endpoint.elements(with: id).toUrl)
    }

    public func getLegoMinifigures(page: Int? = nil, pageSize: Int? = nil) -> AnyPublisher<PageResponse<LegoSet>, LegoError> {
        get(endpoint: Endpoint.minifigs.toUrl.appending(page: page, pageSize: pageSize))
    }

    public func getLegoMinifigureDetails(with figNum: String, page: Int? = nil, pageSize: Int? = nil) -> AnyPublisher<LegoSet, LegoError> {
        get(endpoint: Endpoint.minifig(with: figNum).toUrl.appending(page: page, pageSize: pageSize))
    }

    public func getLegoMinifigureParts(with figNum: String, page: Int? = nil, pageSize: Int? = nil) -> AnyPublisher<PageResponse<LegoInventoryPart>, LegoError> {
        get(endpoint: Endpoint.minifigParts(with: figNum).toUrl.appending(page: page, pageSize: pageSize))
    }

    public func getLegoSets(with figNum: String, page: Int? = nil, pageSize: Int? = nil) -> AnyPublisher<PageResponse<LegoSet>, LegoError> {
        get(endpoint: Endpoint.minifigSets(with: figNum).toUrl.appending(page: page, pageSize: pageSize))
    }

    public func getLegoPartCategories(page: Int? = nil, pageSize: Int? = nil) -> AnyPublisher<PageResponse<LegoPartCategory>, LegoError> {
        get(endpoint: Endpoint.partCategories.toUrl.appending(page: page, pageSize: pageSize))
    }

    public func getLegoPartCategory(with id: Int) -> AnyPublisher<LegoPartCategory, LegoError> {
        get(endpoint: Endpoint.partCategory(with: id).toUrl)
    }

    public func getLegoParts() -> AnyPublisher<PageResponse<LegoPart>, LegoError> {
        get(endpoint: Endpoint.parts.toUrl)
    }

    public func getLegoPart(with id: String) -> AnyPublisher<LegoPart, LegoError> {
        get(endpoint: Endpoint.part(with: id).toUrl)
    }

    public func getPartColors(with partNum: String, page: Int? = nil, pageSize: Int? = nil) -> AnyPublisher<PageResponse<LegoPartColor>, LegoError> {
        get(endpoint: Endpoint.partColors(partNum: partNum).toUrl.appending(page: page, pageSize: pageSize))
    }

    public func getSets(partNum: String, colorID: String, page: Int? = nil, pageSize: Int? = nil) -> AnyPublisher<PageResponse<LegoSet>, LegoError> {
        get(endpoint: Endpoint.set(partNum: partNum, colorId: colorID).toUrl.appending(page: page, pageSize: pageSize))
    }

    public func getLegoSets() -> AnyPublisher<PageResponse<LegoSet>, LegoError> {
        get(endpoint: Endpoint.sets.toUrl)
    }

    public func getLegoSet(with setNum: String) -> AnyPublisher<LegoSet, LegoError> {
        get(endpoint: Endpoint.set(setNum: setNum).toUrl)
    }

    public func getLegoInventoryMinifigs(with setNum: String, page: Int? = nil, pageSize: Int? = nil) -> AnyPublisher<PageResponse<LegoInventorySet>, LegoError> {
        get(endpoint: Endpoint.inventoryMinifigs(with: setNum).toUrl.appending(page: page, pageSize: pageSize))
    }

    public func getLegoInventoryParts(with setNum: String, page: Int? = nil, pageSize: Int? = nil) -> AnyPublisher<PageResponse<LegoInventoryPart>, LegoError> {
        get(endpoint: Endpoint.inventoryParts(with: setNum).toUrl.appending(page: page, pageSize: pageSize))
    }

    public func getLegoThemes(page: Int? = nil, pageSize: Int? = nil) -> AnyPublisher<PageResponse<LegoTheme>, LegoError> {
        get(endpoint: Endpoint.themes.toUrl.appending(page: page, pageSize: pageSize))
    }

    public func getLegoTheme(with id: Int) -> AnyPublisher<LegoTheme, LegoError> {
        get(endpoint: Endpoint.theme(with: id).toUrl)
    }
}

extension LegoAPI {
    private func get<T: Codable>(endpoint: URL) -> AnyPublisher<T, LegoError> {
        apiManger.makeRequest(to: endpoint, withHttpMethod: .get)
            .map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapToLegoError()
            .eraseToAnyPublisher()
    }
}

fileprivate extension URL {
    func appending(page: Int?, pageSize: Int?) -> URL {
        self.appendingQueryItem(name: "page", value: page)
            .appendingQueryItem(name: "page_size", value: pageSize)
    }
}
