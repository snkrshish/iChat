import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()


        let listViewController = PeopleViewController()
        let peopleViewController = ListViewController()

        let boldConfing = UIImage.SymbolConfiguration(weight: .medium)
        let peopleImage = UIImage(systemName: "person.2", withConfiguration: boldConfing)
        let convImage = UIImage(systemName: "bubble.left.and.bubble.right", withConfiguration: boldConfing)

        viewControllers = [
            generateNavigationController(rootViewController: listViewController, title: "People", image: peopleImage!),
            generateNavigationController(rootViewController: peopleViewController, title: "Conversations", image: convImage!)
        ]
    }

    private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
}
