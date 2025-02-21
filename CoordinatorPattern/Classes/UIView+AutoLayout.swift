//
//  Copyright © 2019 Carousell. All rights reserved.
//

import UIKit

public extension UIView {
    convenience init(forAutoLayout: ()) {
        self.init()
        translatesAutoresizingMaskIntoConstraints = false
    }
}

private typealias LAP = LayoutAnchorProvider

public extension UIView { // Center & Align in Superview

    @discardableResult
    func autoCenterInSuperview() -> [NSLayoutConstraint] {
        return (self as LAP).autoCenterInSuperview()
    }

    @discardableResult
    func autoAlignAxis(toSuperviewAxis axis: ALAxis) -> NSLayoutConstraint? {
        return (self as LAP).autoAlignAxis(toSuperviewAxis: axis)
    }

    @discardableResult
    func autoCenterInSuperviewMargins() -> [NSLayoutConstraint] {
        return (self as LAP).autoCenterInSuperviewMargins()
    }

    @discardableResult
    func autoAlignAxis(toSuperviewMarginAxis axis: ALAxis)
        -> NSLayoutConstraint? {

        return (self as LAP).autoAlignAxis(toSuperviewMarginAxis: axis)
    }
}

public extension UIView { // Pin Edges to SafeArea

    @discardableResult
    func autoPinEdge(toSuperviewSafeArea edge: ALEdge)
        -> NSLayoutConstraint? {

        return (self as LAP).autoPinEdge(toSuperviewSafeArea: edge)
    }

    @discardableResult
    func autoPinEdge(
        toSuperviewSafeArea edge: ALEdge,
        withInset inset: CGFloat) -> NSLayoutConstraint? {

        return (self as LAP).autoPinEdge(toSuperviewSafeArea: edge, withInset: inset)
    }

    @discardableResult
    func autoPinEdge(
        toSuperviewSafeArea edge: ALEdge,
        withInset inset: CGFloat,
        relation: NSLayoutConstraint.Relation) -> NSLayoutConstraint? {

        return (self as LAP).autoPinEdge(
            toSuperviewSafeArea: edge, withInset: inset, relation: relation)
    }

    @discardableResult
    func autoPinEdgesToSuperviewSafeArea() -> [NSLayoutConstraint] {
        return (self as LAP).autoPinEdgesToSuperviewSafeArea()
    }

    @discardableResult
    func autoPinEdgesToSuperviewSafeArea(with insets: UIEdgeInsets)
        -> [NSLayoutConstraint] {

        return (self as LAP).autoPinEdgesToSuperviewSafeArea(with: insets)
    }

    @discardableResult
    func autoPinEdgesToSuperviewSafeArea(
        with insets: UIEdgeInsets,
        excludingEdge: ALEdge) -> [NSLayoutConstraint] {

        return (self as LAP).autoPinEdgesToSuperviewSafeArea(
            with: insets, excludingEdge: excludingEdge)
    }

    @discardableResult
    func autoPinZeroInsetsToSuperviewSafeArea(excludingEdge: ALEdge) -> [NSLayoutConstraint] {

        return (self as LAP).autoPinEdgesToSuperviewSafeArea(excludingEdge: excludingEdge)
    }
}

public extension UIView { // Pin Edges to Superview

    @discardableResult
    func autoPinEdge(toSuperviewEdge edge: ALEdge) -> NSLayoutConstraint? {
        return (self as LAP).autoPinEdge(toSuperviewEdge: edge)
    }

    @discardableResult
    func autoPinEdge(
        toSuperviewEdge edge: ALEdge,
        withInset inset: CGFloat) -> NSLayoutConstraint? {

        return (self as LAP).autoPinEdge(toSuperviewEdge: edge, withInset: inset)
    }

    @discardableResult
    func autoPinEdge(
        toSuperviewEdge edge: ALEdge,
        withInset inset: CGFloat,
        relation: NSLayoutConstraint.Relation) -> NSLayoutConstraint? {

        return (self as LAP).autoPinEdge(
            toSuperviewEdge: edge, withInset: inset, relation: relation)
    }

    @discardableResult
    func autoPinEdgesToSuperviewEdges() -> [NSLayoutConstraint] {
        return (self as LAP).autoPinEdgesToSuperviewEdges()
    }

