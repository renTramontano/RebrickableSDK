@testable import LegoSDK
import XCTest
import Swifter
import Combine

class LegoAPITests: UnitTestCase {
    private let legoApi = LegoAPI(apiKey: "262a544a78e1cbca7f70541ce6e6bc2c")
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

    func testGetLegoSets() throws {
        // GIVEN
        let legoSets = LegoSets.mock()
        let exp1 = expectation(description: "receiveCompletion")
        let exp2 = expectation(description: "receiveValue")

        try httpServerBuilder
            .route("/sets", { (request, callCount) -> (HttpResponse) in
                XCTAssertEqual(request.method, APIManager.HttpMethod.get.rawValue)
                XCTAssertEqual(callCount, 1)
                return HttpResponse.encode(value: legoSets)
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

    func testGetLegoThemes() throws {
        // GIVEN
        let legoThemes = LegoThemes.mock()
        let exp1 = expectation(description: "receiveCompletion")
        let exp2 = expectation(description: "receiveValue")

        try httpServerBuilder
            .route("/themes", { (request, callCount) -> (HttpResponse) in
                XCTAssertEqual(request.method, APIManager.HttpMethod.get.rawValue)
                XCTAssertEqual(callCount, 1)
                return HttpResponse.encode(value: legoThemes)
            })
            .buildAndStart()
        // WHEN
        cancellable = legoApi.getLegoThemes()
            // THEN
            .sink(receiveCompletion: { _ in exp1.fulfill() },
                  receiveValue: { _ in exp2.fulfill() })

        waitForExpectations(timeout: 3) { (error) in
            print("Error:\(String(describing: error))")
        }
    }
}
