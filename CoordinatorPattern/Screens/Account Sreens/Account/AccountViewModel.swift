//
//  AccountViewModel.swift
//  CordinatorPattern
//
//  Created by Olexsii Levchenko on 02.11.2025.
//

import SwiftUI
import UIKit

protocol AccountNavDelegate: AnyObject {
    func onAccountBackTapped()
    func onAccountExitTapped()
    func onAccountEditTapped()
    func onAccountLogoutTapped()
}

extension AccountView {
    
    class ViewModel: BaseViewModel, ObservableObject {
        
        weak var navDelegate: AccountNavDelegate?
        
        var showExitButton = false
    }
}


//MARK: - Actions
extension AccountView.ViewModel {
    
    func onBackTapped() {
        navDelegate?.onAccountBackTapped()
    }
    
    func onExitTapped() {
        navDelegate?.onAccountExitTapped()
    }
    
    func onEditTapped() {
        navDelegate?.onAccountEditTapped()
    }
    
    func onLogoutTapped() {
        navDelegate?.onAccountLogoutTapped()
    }
}
