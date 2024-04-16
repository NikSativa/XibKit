import Foundation
import SpryKit
import XCTest
import XibKit

final class XibViewTests: XCTestCase {
    func test_view() {
        let main: XibViewMain = .init()
        XCTAssertNotNil(main)
        XCTAssertNotNil(main.xibView)
        XCTAssertEqual(main.xibView.label.text, "overridden text")

        let sub: XibViewSub = .init()
        XCTAssertNotNil(sub)
        XCTAssertEqual(sub.label.text, "original text")

        XCTAssertThrowsAssertion {
            _ = XibViewWrongRoot()
        }
    }

    func test_controller() {
        let story = UIStoryboard(name: "ViewController", bundle: .module)
        let viewController = story.instantiateInitialViewController() as! ViewController
        viewController.loadViewIfNeeded()
        XCTAssertEqual(viewController.text, "TableViewCell")
    }
}
