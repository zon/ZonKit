import Foundation
import UIKit
import PromiseKit

public extension UIViewController {
    
    func progress<T>(_ promise: Promise<T>) {
        ProgressController.show()
        promise
            .catch { error in AlertController.show(error: error) }
            .always { ProgressController.hide() }
    }
    
    func currentQueueName() -> String? {
        let name = __dispatch_queue_get_label(nil)
        return String(cString: name, encoding: .utf8)
    }
    
    func present(_ viewControllerToPresent: UIViewController) {
        present(viewControllerToPresent, animated: true, completion: nil)
    }
    
}
