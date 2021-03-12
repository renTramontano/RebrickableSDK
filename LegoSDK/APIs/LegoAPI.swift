import Foundation
import Combine

public final class LegoAPI {
    private var apiManger: APIManager

    public init(apiKey: String) {
        apiManger = APIManager(apiKey: apiKey)
    }

    public func getLegoColors(page: Int? = nil, pageSize: Int? = nil) -> AnyPublisher<[LegoColor], LegoError> {
        getResults(with: Endpoint.colors(page: page, pageSize: pageSize))
    }

    public func getLegoColor(with id: Int) -> AnyPublisher<LegoColor, LegoError> {
        get(with: Endpoint.color(with: id))
    }

    public func getLegoElement(with id: String) -> AnyPublisher<LegoElement, LegoError> {
        get(with: Endpoint.element(with: id))
    }

    public func getLegoMinifigures(page: Int? = nil, pageSize: Int? = nil) -> AnyPublisher<[LegoSet], LegoError> {
        getResults(with: Endpoint.minifigs(page: page, pageSize: pageSize))
    }

    public func getLegoMinifigureDetails(figNum: String) -> AnyPublisher<LegoSet, LegoError> {
        get(with: Endpoint.minifig(with: figNum))
    }

    public func getLegoMinifigureParts(figNum: String, page: Int? = nil, pageSize: Int? = nil) -> AnyPublisher<[LegoInventoryPart], LegoError> {
        getResults(with: Endpoint.minifigParts(figNum: figNum, page: page, pageSize: pageSize))
    }

    public func getLegoSets(figNum: String, page: Int? = nil, pageSize: Int? = nil) -> AnyPublisher<[LegoSet], LegoError> {
        getResults(with: Endpoint.minifigSets(figNum: figNum, page: page, pageSize: pageSize))
    }

    public func getLegoPartCategories(page: Int? = nil, pageSize: Int? = nil) -> AnyPublisher<[LegoPartCategory], LegoError> {
        getResults(with: Endpoint.partCategories(page: page, pageSize: pageSize))
    }

    public func getLegoPartCategory(with id: Int) -> AnyPublisher<LegoPartCategory, LegoError> {
        get(with: Endpoint.partCategory(with: id))
    }

    public func getLegoParts() -> AnyPublisher<[LegoPart], LegoError> {
        getResults(with: Endpoint.partsUrl)
    }

    public func getLegoPart(with id: String) -> AnyPublisher<LegoPart, LegoError> {
        get(with: Endpoint.part(with: id))
    }

    public func getPartColors(partNum: String, page: Int? = nil, pageSize: Int? = nil) -> AnyPublisher<[LegoPartColor], LegoError> {
        getResults(with: Endpoint.partColors(partNum: partNum, page: page, pageSize: pageSize))
    }

    public func getSets(partNum: String, colorID: String, page: Int? = nil, pageSize: Int? = nil) -> AnyPublisher<[LegoSet], LegoError> {
        getResults(with: Endpoint.set(partNum: partNum, colorId: colorID, page: page, pageSize: pageSize))
    }

    public func getLegoSets(page: Int? = nil, pageSize: Int? = nil) -> AnyPublisher<[LegoSet], LegoError> {
        getResults(with: Endpoint.sets(page: page, pageSize: pageSize))
    }

    public func getLegoSet(with setNum: String) -> AnyPublisher<LegoSet, LegoError> {
        get(with: Endpoint.set(setNum: setNum))
    }

    public func getLegoInventoryMinifigs(setNum: String, page: Int? = nil, pageSize: Int? = nil) -> AnyPublisher<[LegoInventorySet], LegoError> {
        getResults(with: Endpoint.inventoryMinifigs(setNum: setNum, page: page, pageSize: pageSize))
    }

    public func getLegoInventoryParts(setNum: String, page: Int? = nil, pageSize: Int? = nil) -> AnyPublisher<[LegoInventoryPart], LegoError> {
        getResults(with: Endpoint.inventoryParts(setNum: setNum, page: page, pageSize: pageSize))
    }

    public func getLegoThemes(page: Int? = nil, pageSize: Int? = nil) -> AnyPublisher<[LegoTheme], LegoError> {
        getResults(with: Endpoint.themes(page: page, pageSize: pageSize))
    }

    public func getLegoTheme(with id: Int) -> AnyPublisher<LegoTheme, LegoError> {
        get(with: Endpoint.theme(with: id))
    }
}

extension LegoAPI {
    private func get<T: Codable>(with url: URL) -> AnyPublisher<T, LegoError> {
        apiManger.makeRequest(to: url, withHttpMethod: .get)
            .map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapToLegoError()
            .eraseToAnyPublisher()
    }

    private func getResults<T: Codable & Hashable>(with url: URL) -> AnyPublisher<[T], LegoError> {
        let pageResponse: AnyPublisher<PageResponse<T>, LegoError> = get(with: url)
        return pageResponse
            .map { $0.results }
            .eraseToAnyPublisher()
    }
}
