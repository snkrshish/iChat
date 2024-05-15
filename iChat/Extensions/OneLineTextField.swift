//
//  OneLineTextField.swift
//  iChat
//
//  Created by Никита Шиляев on 07.04.2024.
//

import UIKit

class OneLineTextField: UITextField {
    convenience init(font: UIFont? = .avenir20()) {
        self.init()

        self.font = font
        self.borderStyle = .none
        self.translatesAutoresizingMaskIntoConstraints = false

        var bottonView = UIView()
        bottonView = UIView.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        bottonView.backgroundColor = .systemGray5
        bottonView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(bottonView)

        NSLayoutConstraint.activate([
            bottonView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            bottonView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bottonView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bottonView.heightAnchor.constraint(equalToConstant: 1   )
        ])
    }
}
