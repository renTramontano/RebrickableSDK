import Foundation
import Combine

public class LegoApi {
    private var apiManger = APIManager()

    public init() {}

    public func getLegoSets() -> AnyPublisher<LegoSets, Error> {
        apiManger.makeRequest(to: Endpoint.getLegoSets.toUrl.appendingKey(), withHttpMethod: .get)
            .map { $0.data }
            .decode(type: LegoSets.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

    public func getLegoColors() -> AnyPublisher<LegoColors, Error> {
        apiManger.makeRequest(to: Endpoint.getLegoColors.toUrl.appendingKey(), withHttpMethod: .get)
            .map { $0.data }
            .decode(type: LegoColors.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

    public func getLegoMinifigures() -> AnyPublisher<LegoMinifigures, Error> {
        apiManger.makeRequest(to: Endpoint.getLegoMinifigures.toUrl.appendingKey(), withHttpMethod: .get)
            .map { $0.data }
            .decode(type: LegoMinifigures.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
