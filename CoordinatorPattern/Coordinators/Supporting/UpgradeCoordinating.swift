//
//  UpgradeCoordinating.swift
//  CoordinatorPattern
//
//  Created by Olexsii Levchenko on 19.11.2025.
//

import UIKit

protocol UpgradeCoordinating: BaseCoordinator<UINavigationController>, UpgradeViewNavDelegate { }

//MARK: - Showing Screen
extension UpgradeCoordinating {
    
    func showUpgradingScreen() {
        let viewModel = UpgradeView.ViewModel()
        viewModel.navDelegate = self
        
        let view = UpgradeView(viewModel: viewModel)
        
        let controller = UpgradeHostingController(rootView: view, viewModel: viewModel)
        let wrapper = UINavigationController(rootViewController: controller)
        
        presenter.present(wrapper, animated: true)
    }
}

//MARK: - UpgradeViewNavDelegate
extension UpgradeCoordinating {
    
    func onUpgradeClose() {
        presenter.dismiss(animated: true)
    }
}
