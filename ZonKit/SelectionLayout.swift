import Foundation
import UIKit

public class SelectionLayout : UIView {
    public let collection: UICollectionView
    
    required public init() {
        let frame = UIScreen.main.bounds
        let status = UIApplication.shared.statusBarFrame.height
        
        let margin = CGFloat(20)
        let width = frame.width - margin * 2
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: width, height: SelectionCell.height)
        
        collection = UICollectionView(frame: CGRect(
            x: margin,
            y: status + margin,
            width: width,
            height: frame.height - status - margin * 2
        ), collectionViewLayout: layout)
        collection.backgroundColor = UIColor.clear
        
        super.init(frame: frame)
        backgroundColor = UIColor(white: 0, alpha: 0.2)
        
        addSubview(collection)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func open() {
        alpha = 0
        UIView.animate(withDuration: 0.3) { 
            self.alpha = 1
        }
    }
    
    public func close(_ completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 0
        }) { (_) in
            completion()
        }
    }
    
}
