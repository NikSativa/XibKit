import Foundation
import XibKit

final class TableViewCell: NTableViewCell {
    @IBOutlet
    weak var sub: XibViewSub!

    override func commonSetup() {
        super.commonSetup()
        sub.label.text = "TableViewCell"
    }
}
