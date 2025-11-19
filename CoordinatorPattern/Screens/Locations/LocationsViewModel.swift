//
//  LocationsViewModel.swift
//  CoordinatorPattern
//
//  Created by Olexsii Levchenko on 19.11.2025.
//

import Foundation


protocol LocationsNavDelegate: AnyObject {
    func onLocationsBackTapped()
    func onLocationsShowUpgradeScreen()
    func onLocationsYourAccountScreen()
}

extension LocationsView {
    
    class ViewModel: BaseViewModel, ObservableObject {
        
        weak var navDelegate: LocationsNavDelegate?
        
        var showBackButton = false
        
    }
}

//MARK: - Acctions
extension LocationsView.ViewModel {
    func onBackTapped() {
        navDelegate?.onLocationsBackTapped()
    }
    
    func onTappedUpgrade() {
        navDelegate?.onLocationsShowUpgradeScreen()
    }
    
    func onYourAccountTapped() {
        navDelegate?.onLocationsYourAccountScreen()
    }
}
