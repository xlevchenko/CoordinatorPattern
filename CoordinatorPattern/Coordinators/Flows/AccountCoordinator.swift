//
//  AccountCoordinator.swift
//  CoordinatorPattern
//
//  Created by Olexsii Levchenko on 08.11.2025.
//

import UIKit

protocol AccountCoordinatorDelegate: AnyObject {
    func onAccountCoordinatorComplete(coordinator: AccountCoordinator)
}

class AccountCoordinator: BaseCoordinator<UINavigationController>, ConfirmEmailCoordinatin {
    
    weak var delegate: AccountCoordinatorDelegate?
    
    override func start() {        
        showAccountScreen()
    }
}



//MARK: - Showing Screens
extension AccountCoordinator {
    
    func showAccountScreen() {
        let viewModel = AccountView.ViewModel()
        viewModel.navDelegate = self
        viewModel.showExitButton = !enbeddedInExistingNavStack
        let view = AccountView(viewModel: viewModel)
        let controller = AccountHostingController(rootView: view, viewModel: viewModel)
        controller.hidesBottomBarWhenPushed = true
        
        pushInitialControllerBasedOnEmbeddedNavState(controller: controller)
    }
    
    
    func showEditAccountScreen() {
        let viewModel = EditAccountView.ViewModel()
        viewModel.navDelegate = self

        let view = EditAccountView(viewModel: viewModel)
        let controller = EditAccountHostingController(rootView: view, viewModel: viewModel)
        presenter.pushViewController(controller, animated: true)
    }
}

//MARK: - AccountNavDelegate
extension AccountCoordinator: AccountNavDelegate {
    
    func onAccountBackTapped() {
        presenter.popViewController(animated: true)
        delegate?.onAccountCoordinatorComplete(coordinator: self)
    }
    
    func onAccountExitTapped() {
        presenter.dismiss(animated: true)
        delegate?.onAccountCoordinatorComplete(coordinator: self)
    }
    
    func onAccountEditTapped() {
        showEditAccountScreen()
    }
    
    func onAccountLogoutTapped() {
        if !enbeddedInExistingNavStack {
            presenter.dismiss(animated: true) {
                NotificationCenter.default.post(name: .logout, object: nil)
            }
        } else {
            NotificationCenter.default.post(name: .logout, object: nil)
        }
    }
}

//MARK: - EditAccountNavDelegate
extension AccountCoordinator: EditAccountNavDelegate {
    func onEditAccountSubmitTapped(editEmail: Bool) {
        if editEmail {
            showConfirmEmailScreen()
        } else {
            presenter.popViewController(animated: true)
        }
    }
    
    func onEditAccountBackTapped() {
        presenter.popViewController(animated: true)
    }
}


//MARK: - ConfirmEmailCoordinatin
extension AccountCoordinator {
    func onConfirmEmailSubmit() {
        if let accountContainer = presenter.viewControllers.first(where: { $0 is AccountHostingController }) {
            presenter.popToViewController(accountContainer, animated: true)
        } else {
            presenter.popViewController(animated: true)
        }
    }
    
    func onConfirmEmailBackButtonTapped() {
        presenter.popViewController(animated: true)
    }
}
