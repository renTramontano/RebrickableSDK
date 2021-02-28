import Foundation
import Combine

public final class LegoAPI {
    private var apiManger: APIManager

    public init(apiKey: String) {
        apiManger = APIManager(apiKey: apiKey)
    }

    public func getLegoSets() -> AnyPublisher<LegoSets, LegoError> {
        apiManger.makeRequest(to: Endpoint.sets.toUrl, withHttpMethod: .get)
            .map { $0.data }
            .decode(type: LegoSets.self, decoder: JSONDecoder())
            .mapToLegoError()
            .eraseToAnyPublisher()
    }

    public func getLegoColors() -> AnyPublisher<LegoColors, LegoError> {
        apiManger.makeRequest(to: Endpoint.colors.toUrl, withHttpMethod: .get)
            .map { $0.data }
            .decode(type: LegoColors.self, decoder: JSONDecoder())
            .mapToLegoError()
            .eraseToAnyPublisher()
    }

    public func getLegoMinifigures() -> AnyPublisher<LegoMinifigures, LegoError> {
        apiManger.makeRequest(to: Endpoint.minifigs.toUrl, withHttpMethod: .get)
            .map { $0.data }
            .decode(type: LegoMinifigures.self, decoder: JSONDecoder())
            .mapToLegoError()
            .eraseToAnyPublisher()
    }

    public func getLegoMinifigure(with setNum: String) -> AnyPublisher<LegoMinifigure, LegoError> {
        apiManger.makeRequest(to: Endpoint.minifig(with: setNum).toUrl, withHttpMethod: .get)
            .map { $0.data }
            .decode(type: LegoMinifigure.self, decoder: JSONDecoder())
            .mapToLegoError()
            .eraseToAnyPublisher()
    }

    public func getLegoMinifigureParts(with setNum: String) -> AnyPublisher<LegoMinifiguresParts, LegoError> {
        apiManger.makeRequest(to: Endpoint.minifigParts(with: setNum).toUrl, withHttpMethod: .get)
            .map { $0.data }
            .decode(type: LegoMinifiguresParts.self, decoder: JSONDecoder())
            .mapToLegoError()
            .eraseToAnyPublisher()
    }

    public func getLegoMinifigureSets(with setNum: String) -> AnyPublisher<LegoMinifigures, LegoError> {
        apiManger.makeRequest(to: Endpoint.minifigSets(with: setNum).toUrl, withHttpMethod: .get)
            .map { $0.data }
            .decode(type: LegoMinifigures.self, decoder: JSONDecoder())
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

    public func getLegoParts() -> AnyPublisher<LegoParts, LegoError> {
        apiManger.makeRequest(to: Endpoint.parts.toUrl, withHttpMethod: .get)
            .map { $0.data }
            .decode(type: LegoParts.self, decoder: JSONDecoder())
            .mapToLegoError()
            .eraseToAnyPublisher()
    }
}
