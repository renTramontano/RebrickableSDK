import Foundation
import Combine

public final class LegoAPI {
    private var apiManger: APIManager
    
    public init(apiKey: String) {
        apiManger = APIManager(apiKey: apiKey)
    }
    
    public func getColors(page: Int? = nil, pageSize: Int? = nil) -> AnyPublisher<[LegoColor], LegoError> {
        getResults(with: Endpoint.colors(page: page, pageSize: pageSize))
    }
    
    public func getColorDetails(with id: Int) -> AnyPublisher<LegoColor, LegoError> {
        getItem(with: Endpoint.color(with: id))
    }
    
    public func getElement(with id: String) -> AnyPublisher<LegoElement, LegoError> {
        getItem(with: Endpoint.element(with: id))
    }
    
    public func getMinifigures(inSetNum: String? = nil, inThemeId: String? = nil, page: Int? = nil, pageSize: Int? = nil) -> AnyPublisher<[LegoSet], LegoError> {
        getResults(with: Endpoint.minifigs(inSetNum: inSetNum, inThemeId: inSetNum, page: page, pageSize: pageSize))
    }
    
    public func getMinifigureDetails(figNum: String) -> AnyPublisher<LegoSet, LegoError> {
        getItem(with: Endpoint.minifig(with: figNum))
    }
    
    public func getMinifigureParts(figNum: String, page: Int? = nil, pageSize: Int? = nil) -> AnyPublisher<[LegoInventoryPart], LegoError> {
        getResults(with: Endpoint.minifigParts(figNum: figNum, page: page, pageSize: pageSize))
    }
    
    public func getSets(figNum: String, page: Int? = nil, pageSize: Int? = nil) -> AnyPublisher<[LegoSet], LegoError> {
        getResults(with: Endpoint.minifigSets(figNum: figNum, page: page, pageSize: pageSize))
    }
    
    public func getPartCategories(page: Int? = nil, pageSize: Int? = nil) -> AnyPublisher<[LegoPartCategory], LegoError> {
        getResults(with: Endpoint.partCategories(page: page, pageSize: pageSize))
    }
    
    public func getPartCategoryDetails(with id: Int) -> AnyPublisher<LegoPartCategory, LegoError> {
        getItem(with: Endpoint.partCategory(with: id))
    }
    
    public func getParts() -> AnyPublisher<[LegoPart], LegoError> {
        getResults(with: Endpoint.partsUrl)
    }
    
    public func getPartDetails(with id: String) -> AnyPublisher<LegoPart, LegoError> {
        getItem(with: Endpoint.part(with: id))
    }
    
    public func getPartColors(partNum: String, page: Int? = nil, pageSize: Int? = nil) -> AnyPublisher<[LegoPartColor], LegoError> {
        getResults(with: Endpoint.partColors(partNum: partNum, page: page, pageSize: pageSize))
    }
    
    public func getSets(partNum: String, colorID: String, page: Int? = nil, pageSize: Int? = nil) -> AnyPublisher<[LegoSet], LegoError> {
        getResults(with: Endpoint.set(partNum: partNum, colorId: colorID, page: page, pageSize: pageSize))
    }
    
    public func getSets(themeId: String? = nil, page: Int? = nil, pageSize: Int? = nil) -> AnyPublisher<[LegoSet], LegoError> {
        getResults(with: Endpoint.sets(themeId: themeId, page: page, pageSize: pageSize))
    }
    
    public func getSetDetails(with setNum: String) -> AnyPublisher<LegoSet, LegoError> {
        getItem(with: Endpoint.set(setNum: setNum))
    }
    
    public func getInventoryMinifigs(setNum: String, page: Int? = nil, pageSize: Int? = nil) -> AnyPublisher<[LegoInventorySet], LegoError> {
        getResults(with: Endpoint.inventoryMinifigs(setNum: setNum, page: page, pageSize: pageSize))
    }
    
    public func getInventoryParts(setNum: String, page: Int? = nil, pageSize: Int? = nil) -> AnyPublisher<[LegoInventoryPart], LegoError> {
        getResults(with: Endpoint.inventoryParts(setNum: setNum, page: page, pageSize: pageSize))
    }
    
    public func getThemes(page: Int? = nil, pageSize: Int? = nil) -> AnyPublisher<[LegoTheme], LegoError> {
        getResults(with: Endpoint.themes(page: page, pageSize: pageSize))
    }
    
    public func getTheme(with id: Int) -> AnyPublisher<LegoTheme, LegoError> {
        getItem(with: Endpoint.theme(with: id))
    }
}

extension LegoAPI {
    private func getItem<T: Codable>(with url: URL) -> AnyPublisher<T, LegoError> {
        apiManger.makeRequest(to: url, withHttpMethod: .get)
            .map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapToLegoError()
            .eraseToAnyPublisher()
    }
    
    private func getResults<T: Codable & Hashable>(with url: URL) -> AnyPublisher<[T], LegoError> {
        let pageResponse: AnyPublisher<PageResponse<T>, LegoError> = getItem(with: url)
        return pageResponse
            .map { $0.results }
            .eraseToAnyPublisher()
    }
}
