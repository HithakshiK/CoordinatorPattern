//
//  Copyright © 2019 Carousell. All rights reserved.
//

import UIKit

@objc extension NSLayoutAnchor {
    func constraint(
        otherAnchor: NSLayoutAnchor<AnchorType>,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {

        let result: NSLayoutConstraint
        switch relation {
        case .lessThanOrEqual:
            result = constraint(lessThanOrEqualTo: otherAnchor, constant: constant)
        case .equal:
            result = constraint(equalTo: otherAnchor, constant: constant)
        case .greaterThanOrEqual:
            result = constraint(greaterThanOrEqualTo: otherAnchor, constant: constant)
        @unknown default:
            fatalError("Case not handled")
        }
        result.priority = NSLayoutConstraint.currentPriority
        result.isActive = true
        return result
    }
}
