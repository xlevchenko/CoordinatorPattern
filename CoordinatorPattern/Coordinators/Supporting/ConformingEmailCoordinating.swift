//
//  ConformingEmailCoordinating.swift
//  CoordinatorPattern
//
//  Created by Olexsii Levchenko on 08.11.2025.
//

import UIKit


protocol ConfirmEmailCoordinatin: BaseCoordinator<UINavigationController>, ConfirmEmailNavDelegate {}

//MARK: - Showing Screens
extension ConfirmEmailCoordinatin {
    
    func showConfirmEmailScreen() {
        let viewModel = ConfirmEmailView.ViewModel()
        viewModel.navDelegate = self
        
        let view = ConfirmEmailView(viewModel: viewModel)
        let controller = ConfirmEmailHostingController(rootView: view, viewModel: viewModel)
        presenter.pushViewController(controller, animated: true)
    }
}


