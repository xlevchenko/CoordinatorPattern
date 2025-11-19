//
//  BaseCordinator.swift
//  CoordinatorPattern
//
//  Created by Olexsii Levchenko on 01.11.2025.
//

import UIKit

class BaseCoordinator<ControllerType> where ControllerType: UIViewController {
    
    private(set) var enbeddedInExistingNavStack = false
    
    let id = UUID()
    
    private(set) var childCoordinators = [UUID: Any]()
    
    var presenter: ControllerType
    var modelLayer: ModelLayer
    
    init(presenter: ControllerType, modelLayer: ModelLayer) {
        self.presenter = presenter
        self.modelLayer = modelLayer
        
        if let navController = presenter as? UINavigationController {
            enbeddedInExistingNavStack = navController.viewControllers.count > 0
        }
    }
    
    func start() {
        preconditionFailure("Start method not implemented")
    }
}


//MARK: - Convenience
extension BaseCoordinator {
    var userDefaults: UserDefaultsManager { modelLayer.systemLayer.userDefaults }
}

//MARK: - Child Coordinator Management

extension BaseCoordinator {
    
    func store<U: UIViewController>(coordinator: BaseCoordinator<U>) {
        let coordinatorExists = childCoordinators.contains(where: { $0.key == coordinator.id })
        
        if !coordinatorExists {
            childCoordinators[coordinator.id] = coordinator
        }
    }
    
    func free<U: UIViewController>(coordinator: BaseCoordinator<U>) {
        let coordinatorExists = childCoordinators.contains(where: { $0.key == coordinator.id })
        
        if coordinatorExists {
            childCoordinators[coordinator.id] = nil
        }
    }
    
    func freeAllChildCoordinators() {
        childCoordinators.removeAll()
    }
    
    func childCoordinator<T>(for key: UUID) -> T? {
        return childCoordinators.first(where: { $0.key == key })?.value as? T
    }
}


//MARK: - Utils
extension BaseCoordinator {
    
    func pushInitialControllerBasedOnEmbeddedNavState(controller: UIViewController) {
        guard let navController = presenter as? UINavigationController else {
            presenter.present(controller, animated: true)
            return
        }
        
        navController.pushViewController(controller, animated: enbeddedInExistingNavStack)
    }
}
