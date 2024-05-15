//
//  ChatRequestViewController.swift
//  iChat
//
//  Created by Никита Шиляев on 14.05.2024.
//

import UIKit
import SwiftUI

class ChatRequestViewController: UIViewController {

    let containerView = UIView()
    let imageView = UIImageView(image: UIImage(named: "human1"), contentMode: .scaleAspectFill)
    let nameLabel = UILabel(text: "Piter Ben", font: .systemFont(ofSize: 20, weight: .bold))
    let aboutMeLabel = UILabel(text: "You have the opportunity to start new chat?", font: .systemFont(ofSize: 16, weight: .light))
    let accetptButton = UIButton(title: "ACCEPT", titleColor: .white, backgroundColor: .black, isShadow: true,font: .laoSangamMN20(), cornecRadius: 10)
    let denyButton = UIButton(title: "Deny", titleColor: UIColor(hex: "D53333")!, backgroundColor: UIColor(hex: "F7F8FD")!, isShadow: true,font: .laoSangamMN20(), cornecRadius: 10)



    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "F7F8FD")!
        customizedElements()
        setupConstraints()
    }
}

extension ChatRequestViewController {

    private func customizedElements() {
        denyButton.layer.borderWidth = 1.2
        denyButton.layer.borderColor = UIColor(hex: "D53333")?.cgColor

        containerView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutMeLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutMeLabel.numberOfLines = 0
        containerView.backgroundColor = UIColor(hex: "F7F8FD")
        containerView.layer.cornerRadius = 30

        view.addSubview(imageView)
        view.addSubview(containerView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(aboutMeLabel)
        containerView.addSubview(accetptButton)
        containerView.addSubview(denyButton)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.accetptButton.applyGradients(cornerRadius: 10)
    }

    private func setupConstraints() {

        let bottonsStackView = UIStackView(arrangedSubViews: [accetptButton, denyButton], axis: .horizontal, spacing: 7)
        bottonsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottonsStackView.distribution = .fillEqually
        containerView.addSubview(bottonsStackView)

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
            bottonsStackView.topAnchor.constraint(equalTo: aboutMeLabel.bottomAnchor, constant: 24),
            bottonsStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            bottonsStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            bottonsStackView.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
}







// MARK: - SwiftUI
struct ChatRequestViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().ignoresSafeArea()
    }


    struct ContainerView: UIViewControllerRepresentable {

        let viewController = ChatRequestViewController()

        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}
