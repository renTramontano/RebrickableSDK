import Foundation
import Combine

final class APIManager {
    private let apiKey: String

    init(apiKey: String) {
        self.apiKey = apiKey
    }

    public func makeRequest(to url: URL, httpBody parameters: [String: String] = [:], withHttpMethod httpMethod: HttpMethod) -> URLSession.DataTaskPublisher {
        let urlRequest = prepareRequest(with: url, parameters: parameters, httpMethod: httpMethod)
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
    }

    private func prepareRequest(with url: URL, parameters: [String: String], httpMethod: HttpMethod) -> URLRequest {
        var urlReqest = URLRequest(url: url)
        urlReqest.httpMethod = httpMethod.rawValue
        urlReqest.setValue("application/json", forHTTPHeaderField: "Accept")
        urlReqest.setValue("key \(apiKey)", forHTTPHeaderField: "Authorization")
        urlReqest.httpBody = getHttpBody(with: parameters)
        return urlReqest
    }

    private func getHttpBody(with parameters: [String: String]) -> Data? {
        guard !parameters.isEmpty else { return nil }
        return try? JSONSerialization.data(withJSONObject: parameters, options: [.prettyPrinted, .sortedKeys])
    }
}

extension APIManager {
    func getItem<T: Codable>(with url: URL) -> AnyPublisher<T, LegoError> {
        makeRequest(to: url, withHttpMethod: .get)
            .map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapToLegoError()
            .eraseToAnyPublisher()
    }

    func getResults<T: Codable & Hashable>(with url: URL) -> AnyPublisher<[T], LegoError> {
        let pageResponse: AnyPublisher<PageResponse<T>, LegoError> = getItem(with: url)
        return pageResponse
            .map { $0.results }
            .eraseToAnyPublisher()
    }

    public func request<T: Codable & Hashable>(to url: URL, httpBody parameters: [String: String] = [:], withHttpMethod httpMethod: HttpMethod) -> AnyPublisher<T, LegoError> {
    makeRequest(to: Endpoint.tokenUrl, httpBody: parameters, withHttpMethod: httpMethod)
        .map { $0.data }
        .decode(type: T.self, decoder: JSONDecoder())
        .mapToLegoError()
        .eraseToAnyPublisher()
    }
}

extension APIManager {
    public enum HttpMethod: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case patch = "PATCH"
        case delete = "DELETE"
    }
}
