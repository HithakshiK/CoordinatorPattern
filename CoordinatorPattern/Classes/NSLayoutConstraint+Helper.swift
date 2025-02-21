//
//  Copyright © 2019 Carousell. All rights reserved.
//

import UIKit

public extension NSLayoutConstraint {

    private static var priorities = [UILayoutPriority]()

    internal static var currentPriority: UILayoutPriority {
        return priorities.last ?? .required
    }

    static func autoSetPriority(
        _ priority: UILayoutPriority,
        forConstraints block: () -> Void) {

        priorities.append(priority)
        block()
        priorities.removeLast()
    }

    @discardableResult
    @nonobjc
    func setPriority(_ priority: UILayoutPriority) -> NSLayoutConstraint {
        self.priority = priority
        return self
    }

    @discardableResult
    @nonobjc
    func setActive(_ isActive: Bool) -> NSLayoutConstraint {
        self.isActive = isActive
        return self
    }
}

public extension Array where Element: NSLayoutConstraint {

    @discardableResult
    func setPriority(_ priority: UILayoutPriority) -> Array {
        forEach { $0.priority = priority }
        return self
    }

    @discardableResult
    func setActive(_ isActive: Bool) -> Array {
        forEach { $0.isActive = isActive }
        return self
    }
}
