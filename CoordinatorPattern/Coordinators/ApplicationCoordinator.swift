//
//  ApplicationCoordinator.swift
//  CordinatorPattern
//
//  Created by Olexsii Levchenko on 01.11.2025.
//

import Combine
import UIKit
import SwiftUI

class ApplicationCoordinator: BaseCoordinator<UINavigationController> {
    
    let logoutNotification = NotificationCenter.default.publisher(for: .logout)
    
    let window: UIWindow
    
    private var cancellables = Set<AnyCancellable>()
    
    init(window: UIWindow) {
        self.window = window
        
        let presenter = UINavigationController()
        presenter.isToolbarHidden = true
        
        super.init(presenter: presenter)
        
        self.window.rootViewController = presenter
        self.window.makeKeyAndVisible()
        
        configure()
    }
    
    override func start() {
        startAuth()
    }
    
    func logout() {
        startAuth()
    }
}


//MARK: - Configuration
private extension ApplicationCoordinator {
    func configure() {
        logoutNotification
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self else { return }
                logout()
            }
            .store(in: &cancellables)
    }
}

//MARK: - Showing Screens
extension ApplicationCoordinator {
    
    func startAuth() {
        let authCoordinator = AuthCordinator(presenter: presenter)
        authCoordinator.delegate = self
        authCoordinator.start()
        self.store(coordinator: authCoordinator)
    }
    
    func startMain() {
        let mainCoordinator = MainCoordinator(presenter: presenter)
        mainCoordinator.delegate = self
        mainCoordinator.start()
        self.store(coordinator: mainCoordinator)
    }
}


//MARK: - AuthCordinatorDelegate
extension ApplicationCoordinator: AuthCordinatorDelegate {
    func onAuthCordinationComplete(authCordinator: AuthCordinator) {
        startMain()
        self.free(coordinator: authCordinator)
    }
}


//MARK: - MainCoordinatorDelegate
extension ApplicationCoordinator: MainCoordinatorDelegate {
    func onMainCoordinationComplete(cordinator: MainCoordinator) {
        startAuth()
        self.free(coordinator: cordinator)
    }
}
