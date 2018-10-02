import Foundation

/// Describes a type that is providing application dependencies.
protocol ApplicationDependenciesProvider {
    var coreDataContainer: PersistentContainerProtocol { get }
}

final class DefaultApplicationDependenciesProvider: ApplicationDependenciesProvider {
    lazy var coreDataContainer: PersistentContainerProtocol = {
        PersistentContainer()
    }()
}
