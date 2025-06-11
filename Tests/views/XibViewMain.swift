import Foundation
import XibKit

final class XibViewMain: XibView {
    @IBOutlet
    weak var xibView: XibViewSub!

    override func commonSetup() {
        super.commonSetup()
        xibView.label.text = "overridden text"
    }
}
