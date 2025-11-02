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
    
    func showAccountScreen() {
        let viewModel = AccountView.ViewModel()
        viewModel.navDelegate = self
        
        let view = AccountView(viewModel: viewModel)
        let controller = AccountHostingController(rootView: view, viewModel: viewModel)
        controller.hidesBottomBarWhenPushed = true
        
        presenter.pushViewController(controller, animated: true)
    }
}


//MARK: - MoreViewDelegate
extension MoreCoordinator: MoreViewDelegate {
    func onMoreViewAccountTapped() {
        showAccountScreen()
    }
    
    func onMoreViewLocationTapped() {
        
    }
    
    func onMoreViewUpgradeTapped() {
        
    }
}

extension MoreCoordinator: AccountNavDelegate {
    
    func onAccountBackTapped() {
        presenter.popViewController(animated: true)
    }
    
    func onAccountExitTapped() {
        
    }
    
    func onAccountEditTapped() {
        
    }
    
    func onAccountLogoutTapped() {
        delegate?.onMoreLogoutTapped(cordinator: self)
    }
}
