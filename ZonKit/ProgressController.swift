import Foundation
import UIKit

public class ProgressController : UIViewController {
    
    private static var current: ProgressController?
    private static var window: UIWindow?
    
    public static func show() {
        if current == nil {
            current = ProgressController()
            
            let win = UIWindow(frame: UIScreen.main.bounds)
            win.rootViewController = current
            win.backgroundColor = UIColor.black.withAlphaComponent(0.3)
            win.windowLevel = UIWindowLevelAlert + 1
            win.makeKeyAndVisible()
            window = win
        }
    }
    
    public static func hide() {
        window?.isHidden = true
        window = nil
        current = nil
    }
    
    override public func loadView() {
        let background = UIView(frame: UIScreen.main.bounds)
        
        let activity = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        activity.frame.origin = CGPoint(
            x: (background.frame.width - activity.frame.width) / 2,
            y: (background.frame.height - activity.frame.height) / 2
        )
        activity.startAnimating()
        background.addSubview(activity)
        
        view = background
    }
    
}
