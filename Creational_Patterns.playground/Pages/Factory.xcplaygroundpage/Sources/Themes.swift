import UIKit

public protocol Theme {
    var backgroundColor: UIColor { get }
    var textColor: UIColor { get }
}

public struct LightTheme: Theme {
    public let backgroundColor = UIColor.white
    public let textColor = UIColor.darkGray
    public init() {}
}

public struct DarkTheme: Theme {
    public let backgroundColor = UIColor.darkGray
    public let textColor = UIColor.white
    public init() {}
}

public struct BlueTheme: Theme {
    public var backgroundColor = UIColor.blue
    public var textColor = UIColor.white
    public init() {}
}

public struct MonochromeTheme: Theme {
    public var backgroundColor = UIColor.black
    public var textColor = UIColor.white
    public init() {}
}


