//
//  RegisterViewModel.swift
//  CordinatorPattern
//
//  Created by Olexsii Levchenko on 01.11.2025.
//

import Combine
import SwiftUI

protocol RegisterNavDelegate: AnyObject {
    func onRegisterComplete()
    func onRegisterLoginTapped()
}

extension RegisterView {
    
    class ViewModel: BaseViewModel, ObservableObject {
        
        @Published var email = ""
        @Published var password = ""
        @Published var congigurationPassword = ""
        
        
        @Published var showAlert = false
        var alertTitle = ""
        var alertMassage = ""
        var registrationSeccessfull = false
        
        weak var navDelegate: RegisterNavDelegate?
    }
}


//MARK: - Action
extension RegisterView.ViewModel {
    func onRegisterTapped() {
        registrationSeccessfull = true
        alertTitle = "Registration Successfull!"
        alertMassage = "An Activation email has been sent to \(email)"
        showAlert = true
    }
    
    func onLoginTapped() {
        navDelegate?.onRegisterLoginTapped()
    }
}
