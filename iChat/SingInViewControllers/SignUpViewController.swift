//
//  SignUpViewController.swift
//  iChat
//
//  Created by Никита Шиляев on 07.04.2024.
//

import Foundation
import UIKit

class SingUpViewController: UIViewController {

    let welcomeLabel = UILabel(text: "Good to see you", font: .avenir26())
    let emailLabel = UILabel(text: "Email")
    let passwordLabel = UILabel(text: "Password")
    let confirmPasswordLabel = UILabel(text: "Confirm password")
    let alreadyOnboardLabel = UILabel(text: "Already onboard?")

    let singUpButton = UIButton(title: "Sing Up", titleColor: .white, backgroundColor: .black)
    let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.titleLabel?.font = .avenir20()
        return button
    }()

    let emailTextField = OneLineTextField(font: .avenir20())
    let passwordTextField = OneLineTextField(font: .avenir20())
    let confirmTextField = OneLineTextField(font: .avenir20())


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstrains()
    }
}

//MARK: - setup Constrains
extension SingUpViewController {
   private func setupConstrains() {
       let emailStackView = UIStackView(arrangedSubViews: [emailLabel, emailTextField], axis: .vertical, spacing: 0)
       let passwordStackView = UIStackView(arrangedSubViews: [passwordLabel, passwordTextField], axis: .vertical, spacing: 0)
       let confirmPasswordStackView = UIStackView(arrangedSubViews: [confirmPasswordLabel, confirmTextField], axis: .vertical, spacing: 0)

       singUpButton.heightAnchor.constraint(equalToConstant: 60).isActive = true

       let stackView = UIStackView(arrangedSubViews: [emailStackView, passwordStackView, confirmPasswordStackView,singUpButton],
                                   axis: .vertical,
                                   spacing: 40)
       loginButton.contentHorizontalAlignment = .leading
       let bottonStackView = UIStackView(arrangedSubViews: [alreadyOnboardLabel, loginButton], axis: .horizontal, spacing: 10)
       bottonStackView.alignment = .firstBaseline

       welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
       stackView.translatesAutoresizingMaskIntoConstraints = false
       bottonStackView.translatesAutoresizingMaskIntoConstraints = false

       view.addSubview(welcomeLabel)
       view.addSubview(stackView)
       view.addSubview(bottonStackView)

       NSLayoutConstraint.activate([
        welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 160),
        welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
       ])

       NSLayoutConstraint.activate([
        stackView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 100),
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
       ])

       NSLayoutConstraint.activate([
        bottonStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 60),
        bottonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
        bottonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
       ])
    }
}






//MARK: - SwiftUI preview
import SwiftUI

struct SingUpViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().ignoresSafeArea()
    }


    struct ContainerView: UIViewControllerRepresentable {

        let viewController = SingUpViewController()

        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}

