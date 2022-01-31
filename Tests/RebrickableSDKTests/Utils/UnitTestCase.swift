import Swifter
import XCTest

class UnitTestCase: XCTestCase {
    var httpServerBuilder: UTHttpServerBuilder! = UTHttpServerBuilder()

    override func setUp() {
        super.setUp()
        httpServerBuilder.httpServer.stop()
        httpServerBuilder = UTHttpServerBuilder()
    }

    override func tearDown() {
        httpServerBuilder.httpServer.stop()
        super.tearDown()
    }
}
