@testable import LegoSDK
import XCTest
import Swifter
import Combine

class LegoAPITests: UnitTestCase {
    private let legoApi = LegoApi()
    private var cancellable: AnyCancellable?

    func testGetLegoColors() throws {
        // GIVEN
        let legoColors = LegoColors.mock()
        let exp1 = expectation(description: "receiveCompletion")
        let exp2 = expectation(description: "receiveValue")

        try httpServerBuilder
            .route("/colors", { (request, callCount) -> (HttpResponse) in
                XCTAssertEqual(request.method, APIManager.HttpMethod.get.rawValue)
                XCTAssertEqual(callCount, 1)
                return HttpResponse.encode(value: legoColors)
            })
            .buildAndStart()
        // WHEN
        cancellable = legoApi.getLegoColors()
            // THEN
            .sink(receiveCompletion: { _ in exp1.fulfill() },
                  receiveValue: { _ in exp2.fulfill() })

        waitForExpectations(timeout: 3) { (error) in
            print("Error:\(String(describing: error))")
        }
    }

    func testGetLegoMinifigures() throws {
        // GIVEN
        let legoMinifigures = LegoMinifigures.mock()
        let exp1 = expectation(description: "receiveCompletion")
        let exp2 = expectation(description: "receiveValue")

        try httpServerBuilder
            .route("/minifigs", { (request, callCount) -> (HttpResponse) in
                XCTAssertEqual(request.method, APIManager.HttpMethod.get.rawValue)
                XCTAssertEqual(callCount, 1)
                return HttpResponse.encode(value: legoMinifigures)
            })
            .buildAndStart()
        // WHEN
        cancellable = legoApi.getLegoMinifigures()
            // THEN
            .sink(receiveCompletion: { _ in exp1.fulfill() },
                  receiveValue: { _ in exp2.fulfill() })

        waitForExpectations(timeout: 3) { (error) in
            print("Error:\(String(describing: error))")
        }
    }

    func testGetLegoSet() throws {
        // GIVEN
        let legoSet = LegoSet.mock()
        let exp1 = expectation(description: "receiveCompletion")
        let exp2 = expectation(description: "receiveValue")

        try httpServerBuilder
            .route("/sets", { (request, callCount) -> (HttpResponse) in
                XCTAssertEqual(request.method, APIManager.HttpMethod.get.rawValue)
                XCTAssertEqual(callCount, 1)
                return HttpResponse.encode(value: legoSet)
            })
            .buildAndStart()
        // WHEN
        cancellable = legoApi.getLegoSets()
            // THEN
            .sink(receiveCompletion: { _ in exp1.fulfill() },
                  receiveValue: { _ in exp2.fulfill() })

        waitForExpectations(timeout: 3) { (error) in
            print("Error:\(String(describing: error))")
        }
    }
}
