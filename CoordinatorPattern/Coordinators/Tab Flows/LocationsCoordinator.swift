//
//  LocationsCoordinator.swift
//  CordinatorPattern
//
//  Created by Olexsii Levchenko on 02.11.2025.
//

import UIKit
import SwiftUI

protocol LocationsCoordinatorDelegate: AnyObject {
    func onLocationCoordinatorComplete(coordinator: LocationsCoordinator)
}

class LocationsCoordinator: BaseCoordinator<UINavigationController>, UpgradeCoordinating {
    
    weak var delegate: LocationsCoordinatorDelegate?
    
    override func start() {
        showLocationScreen()
    }
}


//MARK: - Showing Screens
private extension LocationsCoordinator {
    
    func showLocationScreen() {
        let viewModel = LocationsView.ViewModel()
        viewModel.navDelegate = self
        viewModel.showBackButton = enbeddedInExistingNavStack
        
        let view = LocationsView(viewModel: viewModel)
        let controller = LocationsHostingController(rootView: view, viewModel: viewModel)
        controller.title = "Locations"
        
       pushInitialControllerBasedOnEmbeddedNavState(controller: controller)
    }
}

//MARK: - Starting Flows
private extension LocationsCoordinator {
    
    func startAccountFlow(delegate: AccountCoordinatorDelegate) {
        let accountPresenter = UINavigationController()
        
        let coordinator = AccountCoordinator(presenter: accountPresenter, modelLayer: modelLayer)
        coordinator.delegate = delegate
        coordinator.start()
        
        presenter.present(accountPresenter, animated: true)
        store(coordinator: coordinator)
    }
}


//MARK: - Actions
extension LocationsCoordinator: LocationsNavDelegate {
    func onLocationsBackTapped() {
        presenter.popViewController(animated: true)
        delegate?.onLocationCoordinatorComplete(coordinator: self)
    }
    
    func onLocationsShowUpgradeScreen() {
        showUpgradingScreen()
    }
    
    func onLocationsYourAccountScreen() {
        startAccountFlow(delegate: self)
    }
}

extension LocationsCoordinator: AccountCoordinatorDelegate {
    func onAccountCoordinatorComplete(coordinator: AccountCoordinator) {
        self.free(coordinator: coordinator)
    }
    
}
