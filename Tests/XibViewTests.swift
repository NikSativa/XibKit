import Foundation
import NSpry
import XCTest

import NXibView
import NXibViewTestHelpers

final class XibViewTests: XCTestCase {
    func test_view() {
        let subject: XibViewMain = .init()
        XCTAssertNotNil(subject)
        XCTAssertNotNil(subject.xibView)
        XCTAssertNotNil(subject.xibView.label)

//        NSpry 2.0.0
//        XCTAssertThrowsAssertion {
//            _ = XibViewWrongRoot()
//        }
    }
}
