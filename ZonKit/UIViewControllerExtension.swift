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
    
    func progress<T>(activities: [UIActivityIndicatorView], duration: TimeInterval = 0.25, _ promise: Promise<T>) {
        for activity in activities {
            activity.startAnimating()
            UIView.animate(withDuration: duration) { 
                activity.isHidden = false
            }
        }
        
        promise
            .catch { error in
                self.stop(activities: activities, duration: duration)
                AlertController.show(error: error)
            }
            .always { self.stop(activities: activities, duration: duration) }
    }
    
    func progress<T>(activity: UIActivityIndicatorView, duration: TimeInterval = 0.25, _ promise: Promise<T>) {
        progress(activities: [activity], duration: duration, promise)
    }
    
    private func stop(activities: [UIActivityIndicatorView], duration: TimeInterval) {
        for activity in activities {
            UIView.animate(withDuration: duration, animations: {
                activity.isHidden = true
            }, completion: { _ in
                activity.stopAnimating()
            })
        }
    }
    
    func currentQueueName() -> String? {
        let name = __dispatch_queue_get_label(nil)
        return String(cString: name, encoding: .utf8)
    }
    
    func present(_ viewControllerToPresent: UIViewController) {
        present(viewControllerToPresent, animated: true, completion: nil)
    }
    
}
