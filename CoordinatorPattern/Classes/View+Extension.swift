//
//  View+Extension.swift
//  TestsDemo
//
//  Created by Hithakshi on 02/08/24.
//

import UIKit

public extension UIView {

    func crs_setCornerRadius(_ radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }

    func crs_circle() {
        crs_setCornerRadius(frame.width / 2.0)
    }

    /// default radius is 4
    func crs_roundedCorner() {
        crs_setCornerRadius(4)
    }
}

public extension UIView {
    func addInnerShadow(shadowColor: UIColor = .black, shadowOffset: CGSize = CGSize(width: 0, height: -20), shadowBlurRadius: CGFloat = 15.0, shadowOpacity: Float = 0.3) {
        let shadowLayer = CAShapeLayer()
        shadowLayer.frame = bounds
        shadowLayer.fillColor = backgroundColor?.cgColor

        // Create a larger rectangle path to serve as the shadow
        let largerRect = bounds.insetBy(dx: -shadowBlurRadius * 2, dy: -shadowBlurRadius * 2)
        let largerPath = UIBezierPath(rect: largerRect)

        // Create a smaller rectangle path that will be subtracted from the larger one
        let innerPath = UIBezierPath(rect: bounds).reversing()

        // Append the inner path to the larger one, creating a hollow shape
        largerPath.append(innerPath)

        shadowLayer.shadowPath = largerPath.cgPath
        shadowLayer.masksToBounds = true
        shadowLayer.shadowColor = shadowColor.cgColor
        shadowLayer.shadowOffset = shadowOffset
        shadowLayer.shadowRadius = shadowBlurRadius
        shadowLayer.shadowOpacity = shadowOpacity

        // Add the shadow layer to the view's layer
        layer.addSublayer(shadowLayer)
    }
}
