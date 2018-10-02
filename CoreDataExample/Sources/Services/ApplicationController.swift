import UIKit

final class ApplicationController {

    init(dependencies: ApplicationDependenciesProvider) {
        self.dependencies = dependencies
    }

    private let dependencies: ApplicationDependenciesProvider

    private(set) lazy var rootViewController: UINavigationController = {
        let viewController = TodosViewController(persistentContainer: dependencies.coreDataContainer
        )
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }()

    func saveContext() {
        dependencies.coreDataContainer.saveContext()
    }
    
}
