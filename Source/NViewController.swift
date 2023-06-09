import UIKit

open class NViewController: UIViewController {
    private var inited: Bool = false
    private var setuped: Bool = false

    public var dismissClosure: () -> Void = {}

    override public init(nibName: String?, bundle: Bundle?) {
        super.init(nibName: nibName, bundle: bundle)
        initialSetup()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }

    override open func viewDidLoad() {
        super.viewDidLoad()
        commonSetup()
    }

    /// setup before IBOutlets. use viewDidLoad for outlets
    open func initialSetup() {
        assert(inited == false)
        inited = true
    }

    open func commonSetup() {
        assert(setuped == false)
        setuped = true
    }
}
