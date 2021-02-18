import Foundation

extension URL {
    private func appending(queryItem: URLQueryItem) -> URL {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        var queryItems = components?.queryItems ?? []
        queryItems.append(queryItem)
        components?.queryItems = queryItems
        return components?.url ?? self
    }

    func appendingQueryItem(_ name: String, value: String) -> URL {
        appending(queryItem: URLQueryItem(name: name, value: value))
    }

    func appendingKey() -> URL {
        appendingQueryItem("key", value: "262a544a78e1cbca7f70541ce6e6bc2c")
    }
}
