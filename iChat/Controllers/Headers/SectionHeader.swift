import UIKit

class SectionHeader: UICollectionReusableView {

    static let reuseID = "SectionHeader"

    let title = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        title.translatesAutoresizingMaskIntoConstraints = false
        addSubview(title)

        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            title.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            title.topAnchor.constraint(equalTo: self.topAnchor)
        ])
    }

    func configurate(text: String, font: UIFont?, textColor: UIColor) {
        title.textColor = textColor
        title.text = text
        title.font = font
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
