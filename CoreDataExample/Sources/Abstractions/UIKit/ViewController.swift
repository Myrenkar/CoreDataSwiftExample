import UIKit

class ViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupProperties()
        setupBindings()
        setupNavigationItem()
    }

    // MARK: - Setup

    func setupProperties() {}

    func setupBindings() {}

    func setupNavigationItem() {}

    // MARK: - Unavailable

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
