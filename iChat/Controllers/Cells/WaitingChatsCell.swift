import UIKit

class WaitingChatsCell: UICollectionViewCell, SelfConfigurateCell {

    static var reuseId = "WaitingChatCell"

    let friendImageView = UIImageView()

    func configurate<U>(with value: U) where U : Hashable {
        guard let user: MChat = value as? MChat else { return }
        friendImageView.image = UIImage(named: user.userImageString)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
        setupLayout()
    }

    private func setupLayout() {
        addSubview(friendImageView)

        friendImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            friendImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            friendImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            friendImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            friendImageView.topAnchor.constraint(equalTo: self.topAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
