//
//  ApplicationCoordinator.swift
//  CordinatorPattern
//
//  Created by Olexsii Levchenko on 01.11.2025.
//

import UIKit
import SwiftUI

class ApplicationCoordinator: BaseCordinator<UINavigationController> {
    
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
        startMain()
    }
}


//MARK: - Showing Screens
extension ApplicationCoordinator {
    
    func startMain() {
        let view = MainView()
        let controller = UIHostingController(rootView: view)
        presenter.setViewControllers( [controller], animated: false)
    }
}
