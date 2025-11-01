//
//  HostingController.swift
//  CordinatorPattern
//
//  Created by Olexsii Levchenko on 01.11.2025.
//

import SwiftUI
import UIKit

class HostingController<Content: View, VM: BaseViewModel>: UIHostingController<Content> {
    
    var viewModel: VM
    
    init(rootView: Content, viewModel: VM) {
        self.viewModel = viewModel
        super.init(rootView: rootView)
        viewModel.hostingController = self
    }
    
    @MainActor @preconcurrency required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
