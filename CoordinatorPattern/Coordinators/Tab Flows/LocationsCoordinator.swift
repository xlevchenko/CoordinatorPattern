//
//  LocationsCoordinator.swift
//  CordinatorPattern
//
//  Created by Olexsii Levchenko on 02.11.2025.
//

import UIKit
import SwiftUI

class LocationsCoordinator: BaseCoordinator<UINavigationController> {
    
    override func start() {
        showLocationScreen()
    }
}


//MARK: - Showing Screens
private extension LocationsCoordinator {
    
    func showLocationScreen() {
        let view = LocationsView()
        let controller = UIHostingController(rootView: view)
        controller.title = "Locations"
        
        presenter.setViewControllers([controller], animated: true)
    }
}
