import Foundation
import Combine

final class APIManager {
    public func makeRequest(to url: URL, httpBody parameters: [String: String] = [:], withHttpMethod httpMethod: HttpMethod) -> URLSession.DataTaskPublisher {
        let urlRequest = prepareRequest(with: url, parameters: parameters, httpMethod: httpMethod)
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
    }

    private func prepareRequest(with url: URL, parameters: [String: String], httpMethod: HttpMethod) -> URLRequest {
        var urlReqest = URLRequest(url: url)
        urlReqest.httpMethod = httpMethod.rawValue
        urlReqest.setValue("key 262a544a78e1cbca7f70541ce6e6bc2c", forHTTPHeaderField: "Authorization")
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
        case post = "PUT"
    }
}
