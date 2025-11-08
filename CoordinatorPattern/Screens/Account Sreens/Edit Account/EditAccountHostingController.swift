//
//  EditAccountHostingController.swift
//  CoordinatorPattern
//
//  Created by Olexsii Levchenko on 08.11.2025.
//

import UIKit

class EditAccountHostingController: HostingController<EditAccountView, EditAccountView.ViewModel> {}


//MARK: - Lifecycle
extension EditAccountHostingController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

//MARK: - View Setup/Configuration
extension EditAccountHostingController {
    func setupViews() {
        title = "Edit Account"
        setCustomBackButton(target: self, selector: #selector(onBackTapped))
    }
}

//MARK: - Actions
extension EditAccountHostingController {
    @objc func onBackTapped() {
        viewModel.onBackTapped()
    }
}
