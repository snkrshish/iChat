import SwiftUI
import UIKit

class AuthViewController: UIViewController {

    let logoView = UIImageView(image: UIImage(named: "Logo"), contentMode: .scaleAspectFill)

    let getStartedLabel = UILabel(text: "Get started with")
    let singUpLabel = UILabel(text: "Or sing up with")
    let alreadyOnboardLabel = UILabel(text: "Already onboard?")

    let googleButton = UIButton(title: "Google", titleColor: .black, backgroundColor: .white, isShadow: true)
    let emailButton = UIButton(title: "Email", titleColor: .white, backgroundColor: .black)
    let loginButton = UIButton(title: "Login", titleColor: .red, backgroundColor: .white, isShadow: true)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstrains()
        googleButton.customizeGoogleButton()
    }
}


//MARK: - setup constrains
extension AuthViewController {
    private func setupConstrains() {
        logoView.translatesAutoresizingMaskIntoConstraints = false


        let googleView = ButtonFromView(label: getStartedLabel, button: googleButton)
        let emailView = ButtonFromView(label: singUpLabel, button: emailButton)
        let loginView = ButtonFromView(label: alreadyOnboardLabel, button: loginButton)

        let stackView = UIStackView(arrangedSubViews: [googleView, emailView, loginView],axis: .vertical, spacing: 40)
        stackView.translatesAutoresizingMaskIntoConstraints  = false

        view.addSubview(logoView)
        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            logoView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            logoView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 100),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])

    }
}





//MARK: - SwiftUI preview
struct ViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().ignoresSafeArea()
    }


    struct ContainerView: UIViewControllerRepresentable {

        let viewController = AuthViewController()

        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}

