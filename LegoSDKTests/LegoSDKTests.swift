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

    func testGetLegoColor() throws {
        // GIVEN
        let legoColors = LegoColor.mock()
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
        cancellable = legoApi.getLegoColor(with: 1)
            // THEN
            .sink(receiveCompletion: { _ in exp1.fulfill() },
                  receiveValue: { _ in exp2.fulfill() })

        waitForExpectations(timeout: 3) { (error) in
            print("Error:\(String(describing: error))")
        }
    }

    func testGetLegoElement() throws {
        // GIVEN
        let legoElement = LegoElement.mock()
        let exp1 = expectation(description: "receiveCompletion")
        let exp2 = expectation(description: "receiveValue")

        try httpServerBuilder
            .route("/elements", { (request, callCount) -> (HttpResponse) in
                XCTAssertEqual(request.method, APIManager.HttpMethod.get.rawValue)
                XCTAssertEqual(callCount, 1)
                return HttpResponse.encode(value: legoElement)
            })
            .buildAndStart()
        // WHEN
        cancellable = legoApi.getLegoElement(with: "6099483")
            // THEN
            .sink(receiveCompletion: { _ in exp1.fulfill() },
                  receiveValue: { _ in exp2.fulfill() })

        waitForExpectations(timeout: 3) { (error) in
            print("Error:\(String(describing: error))")
        }
    }

    func testGetLegoPartCategories() throws {
        // GIVEN
        let partCategories = LegoPartCategories.mock()
        let exp1 = expectation(description: "receiveCompletion")
        let exp2 = expectation(description: "receiveValue")

        try httpServerBuilder
            .route("/elements", { (request, callCount) -> (HttpResponse) in
                XCTAssertEqual(request.method, APIManager.HttpMethod.get.rawValue)
                XCTAssertEqual(callCount, 1)
                return HttpResponse.encode(value: partCategories)
            })
            .buildAndStart()
        // WHEN
        cancellable = legoApi.getLegoPartCategories()
            // THEN
            .sink(receiveCompletion: { _ in exp1.fulfill() },
                  receiveValue: { _ in exp2.fulfill() })

        waitForExpectations(timeout: 3) { (error) in
            print("Error:\(String(describing: error))")
        }
    }

    func testGetLegoPartCategoriesWithId() throws {
        // GIVEN
        let partCategory = LegoPartCategory.mock()
        let exp1 = expectation(description: "receiveCompletion")
        let exp2 = expectation(description: "receiveValue")

        try httpServerBuilder
            .route("/elements", { (request, callCount) -> (HttpResponse) in
                XCTAssertEqual(request.method, APIManager.HttpMethod.get.rawValue)
                XCTAssertEqual(callCount, 1)
                return HttpResponse.encode(value: partCategory)
            })
            .buildAndStart()
        // WHEN
        cancellable = legoApi.getLegoPartCategory(with: 49)
            // THEN
            .sink(receiveCompletion: { _ in exp1.fulfill() },
                  receiveValue: { _ in exp2.fulfill() })

        waitForExpectations(timeout: 3) { (error) in
            print("Error:\(String(describing: error))")
        }
    }

    func testGetLegoMinifigures() throws {
        // GIVEN
        let legoMinifigures = LegoSets.mock()
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

    func testGetLegoMinifigureWithSetNum() throws {
        // GIVEN
        let legoMinifigure = LegoSet.mock()
        let exp1 = expectation(description: "receiveCompletion")
        let exp2 = expectation(description: "receiveValue")

        try httpServerBuilder
            .route("/minifigs", { (request, callCount) -> (HttpResponse) in
                XCTAssertEqual(request.method, APIManager.HttpMethod.get.rawValue)
                XCTAssertEqual(callCount, 1)
                return HttpResponse.encode(value: legoMinifigure)
            })
            .buildAndStart()
        // WHEN
        cancellable = legoApi.getLegoMinifigureDetails(with: "fig-000001")
            // THEN
            .sink(receiveCompletion: { _ in exp1.fulfill() },
                  receiveValue: { _ in exp2.fulfill() })

        waitForExpectations(timeout: 3) { (error) in
            print("Error:\(String(describing: error))")
        }
    }

    func testGetLegoMinifigureParts() throws {
        // GIVEN
        let legoParts = LegoInventoryParts.mock()
        let exp1 = expectation(description: "receiveCompletion")
        let exp2 = expectation(description: "receiveValue")

        try httpServerBuilder
            .route("/parts", { (request, callCount) -> (HttpResponse) in
                XCTAssertEqual(request.method, APIManager.HttpMethod.get.rawValue)
                XCTAssertEqual(callCount, 1)
                return HttpResponse.encode(value: legoParts)
            })
            .buildAndStart()
        // WHEN
        cancellable = legoApi.getLegoMinifigureParts(with: "fig-000001")
            // THEN
            .sink(receiveCompletion: { _ in exp1.fulfill() },
                  receiveValue: { _ in exp2.fulfill() })

        waitForExpectations(timeout: 3) { (error) in
            print("Error:\(String(describing: error))")
        }
    }

    func testGetLegoMinifigureSets() throws {
        // GIVEN
        let legoMinifigures = LegoSets.mock()
        let exp1 = expectation(description: "receiveCompletion")
        let exp2 = expectation(description: "receiveValue")

        try httpServerBuilder
            .route("/sets", { (request, callCount) -> (HttpResponse) in
                XCTAssertEqual(request.method, APIManager.HttpMethod.get.rawValue)
                XCTAssertEqual(callCount, 1)
                return HttpResponse.encode(value: legoMinifigures)
            })
            .buildAndStart()
        // WHEN
        cancellable = legoApi.getLegoSets(with: "fig-000001")
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

    func testGetLegoTheme() throws {
        // GIVEN
        let legoThemes = LegoTheme.mock()
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
        cancellable = legoApi.getLegoTheme(with: 1)
            // THEN
            .sink(receiveCompletion: { _ in exp1.fulfill() },
                  receiveValue: { _ in exp2.fulfill() })

        waitForExpectations(timeout: 3) { (error) in
            print("Error:\(String(describing: error))")
        }
    }

    func testGetLegoParts() throws {
        // GIVEN
        let legoParts = LegoParts.mock()
        let exp1 = expectation(description: "receiveCompletion")
        let exp2 = expectation(description: "receiveValue")

        try httpServerBuilder
            .route("/parts", { (request, callCount) -> (HttpResponse) in
                XCTAssertEqual(request.method, APIManager.HttpMethod.get.rawValue)
                XCTAssertEqual(callCount, 1)
                return HttpResponse.encode(value: legoParts)
            })
            .buildAndStart()
        // WHEN
        cancellable = legoApi.getLegoParts()
            // THEN
            .sink(receiveCompletion: { _ in exp1.fulfill() },
                  receiveValue: { _ in exp2.fulfill() })

        waitForExpectations(timeout: 3) { (error) in
            print("Error:\(String(describing: error))")
        }
    }
}
