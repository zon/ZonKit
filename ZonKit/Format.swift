import Foundation

public class Format {
    
    private static var _jsonDate: DateFormatter?
    
    public static var jsonDate: DateFormatter {
        if (_jsonDate == nil) {
            _jsonDate = DateFormatter()
            _jsonDate!.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'SSSZZ"
        }
        return _jsonDate!
    }
    
    public static func dollars(_ cents: Int) -> String {
        if cents % 100 == 0 {
            return "$\(cents / 100)"
        } else {
            return String(format: "$%02d", Double(cents) / 100.0)
        }
    }
    
}
