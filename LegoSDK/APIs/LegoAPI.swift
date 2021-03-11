import Foundation
import Combine

public final class LegoAPI {
    private var apiManger: APIManager

    public init(apiKey: String) {
        apiManger = APIManager(apiKey: apiKey)
    }

    public func getLegoColors() -> AnyPublisher<LegoColors, LegoError> {
        get(endpoint: Endpoint.colors.toUrl)
    }

    public func getLegoColor(with id: Int) -> AnyPublisher<LegoColor, LegoError> {
        get(endpoint: Endpoint.color(with: id).toUrl)
    }

    public func getLegoElement(with id: String) -> AnyPublisher<LegoElement, LegoError> {
        get(endpoint: Endpoint.elements(with: id).toUrl)
    }

    public func getLegoMinifigures() -> AnyPublisher<LegoSets, LegoError> {
        get(endpoint: Endpoint.minifigs.toUrl)
    }

    public func getLegoMinifigureDetails(with figNum: String) -> AnyPublisher<LegoSet, LegoError> {
        get(endpoint: Endpoint.minifig(with: figNum).toUrl)
    }

    public func getLegoMinifigureParts(with figNum: String) -> AnyPublisher<LegoInventoryParts, LegoError> {
        get(endpoint: Endpoint.minifigParts(with: figNum).toUrl)
    }

    public func getLegoSets(with figNum: String) -> AnyPublisher<LegoSets, LegoError> {
        get(endpoint: Endpoint.minifigSets(with: figNum).toUrl)
    }

    public func getLegoPartCategories() -> AnyPublisher<LegoPartCategories, LegoError> {
        get(endpoint: Endpoint.partCategories.toUrl)
    }

    public func getLegoPartCategory(with id: Int) -> AnyPublisher<LegoPartCategory, LegoError> {
        get(endpoint: Endpoint.partCategory(with: id).toUrl)
    }

    public func getLegoParts() -> AnyPublisher<LegoParts, LegoError> {
        get(endpoint: Endpoint.parts.toUrl)
    }

    public func getLegoPart(with id: String) -> AnyPublisher<LegoPart, LegoError> {
        get(endpoint: Endpoint.part(with: id).toUrl)
    }

    public func getPartColors(with partNum: String) -> AnyPublisher<LegoPartColors, LegoError> {
        get(endpoint: Endpoint.partColors(partNum: partNum).toUrl)
    }

    public func getSets(partNum: String, colorID: String) -> AnyPublisher<LegoSets, LegoError> {
        get(endpoint: Endpoint.set(partNum: partNum, colorId: colorID).toUrl)
    }

    public func getLegoSets() -> AnyPublisher<LegoSets, LegoError> {
        get(endpoint: Endpoint.sets.toUrl)
    }

    public func getLegoSet(with setNum: String) -> AnyPublisher<LegoSet, LegoError> {
        get(endpoint: Endpoint.set(setNum: setNum).toUrl)
    }

    public func getLegoInventoryMinifigs(with setNum: String) -> AnyPublisher<LegoInventorySets, LegoError> {
        get(endpoint: Endpoint.inventoryMinifigs(with: setNum).toUrl)
    }

    public func getLegoInventoryParts(with setNum: String) -> AnyPublisher<LegoInventoryParts, LegoError> {
        get(endpoint: Endpoint.inventoryParts(with: setNum).toUrl)
    }

    public func getLegoThemes() -> AnyPublisher<LegoThemes, LegoError> {
        get(endpoint: Endpoint.themes.toUrl)
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
