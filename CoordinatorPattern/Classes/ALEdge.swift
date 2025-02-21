//
//  Copyright © 2019 Carousell. All rights reserved.
//

import UIKit

public enum ALEdge: Int {
    case left
    case right
    case top
    case bottom
    case leading
    case trailing
}

extension ALEdge {
    func toLeadingTrailing(direction: UIUserInterfaceLayoutDirection
        = UIApplication.shared.userInterfaceLayoutDirection) -> ALEdge {

        switch self {
        case .left:
            return direction == .leftToRight ? .leading : .trailing
        case .right:
            return direction == .leftToRight ? .trailing : .leading
        default:
            return self
        }
    }
}
