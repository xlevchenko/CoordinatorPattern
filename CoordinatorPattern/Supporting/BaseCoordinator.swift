//
//  BaseCordinator.swift
//  CoordinatorPattern
//
//  Created by Olexsii Levchenko on 01.11.2025.
//

import UIKit

class BaseCoordinator<ControllerType> where ControllerType: UIViewController {
    
    let id = UUID()
    
    private(set) var childCoordinators = [UUID: Any]()
    
    var presenter: ControllerType
    
    init(presenter: ControllerType) {
        self.presenter = presenter
    }
    
    func start() {
        preconditionFailure("Start method not implemented")
    }
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
