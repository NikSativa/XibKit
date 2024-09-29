import UIKit

@MainActor
open class NTableViewCell: UITableViewCell {
    private var inited: Bool = false
    private var setuped: Bool = false

    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
