//
//  Copyright © 2019 Carousell. All rights reserved.
//

import UIKit

extension UIImage {
    func resize(to size: CGSize, scaleFactor: CGFloat = 1.0) -> UIImage? {
        guard self.size != size else { return self }

        UIGraphicsBeginImageContextWithOptions(size, false, scaleFactor)
        draw(in: CGRect(origin: .zero, size: size))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }
}
