import Foundation
import Swifter

extension Swifter.HttpResponse {
    public static func encode<T: Encodable>(value: T) -> Swifter.HttpResponse {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .custom({ (date, encoder) in
            var container = encoder.singleValueContainer()
            let encodedDate = ISO8601DateFormatter().string(from: date)
            try container.encode(encodedDate)
        })
        let data = try! encoder.encode(value)
        return HttpResponse.ok(HttpResponseBody.data(data))
    }

    static func encode<T: Encodable>(_ value: T, statusCode: Int) -> Swifter.HttpResponse {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .custom({ (date, encoder) in
            var container = encoder.singleValueContainer()
            let encodedDate = ISO8601DateFormatter().string(from: date)
            try container.encode(encodedDate)
        })
        let data = try! encoder.encode(value)
        return HttpResponse.raw(statusCode, "", nil) { (writer) in
            try writer.write(data)
        }
    }
}
