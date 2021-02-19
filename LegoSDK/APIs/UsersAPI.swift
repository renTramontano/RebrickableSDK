import Foundation
import Combine

public final class UsersAPI {
    private var apiManger: APIManager
    private var cancellable: AnyCancellable?
    private var userToken: String?

    public init(apiKey: String) {
        apiManger = APIManager(apiKey: apiKey)
    }
    
    public func userAuthentication(username: String, password: String) {
        let httpBodyParameters = ["username": username, "password": password]
        cancellable = apiManger.makeRequest(to: Endpoint.getUserToken.toUrl, httpBody: httpBodyParameters, withHttpMethod: .post)
            .map { $0.data }
            .decode(type: String.self, decoder: JSONDecoder())
            .sink(receiveCompletion: { _ in },
                  receiveValue: { self.userToken = $0 })
    }
}
