//
//  AccountHostingController.swift
//  CordinatorPattern
//
//  Created by Olexsii Levchenko on 02.11.2025.
//

import UIKit

class AccountHostingController: HostingController<AccountView,  AccountView.ViewModel> {}

extension AccountHostingController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}


//MARK: - View Setup/Configuration
private extension AccountHostingController {
    
    func setupViews() {
        title = "Account"
        
        if viewModel.showExitButton {
            setNavigationExitButton(target: self, selector: #selector(onExitButtonTapped))
        } else {
            setCustomBackButton(target: self, selector: #selector(onBackButtonTapped))
        }
    }
}

//MARK: - Actions
extension AccountHostingController {
    
    @objc func onBackButtonTapped() {
        viewModel.onBackTapped()
    }
    
    @objc func onExitButtonTapped() {
        viewModel.onExitTapped()
    }
}
