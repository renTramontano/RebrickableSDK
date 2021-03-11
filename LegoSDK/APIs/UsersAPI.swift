import Foundation
import Combine

public final class UsersAPI {
    private var apiManger: APIManager
    private var userToken: String?
    private var bag = Set<AnyCancellable>()
    
    public init(apiKey: String) {
        apiManger = APIManager(apiKey: apiKey)
    }
    
    public func userAuthentication(username: String, password: String) {
        let httpBodyParameters = ["username": username, "password": password]
        apiManger.makeRequest(to: Endpoint.tokenUrl, httpBody: httpBodyParameters, withHttpMethod: .post)
            .map { $0.data }
            .decode(type: String.self, decoder: JSONDecoder())
            .mapToLegoError()
            .sink(receiveCompletion: { _ in },
                  receiveValue: { self.userToken = $0 })
            .store(in: &bag)
    }
}
