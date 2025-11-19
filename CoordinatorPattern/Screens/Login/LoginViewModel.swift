//
//  LoginViewModel.swift
//  CordinatorPattern
//
//  Created by Olexsii Levchenko on 01.11.2025.
//

import SwiftUI
import Combine

protocol LoginNavDelegate: AnyObject {
    func onRegisterTapped()
    func onLoginLoginSuccessfull()
}

extension LoginView {
    
    class ViewModel: BaseViewModel, ObservableObject {
        
        @Published var email: String = ""
        @Published var password: String = ""
        
        weak var navDelegate: LoginNavDelegate?
        
        var isValid: Bool {
            !email.isEmpty && !password.isEmpty
        }
        
        let userDefaults: UserDefaultsManager
        
        init(userDefaults: UserDefaultsManager) {
            self.userDefaults = userDefaults
        }
        
    }
}

extension LoginView.ViewModel {
    
    func onSubmitTapped() {
        userDefaults.isLoggedIn = true
        navDelegate?.onLoginLoginSuccessfull()
    }
    
    func onRegisterTapped() {
        navDelegate?.onRegisterTapped()
    }
}
