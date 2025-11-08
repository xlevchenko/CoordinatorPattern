//
//  EditAccountViewModel.swift
//  CoordinatorPattern
//
//  Created by Olexsii Levchenko on 03.11.2025.
//

import Foundation

protocol EditAccountNavDelegate: AnyObject {
    func onEditAccountSubmitTapped(editEmail: Bool)
    func onEditAccountBackTapped()
}

extension EditAccountView {
    
    class ViewModel: BaseViewModel, ObservableObject {
        
        @Published var name = "Oleksii Levchenko"
        @Published var email = "realcarter50@gmail.com"
        
        weak var navDelegate: EditAccountNavDelegate?
    }
}

//MARK: - Action
extension EditAccountView.ViewModel {
    
    func onSubmit() {
        navDelegate?.onEditAccountSubmitTapped(editEmail: email != "realcarter50@gmail.com")
    }
    
    func onBackTapped() {
        navDelegate?.onEditAccountBackTapped()
    }
}
