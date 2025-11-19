//
//  UpgradeHostingController.swift
//  CoordinatorPattern
//
//  Created by Olexsii Levchenko on 19.11.2025.
//

import UIKit

class UpgradeHostingController: HostingController<UpgradeView, UpgradeView.ViewModel> { }

//MARK: - Lifecycle
extension UpgradeHostingController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

//MARK: - View Setup/Configuration
extension UpgradeHostingController {
    func setupViews() {
        title = "Upgrade"
        setNavigationExitButton(target: self, selector: #selector(onExitTapped))
    }
}

//MARK: - Actions
extension UpgradeHostingController {
    @objc func onExitTapped() {
        viewModel.onCloseScreen()
    }
}
