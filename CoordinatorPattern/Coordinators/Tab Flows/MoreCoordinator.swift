//
//  MoreCoordinator.swift
//  CordinatorPattern
//
//  Created by Olexsii Levchenko on 02.11.2025.
//

import UIKit
import SwiftUI

protocol MoreDelegate: AnyObject {
    func onMoreLogoutTapped(cordinator: MoreCoordinator)
}

class MoreCoordinator: BaseCoordinator<UINavigationController> {
    
    weak var delegate: MoreDelegate?
    
    override func start() {
        showMoreScreen()
    }
}


//MARK: - Showing Screens
private extension MoreCoordinator {
    
    func showMoreScreen() {
        let viewModel = MoreView.ViewModel()
        viewModel.navDelegate = self
        
        let view = MoreView(viewModel: viewModel)
        let controller = HostingController(rootView: view, viewModel: viewModel)
        controller.title = "More"
        
        presenter.setViewControllers([controller], animated: true)
    }
}


//MARK: - Starting Flows
private extension MoreCoordinator {
    
    func startAccountFlow() {
        let coordinator = AccountCoordinator(presenter: presenter)
        coordinator.delegate = self
        coordinator.start()
        
        store(coordinator: coordinator)
    }
}


//MARK: - MoreViewDelegate
extension MoreCoordinator: MoreViewDelegate {
    func onMoreViewAccountTapped() {
        startAccountFlow()
    }
    
    func onMoreViewLocationTapped() {
        
    }
    
    func onMoreViewUpgradeTapped() {
        
    }
}


//MARK: - AccountCoordinatorDelegate
extension MoreCoordinator: AccountCoordinatorDelegate {
    func onAccountCoordinatorComplete(coordinator: AccountCoordinator) {
        free(coordinator: coordinator)
    }
}
