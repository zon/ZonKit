import Foundation
import UIKit

public extension CGRect {
    
    init(x: CGFloat, y: CGFloat, size: CGSize) {
        self.init(origin: CGPoint(x: x, y: y), size: size)
    }
    
    init(x: Double, y: Double, size: CGSize) {
        self.init(origin: CGPoint(x: x, y: y), size: size)
    }
    
    init(x: Int, y: Int, size: CGSize) {
        self.init(origin: CGPoint(x: x, y: y), size: size)
    }
    
}

public func * (left: CGRect, right: CGFloat) -> CGRect {
    return CGRect(
        origin: left.origin * right,
        size: left.size * right
    )
}
