//
//  Copyright © 2019 Carousell. All rights reserved.
//

import UIKit

extension NSLayoutDimension {

    func constraint(
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {

        let result: NSLayoutConstraint
        switch relation {
        case .lessThanOrEqual:
            result = constraint(lessThanOrEqualToConstant: constant)
        case .equal:
            result = constraint(equalToConstant: constant)
        case .greaterThanOrEqual:
            result = constraint(greaterThanOrEqualToConstant: constant)
        @unknown default:
            fatalError("Case not handled")
        }
        result.priority = NSLayoutConstraint.currentPriority
        result.isActive = true
        return result
    }

    func constraint(
        otherAnchor: NSLayoutDimension,
        multiplier: CGFloat = 1,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {

        let result: NSLayoutConstraint
        switch relation {
        case .lessThanOrEqual:
            result = constraint(lessThanOrEqualTo: otherAnchor, multiplier: multiplier, constant: constant)
        case .equal:
            result = constraint(equalTo: otherAnchor, multiplier: multiplier, constant: constant)
        case .greaterThanOrEqual:
            result = constraint(greaterThanOrEqualTo: otherAnchor, multiplier: multiplier, constant: constant)
        @unknown default:
            fatalError("Case not handled")
        }
        result.priority = NSLayoutConstraint.currentPriority
        result.isActive = true
        return result
    }
}
