import UIKit

internal extension CGFloat {

    static let largeButtonHeight = height(size: 48)
    static let mediumButtonHeight = height(size: 40)
    static let smallButtonHeight = height(size: 32)
    static let largeTextButtonHeight = height(size: 24)
    static let mediumTextButtonHeight = height(size: 22)
    static let smallTextButtonHeight = height(size: 18)

    private static func height(size: CGFloat) -> CGFloat {
        return size
    }
}
