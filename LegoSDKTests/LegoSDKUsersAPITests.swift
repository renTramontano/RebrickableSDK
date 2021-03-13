@testable import LegoSDK
import XCTest
import Swifter
import Combine

class LegoSDKUsersAPITests: UnitTestCase {
    private let legoApi = LegoAPI(apiKey: "262a544a78e1cbca7f70541ce6e6bc2c")
    private var cancellable: AnyCancellable?

    func testGetLegoColorsError() throws {
        // GIVEN
        try httpServerBuilder

            .route("/colors", { (request, callCount) -> (HttpResponse) in
                XCTAssertEqual(request.method, APIManager.HttpMethod.get.rawValue)
                XCTAssertEqual(callCount, 1)
                let errorBody = ErrorBody(code: "error qualcosa", details: [ErrorBody.ErrorDetail.init(id: "qualcosa id", description: "")])
                return HttpResponse.encode(errorBody, statusCode: 429)
            })
            .buildAndStart()
        // WHEN
        cancellable = legoApi.getColors()
            // THEN
            .print()
            .sink(receiveCompletion: { print($0) },
                  receiveValue: { print($0) })
    }
}
