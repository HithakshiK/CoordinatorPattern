//
//

import Foundation
import UIKit

extension UIEdgeInsets {

    func edgeToInset(excludingEdge: ALEdge? = nil)
        -> [(edge: ALEdge, inset: CGFloat)] {

        let edges: [ALEdge] = [.top, .leading, .bottom, .trailing].filter {
            $0 != excludingEdge?.toLeadingTrailing()
        }
        return edges.map { ($0, inset(for: $0)) }
    }

    private func inset(for edge: ALEdge, direction: UIUserInterfaceLayoutDirection
        = UIApplication.shared.userInterfaceLayoutDirection) -> CGFloat {

        switch edge {
        case .left:
            return left
        case .right:
            return right
        case .top:
            return top
        case .bottom:
            return bottom
        case .leading:
            return direction == .leftToRight ? left : right
        case .trailing:
            return direction == .leftToRight ? right : left
        }
    }
}
