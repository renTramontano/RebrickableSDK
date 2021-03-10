import Foundation
import Combine

public final class LegoAPI {
    private var apiManger: APIManager

    public init(apiKey: String) {
        apiManger = APIManager(apiKey: apiKey)
    }

    public func getLegoColors() -> AnyPublisher<LegoColors, LegoError> {
        apiManger.makeRequest(to: Endpoint.colors.toUrl, withHttpMethod: .get)
            .map { $0.data }
            .decode(type: LegoColors.self, decoder: JSONDecoder())
            .mapToLegoError()
            .eraseToAnyPublisher()
    }

    public func getLegoColor(with id: Int) -> AnyPublisher<LegoColor, LegoError> {
        apiManger.makeRequest(to: Endpoint.color(with: id).toUrl, withHttpMethod: .get)
            .map { $0.data }
            .decode(type: LegoColor.self, decoder: JSONDecoder())
            .mapToLegoError()
            .eraseToAnyPublisher()
    }

    public func getLegoElement(with id: String) -> AnyPublisher<LegoElement, LegoError> {
        apiManger.makeRequest(to: Endpoint.elements(with: id).toUrl, withHttpMethod: .get)
            .map { $0.data }
            .decode(type: LegoElement.self, decoder: JSONDecoder())
            .mapToLegoError()
            .eraseToAnyPublisher()
    }

    public func getLegoMinifigures() -> AnyPublisher<LegoSets, LegoError> {
        apiManger.makeRequest(to: Endpoint.minifigs.toUrl, withHttpMethod: .get)
            .map { $0.data }
            .decode(type: LegoSets.self, decoder: JSONDecoder())
            .mapToLegoError()
            .eraseToAnyPublisher()
    }

    public func getLegoMinifigureDetails(with figNum: String) -> AnyPublisher<LegoSet, LegoError> {
        apiManger.makeRequest(to: Endpoint.minifig(with: figNum).toUrl, withHttpMethod: .get)
            .map { $0.data }
            .decode(type: LegoSet.self, decoder: JSONDecoder())
            .mapToLegoError()
            .eraseToAnyPublisher()
    }

    public func getLegoMinifigureParts(with figNum: String) -> AnyPublisher<LegoInventoryParts, LegoError> {
        apiManger.makeRequest(to: Endpoint.minifigParts(with: figNum).toUrl, withHttpMethod: .get)
            .map { $0.data }
            .decode(type: LegoInventoryParts.self, decoder: JSONDecoder())
            .mapToLegoError()
            .eraseToAnyPublisher()
    }

    public func getLegoSets(with figNum: String) -> AnyPublisher<LegoSets, LegoError> {
        apiManger.makeRequest(to: Endpoint.minifigSets(with: figNum).toUrl, withHttpMethod: .get)
            .map { $0.data }
            .decode(type: LegoSets.self, decoder: JSONDecoder())
            .mapToLegoError()
            .eraseToAnyPublisher()
    }

    public func getLegoPartCategories() -> AnyPublisher<LegoPartCategories, LegoError> {
        apiManger.makeRequest(to: Endpoint.partCategories.toUrl, withHttpMethod: .get)
            .map { $0.data }
            .decode(type: LegoPartCategories.self, decoder: JSONDecoder())
            .mapToLegoError()
            .eraseToAnyPublisher()
    }

    public func getLegoPartCategory(with id: Int) -> AnyPublisher<LegoPartCategory, LegoError> {
        apiManger.makeRequest(to: Endpoint.partCategory(with: id).toUrl, withHttpMethod: .get)
            .map { $0.data }
            .decode(type: LegoPartCategory.self, decoder: JSONDecoder())
            .mapToLegoError()
            .eraseToAnyPublisher()
    }

    public func getLegoParts() -> AnyPublisher<LegoParts, LegoError> {
        apiManger.makeRequest(to: Endpoint.parts.toUrl, withHttpMethod: .get)
            .map { $0.data }
            .decode(type: LegoParts.self, decoder: JSONDecoder())
            .mapToLegoError()
            .eraseToAnyPublisher()
    }

    public func getLegoSets() -> AnyPublisher<LegoSets, LegoError> {
        apiManger.makeRequest(to: Endpoint.sets.toUrl, withHttpMethod: .get)
            .map { $0.data }
            .decode(type: LegoSets.self, decoder: JSONDecoder())
            .mapToLegoError()
            .eraseToAnyPublisher()
    }

    public func getLegoThemes() -> AnyPublisher<LegoThemes, LegoError> {
        apiManger.makeRequest(to: Endpoint.themes.toUrl, withHttpMethod: .get)
            .map { $0.data }
            .decode(type: LegoThemes.self, decoder: JSONDecoder())
            .mapToLegoError()
            .eraseToAnyPublisher()
    }

    public func getLegoTheme(with id: Int) -> AnyPublisher<LegoTheme, LegoError> {
        apiManger.makeRequest(to: Endpoint.theme(with: id).toUrl, withHttpMethod: .get)
            .map { $0.data }
            .decode(type: LegoTheme.self, decoder: JSONDecoder())
            .mapToLegoError()
            .eraseToAnyPublisher()
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
