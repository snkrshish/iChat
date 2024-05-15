import Foundation

protocol SelfConfigurateCell {
    static var reuseId: String { get }
    func configurate<U: Hashable>(with value: U)
}
