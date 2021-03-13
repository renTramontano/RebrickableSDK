import Foundation

extension URL {
    private func appending(queryItem: URLQueryItem) -> URL {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        var queryItems = components?.queryItems ?? []
        queryItems.append(queryItem)
        components?.queryItems = queryItems
        return components?.url ?? self
    }

    func appendingQueryItem(name: String, value: Int?) -> URL {
        guard let value = value else { return self }
        return appending(queryItem: URLQueryItem(name: name, value: "\(value)"))
    }

    func appendingQueryItem(name: String, value: String?) -> URL {
        guard let value = value, !value.isEmpty else { return self }
        return appending(queryItem: URLQueryItem(name: name, value: value))
    }

    func appendingDirPath(_ path: String) -> URL {
        appendingPathComponent(path, isDirectory: true)
    }
}
