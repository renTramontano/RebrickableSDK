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
    public enum HttpMethod: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case patch = "PATCH"
        case delete = "DELETE"
    }
}
