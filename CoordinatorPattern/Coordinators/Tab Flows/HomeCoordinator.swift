//
//  HomeCoordinator.swift
//  CordinatorPattern
//
//  Created by Olexsii Levchenko on 02.11.2025.
//

import UIKit
import SwiftUI

class HomeCoordinator: BaseCoordinator<UINavigationController> {
    
    override func start() {
        showHomeScreen()
    }
}

//MARK: - Showing Screens
extension HomeCoordinator {
    
    func showHomeScreen() {
        let view = HomeView()
        let controller = UIHostingController(rootView: view)
        controller.title = "Home"
        
        presenter.setViewControllers([controller], animated: false)
    }
}
