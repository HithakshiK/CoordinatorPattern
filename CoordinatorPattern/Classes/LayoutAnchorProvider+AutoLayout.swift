//
//  Copyright © 2019 Carousell. All rights reserved.
//

import UIKit

public extension LayoutAnchorProvider { // Center & Align in Superview

    @discardableResult
    func autoCenterInSuperview() -> [NSLayoutConstraint] {
        return [
            autoAlignAxis(toSuperviewAxis: .horizontal),
            autoAlignAxis(toSuperviewAxis: .vertical)
        ].compactMap { $0 }
    }

    @discardableResult
    func autoCenter(container: LayoutAnchorProvider) -> [NSLayoutConstraint] {
        return [
            autoAlignAxis(.horizontal, toSameAxisOf: container),
            autoAlignAxis(.vertical, toSameAxisOf: container)
        ].compactMap { $0 }
    }

    @discardableResult
    func autoAlignAxis(toSuperviewAxis axis: ALAxis) -> NSLayoutConstraint? {
        guard let superview = superview else { return nil }
        return autoAlignAxis(axis, toSameAxisOf: superview)
    }

    @discardableResult
    func autoCenterInSuperviewMargins() -> [NSLayoutConstraint] {
        return [
            autoAlignAxis(toSuperviewMarginAxis: .horizontal),
            autoAlignAxis(toSuperviewMarginAxis: .vertical)
        ].compactMap { $0 }
    }

    @discardableResult
    func autoAlignAxis(toSuperviewMarginAxis axis: ALAxis)
        -> NSLayoutConstraint? {

        guard let guide = superview?.layoutMarginsGuide else { return nil }
        return autoAlignAxis(axis, toSameAxisOf: guide)
    }
}

public extension LayoutAnchorProvider { // Pin Edges to SafeArea

    @discardableResult
    func autoPinEdge(
        toSuperviewSafeArea edge: ALEdge,
        withInset inset: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal
    ) -> NSLayoutConstraint? {
        guard let superview = superview else { return nil }
        let anchorProvider = superview.safeAreaLayoutGuide
        let mapped = mapContainer(edge: edge, inset: inset, relation: relation)

        return autoPinEdge(
            edge, to: edge, of: anchorProvider, withOffset: mapped.offset,
            relation: mapped.relation)
    }

    @discardableResult
    func autoPinEdgesToSuperviewSafeArea(
        with insets: UIEdgeInsets = .zero,
        excludingEdge: ALEdge? = nil) -> [NSLayoutConstraint] {

        let edgeToInset = insets.edgeToInset(excludingEdge: excludingEdge)
        return edgeToInset.compactMap {
            autoPinEdge(toSuperviewSafeArea: $0.edge, withInset: $0.inset)
        }
    }
}

public extension LayoutAnchorProvider { // Pin Edges to Superview

