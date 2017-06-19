import Foundation
import UIKit

public class SelectionController : UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    public let options: [String]
    public let layout = SelectionLayout()
    
    private var onSelect: ((Int) -> Void)?
    
    public var collection: UICollectionView {
        return layout.collection
    }
    
    required public init(options: [String]) {
        self.options = options
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func attach(parent: UIViewController, onSelect: @escaping (Int) -> Void) {
        self.onSelect = onSelect
        parent.addChildViewController(self)
        parent.view.addSubview(view)
        self.didMove(toParentViewController: parent)
        layout.open()
    }
    
    public func close() {
        layout.close() {
            self.view.removeFromSuperview()
            self.removeFromParentViewController()
        }
    }
    
    override public func loadView() {
        view = layout
        
        collection.register(SelectionCell.self, forCellWithReuseIdentifier: SelectionCell.identifier)
        collection.dataSource = self
        collection.delegate = self
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        collection.reloadData()
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return options.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let height = collectionView.frame.height
        let inset = (height - SelectionCell.height * CGFloat(options.count)) / 2
        return UIEdgeInsets(top: inset, left: 0, bottom: inset, right: 0)
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let option = options[indexPath.item]
        let cell = layout.collection.dequeueReusableCell(withReuseIdentifier: SelectionCell.identifier, for: indexPath as IndexPath) as! SelectionCell
        cell.update(label: option, index: indexPath.item, count: options.count)
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onSelect?(indexPath.item)
        close()
    }
    
}
