@testable import LegoSDK
import XCTest
import Swifter
import Combine

class LegoAPITests: UnitTestCase {
    private let legoApi = LegoAPI(apiKey: "262a544a78e1cbca7f70541ce6e6bc2c")
    private var bag = Set<AnyCancellable>()

    func testGetLegoColors() throws {
        try getTest(mock: [LegoColor.mock()],
                    endpoint: Endpoint.colors,
                    publisher: legoApi.getLegoColors())
    }

    func testGetLegoColorWithId() throws {
        try getTest(mock: LegoColor.mock(),
                    endpoint: Endpoint.colors,
                    publisher: legoApi.getLegoColorDetails(with: 1))
    }

    func testGetLegoElement() throws {
        try getTest(mock: LegoElement.mock(),
                    endpoint: Endpoint.elements,
                    publisher: legoApi.getLegoElement(with: "6099483"))
    }

    func testGetLegoMinifigures() throws {
        try getTest(mock: [LegoSet.mock()],
                    endpoint: Endpoint.minifigs,
                    publisher: legoApi.getLegoMinifigures())
    }

    func testGetLegoMinifigureWithSetNum() throws {
        try getTest(mock: LegoSet.mock(),
                    endpoint: Endpoint.minifigs,
                    publisher: legoApi.getLegoMinifigureDetails(figNum: "fig-000001"))
    }

    func testGetLegoMinifigureParts() throws {
        try getTest(mock: [LegoInventoryPart.mock()],
                    endpoint: Endpoint.parts,
                    publisher: legoApi.getLegoMinifigureParts(figNum: "fig-000001"))
    }

    func testGetLegoMinifigureSets() throws {
        try getTest(mock: [LegoSet.mock()],
                    endpoint: Endpoint.sets,
                    publisher: legoApi.getLegoSets(figNum: "fig-000001"))
    }

    func testGetLegoPartCategories() throws {
        try getTest(mock: [LegoPartCategory.mock()],
                    endpoint: Endpoint.elements,
                    publisher: legoApi.getLegoPartCategories())
    }

    func testGetLegoPartCategoriesWithId() throws {
        try getTest(mock: LegoPartCategory.mock(),
                    endpoint: Endpoint.elements,
                    publisher: legoApi.getLegoPartCategoryDetails(with: 49))
    }

    func testGetLegoParts() throws {
        try getTest(mock: [LegoPart.mock()],
                    endpoint: Endpoint.parts,
                    publisher: legoApi.getLegoParts())
    }

    func testGetLegoPartWithId() throws {
        try getTest(mock: LegoPart.mock(),
                    endpoint: Endpoint.parts,
                    publisher: legoApi.getLegoPartDetails(with: "39381"))
    }

    func testGetLegoPartColorsWithPartNum() throws {
        try getTest(mock: [LegoPartColor.mock()],
                    endpoint: Endpoint.colors,
                    publisher: legoApi.getPartColors(partNum: "003381"))
    }

    func testGetLegoPartsWitPartAndColor() throws {
        try getTest(mock: [LegoSet.mock()],
                    endpoint: Endpoint.sets,
                    publisher: legoApi.getSets(partNum: "003381", colorID: "9999"))
    }

    func testGetLegoSets() throws {
        try getTest(mock: [LegoSet.mock()],
                    endpoint: Endpoint.sets,
                    publisher: legoApi.getLegoSets())
    }

    func testGetLegoSet() throws {
        try getTest(mock: LegoSet.mock(),
                    endpoint: Endpoint.sets,
                    publisher: legoApi.getLegoSetDetails(with: "0011-2"))
    }

    func testGetLegoInventoryMinifigsWithSetNum() throws {
        try getTest(mock: [LegoInventorySet.mock()],
                    endpoint: Endpoint.minifigs,
                    publisher: legoApi.getLegoInventoryMinifigs(setNum: "0011-2"))
    }

    func testGetLegoInventoryPartsWithSetNum() throws {
        try getTest(mock: [LegoInventoryPart.mock()],
                    endpoint: Endpoint.parts,
                    publisher: legoApi.getLegoInventoryParts(setNum: "76139-1"))
    }

    func testGetLegoThemes() throws {
        try getTest(mock: [LegoTheme.mock()],
                    endpoint: Endpoint.themes,
                    publisher: legoApi.getLegoThemes())
    }

    func testGetLegoThemeWithId() throws {
        try getTest(mock: LegoTheme.mock(),
                    endpoint: Endpoint.themes,
                    publisher: legoApi.getLegoTheme(with: 1))
    }
}

extension LegoAPITests {
    func getTest<T: Codable>(mock: T, endpoint: String, publisher: AnyPublisher<T, LegoError>) throws {
        let exp1 = expectation(description: "receiveCompletion")
        let exp2 = expectation(description: "receiveValue")

        try httpServerBuilder
            .route(endpoint, { (request, callCount) -> (HttpResponse) in
                XCTAssertEqual(request.method, APIManager.HttpMethod.get.rawValue)
                XCTAssertEqual(callCount, 1)
                return HttpResponse.encode(value: mock)
            })
            .buildAndStart()

        publisher
            .sink(receiveCompletion: { _ in exp1.fulfill() },
                  receiveValue: { _ in exp2.fulfill() })
            .store(in: &bag)

        waitForExpectations(timeout: 3) { (error) in
            print("Error:\(String(describing: error))")
        }
    }
}
