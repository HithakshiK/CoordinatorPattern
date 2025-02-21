import UIKit

final class SpacerView: UIView {

    public override init(frame: CGRect) {
        super.init(frame: frame)
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public init(axis: NSLayoutConstraint.Axis) {
        super.init(frame: .zero)
        setContentCompressionResistancePriority(.defaultLow - 1, for: axis)
        setContentHuggingPriority(.defaultLow - 1, for: axis)
    }

    public init(space: CGFloat) {
        super.init(frame: .zero)
        autoSetDimensions(to: CGSize(width: space, height: space))
    }

    public init(max: CGFloat) {
        super.init(frame: .zero)
        autoSetDimension(.height, toSize: max, relation: .lessThanOrEqual)
        autoSetDimension(.width, toSize: max, relation: .lessThanOrEqual)
    }

    public init(min: CGFloat) {
        super.init(frame: .zero)
        autoSetDimension(.height, toSize: min, relation: .greaterThanOrEqual)
        autoSetDimension(.width, toSize: min, relation: .greaterThanOrEqual)
    }
}
