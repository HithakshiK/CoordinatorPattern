
import UIKit

public extension UIImage {

    class func crs_image(with color: UIColor) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)

        if #available(iOS 13, *) {
            return drawImage(rect: rect, color: color)
        } else {
            UIGraphicsBeginImageContext(rect.size)

            guard let context = UIGraphicsGetCurrentContext() else {
                return nil
            }

            context.setFillColor(color.cgColor)
            context.fill(rect)

            let image = UIGraphicsGetImageFromCurrentImageContext()

            UIGraphicsEndImageContext()

            return image
        }
    }

    func crs_image(with color: UIColor, size: CGFloat, radius: CGFloat) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: size, height: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, scale)

        UIBezierPath(roundedRect: rect, cornerRadius: radius).addClip()

        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }

        draw(in: rect)

        context.setFillColor(color.cgColor)
        context.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        return image
    }

    @available(iOS 13, *)
    private class func drawImage(rect: CGRect, color: UIColor) -> UIImage {
        let imageAsset = UIImageAsset()
        for trait in TraitCollections.styles {
            let image = UIGraphicsImageRenderer(size: rect.size).image { context in
                let updatedColor = color.resolvedColor(with: trait)
                updatedColor.setFill()
                context.fill(rect)
            }

            imageAsset.register(
                image,
                with: UITraitCollection(
                    traitsFrom: [
                        trait,
                        UITraitCollection(displayScale: image.scale)
                    ])
            )
        }
        return imageAsset.image(with: .current)
    }
}
