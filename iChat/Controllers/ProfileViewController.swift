import SwiftUI
import UIKit

class ProfileViewController: UIViewController {

    let containerView = UIView()
    let imageView = UIImageView(image: UIImage(named: "human1"), contentMode: .scaleAspectFill)
    let nameLabel = UILabel(text: "Piter Ben", font: .systemFont(ofSize: 20, weight: .bold))
    let aboutMeLabel = UILabel(text: "You have the opportunity to chat with men of the world", font: .systemFont(ofSize: 16, weight: .light))
    let mytextField = InsertableTextField()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraints()
    }


}

extension ProfileViewController {
    private func setupConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutMeLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutMeLabel.numberOfLines = 0
        mytextField.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = UIColor(hex: "F7F8FD")
        containerView.layer.cornerRadius = 30

        view.addSubview(imageView)
        view.addSubview(containerView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(aboutMeLabel)
        containerView.addSubview(mytextField)

        NSLayoutConstraint.activate([
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 209)
        ])

        NSLayoutConstraint.activate([
            imageView.bottomAnchor.constraint(equalTo: containerView.topAnchor, constant: 30),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor)
        ])

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 35),
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24)
        ])

        NSLayoutConstraint.activate([
            aboutMeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            aboutMeLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            aboutMeLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24)
        ])

        NSLayoutConstraint.activate([
            mytextField.topAnchor.constraint(equalTo: aboutMeLabel.bottomAnchor, constant: 8),
            mytextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            mytextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            mytextField.heightAnchor.constraint(equalToConstant: 48)
        ])

        if let button = mytextField.rightView as? UIButton {
            button.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
        }
    }
    @objc func sendMessage() {
        print(#function)
    }
}






// MARK: - SwiftUI
struct ProfileViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().ignoresSafeArea()
    }


    struct ContainerView: UIViewControllerRepresentable {

        let viewController = ProfileViewController()

        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}
