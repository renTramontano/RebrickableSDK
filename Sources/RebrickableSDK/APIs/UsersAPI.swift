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

    public func userAuthentication2(username: String, password: String) {
        let httpBodyParameters = ["username": username, "password": password]
        let response: AnyPublisher<String, LegoError> = apiManger.request(to: Endpoint.tokenUrl, httpBody: httpBodyParameters, withHttpMethod: .post)
        response
            .assertNoFailure()
            .receive(on: RunLoop.main)
            .sink { [unowned self] in self.userToken = $0 }
            .store(in: &bag)
    }

    public func getAllParts(page: Int? = nil, pageSize: Int? = nil) -> AnyPublisher<[LegoUserPart], LegoError> {
        apiManger.getResults(with: Endpoint.allParts(token: userToken ?? "", page: page, pageSize: pageSize))
    }

    public func getBuild(setNum: String) -> AnyPublisher<LegoBuild, LegoError> {
        apiManger.getItem(with: Endpoint.build(token: userToken ?? "", setNum: setNum))
    }

    public func getLostParts(page: Int? = nil, pageSize: Int? = nil) -> AnyPublisher<[LegoLostPart], LegoError> {
        apiManger.getResults(with: Endpoint.lostParts(token: userToken ?? "", page: page, pageSize: pageSize))
    }
}
