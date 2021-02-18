import Foundation

extension String {
    var toUrl: URL {
        URL(string: self)!
    }
}
