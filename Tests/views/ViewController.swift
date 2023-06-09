import Foundation
import NXibView
import UIKit

final class ViewController: NViewController {
    private let cellId: String = "cellId"

    @IBOutlet var tableView: UITableView! {
        didSet {
            let nib = UINib(nibName: "TableViewCell", bundle: .module)
            tableView.register(nib, forCellReuseIdentifier: cellId)
        }
    }

    private(set) var text: String?

    override func commonSetup() {
        super.commonSetup()

        let cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        assert(cell != nil)
        assert(cell is TableViewCell)

        text = (cell as? TableViewCell)?.sub.label.text
    }
}
