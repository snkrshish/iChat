import UIKit


class ActiveChatsCell: UICollectionViewCell, SelfConfigurateCell {
    static var reuseId = "AvtiveChatCell"

    let friendImageView = UIImageView()
    let friendName = UILabel(text: "username", font: .laoSangamMN20())
    let lastMassage = UILabel(text: "How are you?", font: .laoSangamMN18())
    let gradientView = GradientView(from: .topTrailing, to: .bottomLeading, startColor: UIColor(hex: "C9A1F0"), endColor: UIColor(hex: "7AB2EB"))

    func configurate<U>(with value: U) where U : Hashable {
        guard let user: MChat = value as? MChat else { return }
        friendImageView.image = UIImage(named: user.userImageString)
        friendName.text = user.username
        lastMassage.text = user.lastMessage
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ActiveChatsCell {

    private func setupLayout() {
        friendImageView.translatesAutoresizingMaskIntoConstraints = false
        friendName.translatesAutoresizingMaskIntoConstraints = false
        lastMassage.translatesAutoresizingMaskIntoConstraints = false
        gradientView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(friendImageView)
        addSubview(gradientView)
        addSubview(lastMassage)
        addSubview(friendName)

        friendImageView.backgroundColor = .blue
        gradientView.backgroundColor = .red

        NSLayoutConstraint.activate([
            friendImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            friendImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            friendImageView.heightAnchor.constraint(equalToConstant: 78),
            friendImageView.widthAnchor.constraint(equalToConstant: 78)
        ])

        NSLayoutConstraint.activate([
            friendName.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            friendName.leadingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 16),
            friendName.trailingAnchor.constraint(equalTo: gradientView.leadingAnchor, constant: 16)
        ])

        NSLayoutConstraint.activate([
            lastMassage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -14),
            lastMassage.leadingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 16),
            lastMassage.trailingAnchor.constraint(equalTo: gradientView.leadingAnchor, constant: -16)

        ])

        NSLayoutConstraint.activate([
            gradientView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            gradientView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            gradientView.heightAnchor.constraint(equalToConstant: 78),
            gradientView.widthAnchor.constraint(equalToConstant: 8)
        ])
    }
}
