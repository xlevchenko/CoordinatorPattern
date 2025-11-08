//
//  ConfirmEmailHostingController.swift
//  CoordinatorPattern
//
//  Created by Olexsii Levchenko on 08.11.2025.
//

import UIKit

class ConfirmEmailHostingController: HostingController<ConfirmEmailView, ConfirmEmailView.ViewModel> { }

//MARK: - Lifecycle
extension ConfirmEmailHostingController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

//MARK: - View Setup/Configuration
extension ConfirmEmailHostingController {
    func setupViews() {
        title = "Confirm Email"
        setCustomBackButton(target: self, selector: #selector(onBackTapped))
    }
}

//MARK: - Actions
extension ConfirmEmailHostingController {
    @objc func onBackTapped() {
        viewModel.onBackTapped()
    }
}
