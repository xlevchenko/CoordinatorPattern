//
//  LocationsHostingController.swift
//  CoordinatorPattern
//
//  Created by Olexsii Levchenko on 19.11.2025.
//

import UIKit


class LocationsHostingController: HostingController<LocationsView, LocationsView.ViewModel> { }

//MARK: - Lifecycle
extension LocationsHostingController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

//MARK: - View Setup/Configuration
extension LocationsHostingController {
    func setupViews() {
        title = "Locations"
        
        let image = UIImage(systemName: "crown")?.withTintColor(.black, renderingMode: .alwaysTemplate)
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: image,
            style: .plain,
            target: self,
            action: #selector(onUpgradeTapped)
        )
        
        if viewModel.showBackButton {
            setNavigationExitButton(target: self, selector: #selector(onBackTapped))
        }
        
    }
}

//MARK: - Actions
extension LocationsHostingController {
    @objc func onBackTapped() {
        viewModel.onBackTapped()
    }
    
    @objc func onUpgradeTapped() {
        viewModel.onTappedUpgrade()
    }
}
