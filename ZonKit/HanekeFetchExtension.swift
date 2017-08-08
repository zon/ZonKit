//import Foundation
//import Haneke
//import PromiseKit
//
//public extension Fetch {
//    
//    public func promise() -> Promise<T> {
//        return Promise { (fulfill, reject) in
//            self.onSuccess { r in fulfill(r) }
//            self.onFailure { e in
//                if let e = e {
//                    reject(e)
//                } else {
//                    reject(FetchError.unknown)
//                }
//            }
//        }
//    }
//    
//}
//
//public enum FetchError : Error {
//    case unknown
//}
