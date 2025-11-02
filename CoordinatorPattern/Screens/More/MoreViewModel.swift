//
//  MoreViewModel.swift
//  CordinatorPattern
//
//  Created by Olexsii Levchenko on 02.11.2025.
//

import SwiftUI
import UIKit

protocol MoreViewDelegate: AnyObject {
    func onMoreViewAccountTapped()
    func onMoreViewLocationTapped()
    func onMoreViewUpgradeTapped()
}

extension MoreView {
    
    class ViewModel: BaseViewModel, ObservableObject {
        
        weak var navDelegate: MoreViewDelegate?
        
    }
}


//MARK: - Action
extension MoreView.ViewModel {
    func onAccountTapped() {
        navDelegate?.onMoreViewAccountTapped()
    }
    
    func onLocationTapped() {
        navDelegate?.onMoreViewLocationTapped()
    }
    
    func onUpgradeTapped() {
        navDelegate?.onMoreViewUpgradeTapped()
    }
}
