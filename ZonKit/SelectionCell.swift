import Foundation
import UIKit

public class SelectionCell : UICollectionViewCell {
    public let label: UILabel
    public let background: CALayer
    public var border: CALayer! = nil
    public let cornerRadius = CGFloat(4)
    
    public static let identifier = "selection-cell"
    public static let height: CGFloat = 60
    
    override public init(frame: CGRect) {
        let one = 1 / UIScreen.main.scale
        
        let margin = CGFloat(20)
        label = UILabel(frame: CGRect(x: margin, y: 0, width: frame.width - margin * 2, height: frame.height))
        label.font = UIFont.boldSystemFont(ofSize: 21)
        label.textAlignment = .left
        label.textColor = UIColor.black
        
        background = CALayer()
        background.frame.size = CGSize(width: frame.width, height: frame.height + cornerRadius)
        background.backgroundColor = UIColor.white.cgColor
        
        super.init(frame: frame)
        clipsToBounds = true
        
        border = addBottomBorder(width: one, color: UIColor.black.withAlphaComponent(0.3))
        
        layer.addSublayer(background)
        layer.addSublayer(border)
        addSubview(label)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func update(label labelText: String, index: Int, count: Int) {
        label.text = labelText
        
        if index == 0 {
            background.frame.origin.y = 0
            background.cornerRadius = cornerRadius
            border.isHidden = false
        
        } else if index + 1 >= count {
            background.frame.origin.y = -cornerRadius
            background.cornerRadius = cornerRadius
            border.isHidden = true
        
        } else {
            background.cornerRadius = 0
            border.isHidden = false
        }
    }
    
}
