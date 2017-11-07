import Foundation

public extension Array {
    
    public subscript (safe index: Int) -> Element? {
        return index < count ? self[index] : nil
    }
    
}
