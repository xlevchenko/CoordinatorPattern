//
//  BaseCordinator.swift
//  CordinatorPattern
//
//  Created by Olexsii Levchenko on 01.11.2025.
//

import UIKit

class BaseCordinator<ControllerType> where ControllerType: UIViewController {
    
    let id = UUID()
    
    private(set) var childCordinators = [UUID: Any]()
    
    var presenter: ControllerType
    
    init(presenter: ControllerType) {
        self.presenter = presenter
    }
    
    func start() {
        preconditionFailure("Start method not implemented")
    }
}


//MARK: - Child Coordinator Management

extension BaseCordinator {
    
    func store<U: UIViewController>(coordinator: BaseCordinator<U>) {
        let coordinatorExists = childCordinators.contains(where: { $0.key == coordinator.id })
        
        if !coordinatorExists {
            childCordinators[coordinator.id] = coordinator
        }
    }
    
    func free<U: UIViewController>(coordinator: BaseCordinator<U>) {
        let coordinatorExists = childCordinators.contains(where: { $0.key == coordinator.id })
        
        if coordinatorExists {
            childCordinators[coordinator.id] = nil
        }
    }
    
    func freeAllChildCoordinators() {
        childCordinators.removeAll()
    }
    
    func childCoordinator<T>(for key: UUID) -> T? {
        return childCordinators.first(where: { $0.key == key })?.value as? T
    }
}