    @discardableResult
    func autoPinEdgesToSuperviewEdges(with insets: UIEdgeInsets)
        -> [NSLayoutConstraint] {

        return (self as LAP).autoPinEdgesToSuperviewEdges(with: insets)
    }

    @discardableResult
    func autoPinEdgesToSuperviewEdges(
        with insets: UIEdgeInsets,
        excludingEdge: ALEdge) -> [NSLayoutConstraint] {

        return (self as LAP).autoPinEdgesToSuperviewEdges(
            with: insets, excludingEdge: excludingEdge)
    }

    @discardableResult
    func autoPinEdge(toSuperviewMargin edge: ALEdge) -> NSLayoutConstraint? {
        return (self as LAP).autoPinEdge(toSuperviewMargin: edge)
    }

    @discardableResult
    func autoPinEdge(
        toSuperviewMargin edge: ALEdge,
        withInset inset: CGFloat) -> NSLayoutConstraint? {

        return (self as LAP).autoPinEdge(toSuperviewMargin: edge, withInset: inset)
    }

    @discardableResult
    func autoPinEdge(
        toSuperviewMargin edge: ALEdge,
        relation: NSLayoutConstraint.Relation) -> NSLayoutConstraint? {

        return (self as LAP).autoPinEdge(toSuperviewMargin: edge, relation: relation)
    }

    @discardableResult
    func autoPinEdgesToSuperviewMargins() -> [NSLayoutConstraint] {
        return (self as LAP).autoPinEdgesToSuperviewMargins()
    }

    @discardableResult
    func autoPinEdgesToSuperviewMargins(with insets: UIEdgeInsets)
        -> [NSLayoutConstraint] {

        return (self as LAP).autoPinEdgesToSuperviewMargins(with: insets)
    }

    @discardableResult
    func autoPinEdges(toSuperviewMarginsExcludingEdge excludingEdge: ALEdge)
        -> [NSLayoutConstraint] {

        return (self as LAP).autoPinEdges(
            toSuperviewMarginsExcludingEdge: excludingEdge)
    }

    @discardableResult
    func autoPinZeroInsetsToSuperviewEdges(excludingEdge: ALEdge) -> [NSLayoutConstraint] {

        return (self as LAP).autoPinEdgesToSuperviewEdges(excludingEdge: excludingEdge)
    }
}

public extension UIView { // Pin Edges

    @discardableResult
    func autoPinEdge(
        _ edge: ALEdge,
        to otherEdge: ALEdge,
        of view: UIView) -> NSLayoutConstraint? {

        return (self as LAP).autoPinEdge(edge, to: otherEdge, of: view)
    }

    @discardableResult
    func autoPinEdge(
        _ edge: ALEdge,
        to otherEdge: ALEdge,
        of view: UIView,
        withOffset offset: CGFloat) -> NSLayoutConstraint? {

        return (self as LAP).autoPinEdge(
            edge, to: otherEdge, of: view, withOffset: offset)
    }

    @discardableResult
    func autoPinEdge(
        _ edge: ALEdge,
        to otherEdge: ALEdge,
        of view: UIView,
        withOffset offset: CGFloat,
        relation: NSLayoutConstraint.Relation) -> NSLayoutConstraint? {

        return (self as LAP).autoPinEdge(
            edge, to: otherEdge, of: view, withOffset: offset, relation: relation)
    }
}

public extension UIView { // Align Axes

    @discardableResult
    func autoAlignAxis(
        _ axis: ALAxis,
        toSameAxisOf view: UIView) -> NSLayoutConstraint? {

        return (self as LAP).autoAlignAxis(axis, toSameAxisOf: view)
    }

    @discardableResult
    func autoAlignAxis(
        _ axis: ALAxis,
        toSameAxisOf view: UIView,
        withOffset offset: CGFloat) -> NSLayoutConstraint? {

        return (self as LAP).autoAlignAxis(
            axis, toSameAxisOf: view, withOffset: offset)
    }

    @discardableResult
    func autoAlignAxis(
        _ axis: ALAxis,
        toSameAxisOf view: UIView,
        withMultiplier multiplier: CGFloat) -> NSLayoutConstraint {

        return (self as LAP).autoAlignAxis(
            axis, toSameAxisOf: view, withMultiplier: multiplier)
    }
}

public extension UIView { // Match Dimensions

