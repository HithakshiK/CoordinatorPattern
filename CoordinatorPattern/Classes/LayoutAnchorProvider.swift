//
//  Copyright © 2019 Carousell. All rights reserved.
//

import UIKit

public protocol LayoutAnchorProvider: AnyObject {
    var leadingAnchor: NSLayoutXAxisAnchor { get }
    var trailingAnchor: NSLayoutXAxisAnchor { get }
    var leftAnchor: NSLayoutXAxisAnchor { get }
    var rightAnchor: NSLayoutXAxisAnchor { get }
    var topAnchor: NSLayoutYAxisAnchor { get }
    var bottomAnchor: NSLayoutYAxisAnchor { get }
    var widthAnchor: NSLayoutDimension { get }
    var heightAnchor: NSLayoutDimension { get }
    var centerXAnchor: NSLayoutXAxisAnchor { get }
    var centerYAnchor: NSLayoutYAxisAnchor { get }
    var optionalFirstBaselineAnchor: NSLayoutYAxisAnchor? { get }
    var optionalLastBaselineAnchor: NSLayoutYAxisAnchor? { get }
    var superview: UIView? { get }
    var translatesAutoresizingMaskIntoConstraints: Bool { get set }
}

extension LayoutAnchorProvider {

    func xAxisAnchor(for edge: ALEdge) -> NSLayoutXAxisAnchor? {
        switch edge {
        case .left:
            return leftAnchor
        case .right:
            return rightAnchor
        case .leading:
            return leadingAnchor
        case .trailing:
            return trailingAnchor
        default:
            return nil
        }
    }

    func yAxisAnchor(for edge: ALEdge) -> NSLayoutYAxisAnchor? {
        switch edge {
        case .top:
            return topAnchor
        case .bottom:
            return bottomAnchor
        default:
            return nil
        }
    }

    func xAxisAnchor(for axis: ALAxis) -> NSLayoutXAxisAnchor? {
        switch axis {
        case .vertical:
            return centerXAnchor
        default:
            return nil
        }
    }

    func yAxisAnchor(for axis: ALAxis) -> NSLayoutYAxisAnchor? {
        switch axis {
        case .horizontal:
            return centerYAnchor
        case .lastBaseline:
            return optionalLastBaselineAnchor
        case .firstBaseline:
            return optionalFirstBaselineAnchor
        default:
            return nil
        }
    }

    func anchor(for dimension: ALDimension) -> NSLayoutDimension {
        switch dimension {
        case .width:
            return widthAnchor
        case .height:
            return heightAnchor
        }
    }
}

extension UIView: LayoutAnchorProvider {

    public var optionalFirstBaselineAnchor: NSLayoutYAxisAnchor? {
        return firstBaselineAnchor
    }

    public var optionalLastBaselineAnchor: NSLayoutYAxisAnchor? {
        return lastBaselineAnchor
    }
}

extension UILayoutGuide: LayoutAnchorProvider {

    public var optionalFirstBaselineAnchor: NSLayoutYAxisAnchor? {
        return nil
    }

    public var optionalLastBaselineAnchor: NSLayoutYAxisAnchor? {
        return nil
    }

    public var superview: UIView? {
        return owningView
    }

    public var translatesAutoresizingMaskIntoConstraints: Bool {
        get { return false }
        set {}
    }
}
