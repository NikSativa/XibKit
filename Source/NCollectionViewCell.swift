import UIKit

open class NCollectionViewCell: UICollectionViewCell {
    private var inited: Bool = false

    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonSetup()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override open func awakeFromNib() {
        super.awakeFromNib()
        commonSetup()
    }

    open func commonSetup() {
        assert(inited == false)
        inited = true
    }
}