    @discardableResult
    func autoMatch(
        _ dimension: ALDimension,
        to otherDimension: ALDimension,
        of view: UIView) -> NSLayoutConstraint {

        return (self as LAP).autoMatch(dimension, to: otherDimension, of: view)
    }

    @discardableResult
    func autoMatch(
        _ dimension: ALDimension,
        to otherDimension: ALDimension,
        of view: UIView,
        withOffset offset: CGFloat) -> NSLayoutConstraint {

        return (self as LAP).autoMatch(
            dimension, to: otherDimension, of: view, withOffset: offset)
    }

    @discardableResult
    func autoMatch(
        _ dimension: ALDimension,
        to otherDimension: ALDimension,
        of view: UIView,
        withOffset offset: CGFloat,
        relation: NSLayoutConstraint.Relation) -> NSLayoutConstraint {

        return (self as LAP).autoMatch(
            dimension, to: otherDimension, of: view, withOffset: offset,
            relation: relation)
    }

    @discardableResult
    func autoMatch(
        _ dimension: ALDimension,
        to otherDimension: ALDimension,
        of view: UIView,
        withMultiplier multiplier: CGFloat) -> NSLayoutConstraint {

        return (self as LAP).autoMatch(
            dimension, to: otherDimension, of: view, withMultiplier: multiplier)
    }

    @discardableResult
    func autoMatch(
        _ dimension: ALDimension,
        to otherDimension: ALDimension,
        of view: UIView,
        withMultiplier multiplier: CGFloat,
        relation: NSLayoutConstraint.Relation) -> NSLayoutConstraint {

        return (self as LAP).autoMatch(
            dimension, to: otherDimension, of: view, withMultiplier: multiplier,
            relation: relation)
    }
}

public extension UIView { // Set Dimensions

    @discardableResult
    func autoSetDimensions(to size: CGSize) -> [NSLayoutConstraint] {
        return (self as LAP).autoSetDimensions(to: size)
    }

    @discardableResult
    func autoSetDimension(_ dimension: ALDimension, toSize size: CGFloat)
        -> NSLayoutConstraint {

        return (self as LAP).autoSetDimension(dimension, toSize: size)
    }

    @discardableResult
    func autoSetDimension(
        _ dimension: ALDimension,
        toSize size: CGFloat,
        relation: NSLayoutConstraint.Relation) -> NSLayoutConstraint {

        return (self as LAP).autoSetDimension(
            dimension, toSize: size, relation: relation)
    }
}

public extension UIView { // Content Compression Resistance & Hugging

    func autoSetContentCompressionResistancePriority(for axis: ALAxis) {
        translatesAutoresizingMaskIntoConstraints = false
        setContentCompressionResistancePriority(
            NSLayoutConstraint.currentPriority,
            for: axis.constraintAxis)
    }

    func autoSetContentHuggingPriority(for axis: ALAxis) {
        translatesAutoresizingMaskIntoConstraints = false
        setContentHuggingPriority(
            NSLayoutConstraint.currentPriority,
            for: axis.constraintAxis)
    }
}

public extension UIView { // Pin to Layout Guides

    @discardableResult
    func autoPin(
        toTopLayoutGuideOf viewController: UIViewController,
        withInset inset: CGFloat) -> NSLayoutConstraint {

        return (self as LAP).autoPin(
            toTopLayoutGuideOf: viewController, withInset: inset)
    }

    @discardableResult
    func autoPin(
        toTopLayoutGuideOf viewController: UIViewController,
        withInset inset: CGFloat,
        relation: NSLayoutConstraint.Relation) -> NSLayoutConstraint {

        return (self as LAP).autoPin(
            toTopLayoutGuideOf: viewController, withInset: inset, relation: relation)
    }

    @discardableResult
    func autoPin(
        toBottomLayoutGuideOf viewController: UIViewController,
        withInset inset: CGFloat) -> NSLayoutConstraint {

        return (self as LAP).autoPin(
            toBottomLayoutGuideOf: viewController, withInset: inset)
    }

    @discardableResult
    func autoPin(
        toBottomLayoutGuideOf viewController: UIViewController,
        withInset inset: CGFloat,
        relation: NSLayoutConstraint.Relation) -> NSLayoutConstraint {

        return (self as LAP).autoPin(
            toBottomLayoutGuideOf: viewController, withInset: inset,
            relation: relation)
    }
}
