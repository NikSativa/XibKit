import UIKit

open class XibView: UIView {
    private var inited: Bool = false
    private var setuped: Bool = false

    public var isMaiXibKit: Bool {
        return internalView != nil
    }

    private var internalView: UIView!

    /// setup before IBOutlets. use commonSetup for outlets
    open func initialSetup() {
        assert(inited == false)
        inited = true
    }

    open func commonSetup() {
        assert(setuped == false)
        setuped = true
    }

    private static func loadView(withFilesOwner filesOwner: XibView) -> XibView {
        let classType: UIView.Type = type(of: filesOwner)
        let info = Bundle.module(for: classType)
        let views = info.bundle.loadNibNamed(info.nibName,
                                             owner: filesOwner,
                                             options: nil)
        guard let firstSubview = views?.first as? XibView else {
            fatalError("Failed to unwrap nib objects for nibName: \(info.nibName). Does the nib exist?")
        }

        assert(type(of: firstSubview) == classType, "The type of the first subview (\(type(of: firstSubview))) is incorrect. It should be \(classType). Check your .xib.")
        return firstSubview
    }

    override public required init(frame: CGRect) {
        super.init(frame: frame)
        initNib()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        if internalView == nil, super.subviews.isEmpty {
            initNib()
        }
    }

    private func initNib() {
        initialSetup()

        internalView = type(of: self).loadView(withFilesOwner: self)
        internalView.backgroundColor = .clear
        internalView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(internalView)

        NSLayoutConstraint.activate([
            internalView.leadingAnchor.constraint(equalTo: leadingAnchor),
            internalView.trailingAnchor.constraint(equalTo: trailingAnchor),
            internalView.topAnchor.constraint(equalTo: topAnchor),
            internalView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        commonSetup()
    }

    override open var preservesSuperviewLayoutMargins: Bool {
        get {
            return internalView?.preservesSuperviewLayoutMargins ?? super.preservesSuperviewLayoutMargins
        }
        set {
            if let internalView {
                internalView.preservesSuperviewLayoutMargins = newValue
            }
            super.preservesSuperviewLayoutMargins = newValue
        }
    }
}

private extension Foundation.Bundle {
    struct Info {
        let bundle: Bundle
        let nibName: String
    }

    static func module(for className: AnyClass) -> Info {
        let reflection = String(reflecting: className).components(separatedBy: ".")
        let packageName = reflection[0]
        for bundle in Bundle.allBundles {
            if bundle.bundleURL.pathExtension != "bundle" {
                continue
            }

            let bundleName = bundle.bundleURL.deletingPathExtension().lastPathComponent
            let nameComponents = String(reflecting: bundleName)
                .replacingOccurrences(of: "\"", with: "")
                .components(separatedBy: "_")
            if nameComponents.count >= 2, packageName == nameComponents[1] {
                return .init(bundle: bundle,
                             nibName: reflection[1])
            }
        }

        return .init(bundle: .main,
                     nibName: reflection[1])
    }
}
