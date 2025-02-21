import Foundation

extension Array {
    subscript(safe index: Int) -> Element? {
        guard index >= 0, index < endIndex else {
            #if DEBUG
            assertionFailure("index out of bounds")
            #endif
            return nil
        }
        return self[index]
    }
}
