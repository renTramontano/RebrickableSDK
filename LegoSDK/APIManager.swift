import Foundation
import Combine

final class APIManager {
    private var cancellable: AnyCancellable?
    private var userToken: String?

    public func userAuthentication(username: String, password: String) {
        let httpBodyParameters = ["username": username, "password": password]
        cancellable = makeRequest(to: Endpoint.getUserToken.toUrl, httpBody: httpBodyParameters, withHttpMethod: .post)
            .map { $0.data }
            .decode(type: String.self, decoder: JSONDecoder())
            .sink(receiveCompletion: { _ in },
                  receiveValue: { self.userToken = $0 })
    }
    
    public func makeRequest(to url: URL, httpBody parameters: [String: String] = [:], withHttpMethod httpMethod: HttpMethod) -> URLSession.DataTaskPublisher {
        let urlRequest = prepareRequest(with: url, parameters: parameters, httpMethod: httpMethod)
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
    }

    private func prepareRequest(with url: URL, parameters: [String: String], httpMethod: HttpMethod) -> URLRequest {
        var urlReqest = URLRequest(url: url)
        urlReqest.httpMethod = httpMethod.rawValue
        urlReqest.setValue("application/json", forHTTPHeaderField: "Accept")
        // TODO: REMOVE
        urlReqest.setValue("key \(userToken ?? "262a544a78e1cbca7f70541ce6e6bc2c")", forHTTPHeaderField: "Authorization")
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
