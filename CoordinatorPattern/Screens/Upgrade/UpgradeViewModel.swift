//
//  UpgradeViewModel.swift
//  CoordinatorPattern
//
//  Created by Olexsii Levchenko on 19.11.2025.
//

import Foundation

protocol UpgradeViewNavDelegate: AnyObject {
    func onUpgradeClose()
}

extension UpgradeView {
    
    class ViewModel: BaseViewModel, ObservableObject {
        
        weak var navDelegate: UpgradeViewNavDelegate?
    }
}

//MARK: - Acctions
extension UpgradeView.ViewModel {
    
    func onCloseScreen() {
        navDelegate?.onUpgradeClose()
    }
}
