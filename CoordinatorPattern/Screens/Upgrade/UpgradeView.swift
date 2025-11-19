//
//  UpgradeView.swift
//  CoordinatorPattern
//
//  Created by Olexsii Levchenko on 19.11.2025.
//

import SwiftUI

struct UpgradeView: View {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Text("Would you like to upgrade your account?")
            
            Button("Upgrade Account") {
                viewModel.onCloseScreen()
            }
        }
    }
}

#Preview {
    UpgradeView(viewModel: .init())
}
