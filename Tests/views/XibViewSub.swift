import UIKit
import XibKit

final class XibViewSub: XibView {
    @IBOutlet
    weak var label: UILabel!

    override func commonSetup() {
        super.commonSetup()
        label.text = "original text"
    }
}