    @discardableResult
    func autoPinEdge(
        toSuperviewEdge edge: ALEdge,
        withInset inset: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint? {

        guard let superview = superview else { return nil }
        let mapped = mapContainer(edge: edge, inset: inset, relation: relation)

        return autoPinEdge(
            edge, to: edge, of: superview, withOffset: mapped.offset,
            relation: mapped.relation)
    }

    @discardableResult
    func autoPinEdge(
        container: LayoutAnchorProvider,
        edge: ALEdge,
        inset: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint? {

        let mapped = mapContainer(edge: edge, inset: inset, relation: relation)
        return autoPinEdge(
            edge, to: edge, of: container, withOffset: mapped.offset,
            relation: mapped.relation)
    }

    @discardableResult
    func autoPinEdgesToSuperviewEdges(
        with insets: UIEdgeInsets = .zero,
        excludingEdge: ALEdge? = nil) -> [NSLayoutConstraint] {

        let edgeToInset = insets.edgeToInset(excludingEdge: excludingEdge)
        return edgeToInset.compactMap {
            autoPinEdge(toSuperviewEdge: $0.edge, withInset: $0.inset)
        }
    }

    @discardableResult
    func autoPinEdges(
        container: LayoutAnchorProvider,
        insets: UIEdgeInsets = .zero,
        excludingEdge: ALEdge? = nil) -> [NSLayoutConstraint] {

        let edgeToInset = insets.edgeToInset(excludingEdge: excludingEdge)
        return edgeToInset.compactMap {
            autoPinEdge(container: container, edge: $0.edge, inset: $0.inset)
        }
    }

    @discardableResult
    func autoPinEdge(
        toSuperviewMargin edge: ALEdge,
        withInset inset: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint? {

        guard let guide = superview?.layoutMarginsGuide else { return nil }
        let mapped = mapContainer(edge: edge, inset: inset, relation: relation)

        return autoPinEdge(
            edge, to: edge, of: guide, withOffset: mapped.offset,
            relation: mapped.relation)
    }

    @discardableResult
    func autoPinEdgesToSuperviewMargins(with insets: UIEdgeInsets = .zero)
        -> [NSLayoutConstraint] {

        let edgeToInset = insets.edgeToInset()
        return edgeToInset.compactMap {
            autoPinEdge(toSuperviewMargin: $0.edge, withInset: $0.inset)
        }
    }

    @discardableResult
    func autoPinEdges(toSuperviewMarginsExcludingEdge excludingEdge: ALEdge)
        -> [NSLayoutConstraint] {

        let edges: [ALEdge] = [.top, .leading, .bottom, .trailing].filter {
            $0 != excludingEdge.toLeadingTrailing()
        }
        return edges.compactMap { autoPinEdge(toSuperviewMargin: $0) }
    }

    @discardableResult
    func autoPin(
        toSuperview edges: ALEdge...,
        with size: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal) -> [NSLayoutConstraint] {

        return edges.compactMap {
            autoPinEdge(toSuperviewEdge: $0, withInset: size, relation: relation)
        }
    }
}

public extension LayoutAnchorProvider { // Pin Edges

    @discardableResult
    func autoPinEdge(
        _ edge: ALEdge,
        to otherEdge: ALEdge,
        of view: LayoutAnchorProvider,
        withOffset offset: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint? {

        translatesAutoresizingMaskIntoConstraints = false

        if let anchor = xAxisAnchor(for: edge),
            let otherAnchor = view.xAxisAnchor(for: otherEdge) {

            return anchor.constraint(
                otherAnchor: otherAnchor,
                constant: offset,
                relation: relation)
        }
        if let anchor = yAxisAnchor(for: edge),
            let otherAnchor = view.yAxisAnchor(for: otherEdge) {

            return anchor.constraint(
                otherAnchor: otherAnchor,
                constant: offset,
                relation: relation)
        }
        return nil
    }
}

public extension LayoutAnchorProvider { // Align Axes

    @discardableResult
    func autoAlignAxis(
        _ axis: ALAxis,
        toSameAxisOf view: LayoutAnchorProvider,
        withOffset offset: CGFloat = 0) -> NSLayoutConstraint? {

        translatesAutoresizingMaskIntoConstraints = false

        if let anchor = xAxisAnchor(for: axis),
            let otherAnchor = view.xAxisAnchor(for: axis) {

            return anchor.constraint(otherAnchor: otherAnchor, constant: offset)
        }
        if let anchor = yAxisAnchor(for: axis),
            let otherAnchor = view.yAxisAnchor(for: axis) {

            return anchor.constraint(otherAnchor: otherAnchor, constant: offset)
        }
        return nil
    }

    @discardableResult
    func autoAlignAxis(
        _ axis: ALAxis,
        toSameAxisOf view: LayoutAnchorProvider,
        withMultiplier multiplier: CGFloat) -> NSLayoutConstraint {

        translatesAutoresizingMaskIntoConstraints = false

        let constraint = NSLayoutConstraint(
            item: self,
            attribute: axis.attribute,
            relatedBy: .equal,
            toItem: view,
            attribute: axis.attribute,
            multiplier: multiplier,
            constant: 0)
        constraint.priority = NSLayoutConstraint.currentPriority
        constraint.isActive = true
        return constraint
    }
}

public extension LayoutAnchorProvider { // Match Dimensions

    @discardableResult
    func autoMatch(
        _ dimension: ALDimension,
        to otherDimension: ALDimension,
        of view: LayoutAnchorProvider,
        withMultiplier multiplier: CGFloat = 1,
        withOffset offset: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {

        translatesAutoresizingMaskIntoConstraints = false
        return anchor(for: dimension).constraint(
            otherAnchor: view.anchor(for: otherDimension),
            multiplier: multiplier,
            constant: offset,
            relation: relation)
    }
}

public extension LayoutAnchorProvider { // Set Dimensions

    @discardableResult
    func autoSetDimensions(to size: CGSize) -> [NSLayoutConstraint] {
        return [
            autoSetDimension(.width, toSize: size.width),
            autoSetDimension(.height, toSize: size.height)
        ]
    }

    @discardableResult
    func autoSetDimension(
        _ dimension: ALDimension,
        toSize size: CGFloat,
        relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {

        translatesAutoresizingMaskIntoConstraints = false
        return anchor(for: dimension).constraint(constant: size, relation: relation)
    }
}

public extension LayoutAnchorProvider { // Pin to Layout Guides

    @discardableResult
    func autoPin(
        toTopLayoutGuideOf viewController: UIViewController,
        withInset inset: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {

        translatesAutoresizingMaskIntoConstraints = false
        return topAnchor.constraint(
            otherAnchor: viewController.view.safeAreaLayoutGuide.topAnchor,
            constant: inset,
            relation: relation)
    }

    @discardableResult
    func autoPin(
        toBottomLayoutGuideOf viewController: UIViewController,
        withInset inset: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {

        translatesAutoresizingMaskIntoConstraints = false
        return bottomAnchor.constraint(
            otherAnchor: viewController.view.safeAreaLayoutGuide.bottomAnchor,
            constant: -inset,
            relation: relation.reversed)
    }
}

private extension NSLayoutConstraint.Relation {
    var reversed: NSLayoutConstraint.Relation {
        switch self {
        case .greaterThanOrEqual:
            return .lessThanOrEqual
        case .lessThanOrEqual:
            return .greaterThanOrEqual
        case .equal:
            return .equal
        @unknown default:
            fatalError("Case not handled")
        }
    }
}

private func mapContainer(
    edge: ALEdge,
    inset: CGFloat,
    relation: NSLayoutConstraint.Relation)
    -> (offset: CGFloat, relation: NSLayoutConstraint.Relation) {

    switch edge {
    case .bottom, .right, .trailing:
        return (-inset, relation.reversed)
    default:
        return (inset, relation)
    }
}
