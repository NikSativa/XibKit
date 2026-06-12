import Foundation

@inline(__always)
internal func syncMain(_ block: @MainActor () -> Void) {
    if Thread.isMainThread {
        MainActor.assumeIsolated(block)
    } else {
        DispatchQueue.main.sync(execute: block)
    }
}
