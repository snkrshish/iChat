
import UIKit

extension UIViewController {
    func configurate<T: SelfConfigurateCell, U: Hashable>(collectionView: UICollectionView, cellType: T.Type, value: U, for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseId, for: indexPath) as? T else { fatalError("Unable to dequeue \(cellType)") }
        cell.configurate(with: value)
        return cell
    }
}
