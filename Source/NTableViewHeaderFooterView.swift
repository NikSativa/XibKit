import UIKit

@MainActor
open class NTableViewHeaderFooterView: UITableViewHeaderFooterView {
    private var inited: Bool = false
    private var setuped: Bool = false

    override public init(reuseIdentifier id: String?) {
        super.init(reuseIdentifier: id)
        initialSetup()
        commonSetup()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }

    override open func awakeFromNib() {
        super.awakeFromNib()
        syncMain {
            commonSetup()
        }
    }

    /// setup before IBOutlets. use commonSetup for outlets
    open func initialSetup() {
        assert(inited == false)
        inited = true
    }

    open func commonSetup() {
        assert(setuped == false)
        setuped = true
    }
}
