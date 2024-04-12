# XibKit
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FNikSativa%2FXibKit%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/NikSativa/XibKit)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FNikSativa%2FXibKit%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/NikSativa/XibKit)

This library provides a way to create views from `xib` files. It's useful when you need to create a custom view with a complex hierarchy of subviews.

> [!IMPORTANT]  
> 1. the root view and `File's Owner` must be specified as your class, which inherits from `XibView` 
> 2. all outlets must be connected with `File's Owner` object inside `xib`
> 3. root view in `xib` must have minimum 1 subview

As result you will get a view with hierarchy:
- MyView - file's owner
  - MyView - root view
      - subview
      - subview
      - subview

How to create from code:
```swift
let main: XibViewMain = .init()
view.addSubview(main)
```

You can use you custom views inside other `xib`/`storyboard` by setting class type to your custom view class and connect outlets to it. 
To handle correct size in `xib` just set intrinsic size to `placeholder`.

How to create from other `xib`:
```swift
final class MyViewController: UIViewController {
    @IBOutlet weak var main: XibViewMain!
}
```

*
PS:
see [XibViewMain.xib](./Tests/views/XibViewMain.xib) and [XibViewMain.swift](./Tests/views/XibViewMain.swift) as example
*
