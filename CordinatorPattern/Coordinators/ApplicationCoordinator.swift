//
//  ApplicationCoordinator.swift
//  CordinatorPattern
//
//  Created by Olexsii Levchenko on 01.11.2025.
//

import UIKit
import SwiftUI

class ApplicationCoordinator: BaseCoordinator<UINavigationController> {
    
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
        
        let presenter = UINavigationController()
        presenter.isToolbarHidden = true
        
        super.init(presenter: presenter)
        
        self.window.rootViewController = presenter
        self.window.makeKeyAndVisible()
    }
    
    override func start() {
        startAuth()
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
        
    }
}

extension ApplicationCoordinator: AuthCordinatorDelegate {
    func onAuthCordinationComplete(authCordinator: AuthCordinator) {
        startMain()
        self.free(coordinator: authCordinator)
    }
}
