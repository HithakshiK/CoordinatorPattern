//
//  Copyright © 2019 Carousell. All rights reserved.
//

import UIKit

public enum ALAxis: Int {
    case vertical
    case horizontal
    case lastBaseline
    case firstBaseline
}

extension ALAxis {

    var constraintAxis: NSLayoutConstraint.Axis {
        switch self {
        case .vertical:
            return .vertical
        default:
            return .horizontal
        }
    }

    var attribute: NSLayoutConstraint.Attribute {
        switch self {
        case .vertical:
            return .centerX
        case .horizontal:
            return .centerY
        case .lastBaseline:
            return .lastBaseline
        case .firstBaseline:
            return .firstBaseline
        }
    }
}
