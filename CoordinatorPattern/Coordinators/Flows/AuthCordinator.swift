//
//  AuthCordinator.swift
//  CordinatorPattern
//
//  Created by Olexsii Levchenko on 01.11.2025.
//

import UIKit


protocol AuthCordinatorDelegate: AnyObject {
    func onAuthCordinationComplete(authCordinator: AuthCordinator)
}


class AuthCordinator: BaseCoordinator<UINavigationController>, ConfirmEmailCoordinatin {
    
    weak var delegate: AuthCordinatorDelegate?
    
    override func start() {
        showLoginScreen()
    }
}


//MARK: - Showing Screens
extension AuthCordinator {
    func showLoginScreen() {
        let viewModel = LoginView.ViewModel(userDefaults: userDefaults)
        viewModel.navDelegate = self
        
        let view = LoginView(viewModel: viewModel)
        let controller = HostingController(rootView: view, viewModel: viewModel)
        controller.title = "Login"
        
        presenter.setViewControllers( [controller], animated: false)
    }
    
    func showRegisterScreen() {
        let viewModel = RegisterView.ViewModel()
        viewModel.navDelegate = self
        
        let view = RegisterView(viewModel: viewModel)
        let controller = HostingController(rootView: view, viewModel: viewModel)
        controller.title = "Register"
        
        presenter.pushViewController(controller, animated: true)
    }
}

//MARK: - LoginNavDelegate
extension AuthCordinator: LoginNavDelegate {
    
    func onRegisterTapped() {
        showRegisterScreen()
    }
    
    func onLoginLoginSuccessfull() {
        delegate?.onAuthCordinationComplete(authCordinator: self)
    }
}


//MARK: - RegisterNavDelegate
extension AuthCordinator: RegisterNavDelegate {
    func onRegisterComplete() {
        showConfirmEmailScreen()
    }
    
    func onRegisterLoginTapped() {
        showLoginScreen()
    }
}

//MARK: - ConfirmEmailNavDelegate
extension AuthCordinator: ConfirmEmailNavDelegate {
    func onConfirmEmailSubmit() {
        showLoginScreen()
    }
    
    func onConfirmEmailBackButtonTapped() {
        presenter.popViewController(animated: true)
    }
}
